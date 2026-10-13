const fs = require('fs');
const path = require('path');

const playerPath = path.join(__dirname, 'FlashPlayer.exe');
const swfPath = path.join(__dirname, 'imperium_modded.swf');
const outputPath = path.join(__dirname, 'The_Imperium_Mod.exe');

if (!fs.existsSync(playerPath)) {
    console.error('FlashPlayer.exe not found!');
    process.exit(1);
}

if (!fs.existsSync(swfPath)) {
    console.error('imperium_modded.swf not found!');
    process.exit(1);
}

const playerBuf = fs.readFileSync(playerPath);
const swfBuf = fs.readFileSync(swfPath);

// Flash Projector binary footer layout:
// Magic marker 0xFA123456 (4 bytes Little Endian)
// SWF length (4 bytes Little Endian)
const footer = Buffer.alloc(8);
footer.writeUInt32LE(0xFA123456, 0);
footer.writeUInt32LE(swfBuf.length, 4);

const standaloneExe = Buffer.concat([playerBuf, swfBuf, footer]);
fs.writeFileSync(outputPath, standaloneExe);

console.log('Successfully packaged The_Imperium_Mod.exe! File size: ' + standaloneExe.length + ' bytes');

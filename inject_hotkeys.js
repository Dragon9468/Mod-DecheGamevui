const fs = require('fs');
const path = require('path');

const f129Path = path.join(__dirname, 'decompiled_scripts', 'scripts', 'frame_129', 'DoAction.as');
let f129 = fs.readFileSync(f129Path, 'utf8');

const hotkeyInject = `
      if(Key.isDown(112)) {
         _root.moneyKota[_root.pilihKota] += 50000;
         _root.foodKota[_root.pilihKota] += 50000;
         _root.ironKota[_root.pilihKota] += 50000;
         _root.woodKota[_root.pilihKota] += 50000;
         _root.xcekInfo();
      }
      if(Key.isDown(113)) {
         _root.soldierKota[_root.pilihKota] += 100;
         _root.horseKota[_root.pilihKota] += 100;
         _root.catapultKota[_root.pilihKota] += 100;
         _root.witchKota[_root.pilihKota] += 100;
         _root.elephantKota[_root.pilihKota] += 100;
         _root.xsuperKota[_root.pilihKota] += 100;
         _root.swordKota[_root.pilihKota] += 200;
         _root.xarrowKota[_root.pilihKota] += 200;
         _root.spearKota[_root.pilihKota] += 200;
         _root.fireKota[_root.pilihKota] += 200;
         _root.coalKota[_root.pilihKota] += 500;
         _root.xcekInfo();
      }
      if(Key.isDown(114)) {
         _root.delayHari = 300;
         clearInterval(_root.dayDelay);
         _root.dayDelay = setInterval(_root.dayItung, _root.delayHari);
      }
`;

f129 = f129.replace(
    '   if(xpause == false)\r\n   {\r\n      xcekInfo();\r\n   }',
    '   if(xpause == false)\r\n   {\r\n      xcekInfo();' + hotkeyInject + '   }'
);

fs.writeFileSync(f129Path, f129, 'utf8');
console.log('Injected cheat hotkeys into frame_129 successfully!');

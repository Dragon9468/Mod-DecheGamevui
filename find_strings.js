const fs = require('fs');
const path = require('path');

function walk(dir) {
  let res = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    const full = path.join(dir, file);
    const stat = fs.statSync(full);
    if (stat.isDirectory()) {
      res = res.concat(walk(full));
    } else if (file.endsWith('.as')) {
      res.push(full);
    }
  });
  return res;
}

const files = walk(path.join(__dirname, 'decompiled_scripts', 'scripts'));
const results = {};

files.forEach(f => {
  const content = fs.readFileSync(f, 'utf8');
  const relPath = path.relative(__dirname, f);
  
  // Find strings in quotes
  const matches = content.match(/"([^"\r\n]{4,})"/g);
  if (matches) {
    matches.forEach(m => {
      const s = m.slice(1, -1);
      // Filter out code symbols, identifiers, variable names
      if (s.includes(' ') && /[a-zA-Z]/.test(s) && !s.startsWith('_') && !s.includes('++') && !s.includes('==')) {
        if (!results[relPath]) results[relPath] = [];
        if (!results[relPath].includes(s)) results[relPath].push(s);
      }
    });
  }
});

console.log('Files with user-facing text:');
for (const [file, list] of Object.entries(results)) {
  console.log(`\n=== ${file} (${list.length} strings) ===`);
  list.slice(0, 10).forEach(s => console.log('  * ' + s));
}

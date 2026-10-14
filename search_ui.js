const fs = require('fs');
const path = require('path');

function searchTexts(dir) {
  for (const f of fs.readdirSync(dir)) {
    const full = path.join(dir, f);
    if (fs.statSync(full).isDirectory()) {
      searchTexts(full);
    } else if (f.endsWith('.as')) {
      const c = fs.readFileSync(full, 'utf8');
      const lines = c.split('\n');
      lines.forEach((l, idx) => {
        if (/\"[^\"]*(Select|Click|TIPS|TUTORIAL|Quit|Surrender|Resume|Options|Difficulty|Hard|Easy|Normal|Day|Gold|Food|Wood|Iron|Soldier|Battle|Attack|Defend|Victory|Defeat|Game Over|Load|Save|Slot|Cancel|Confirm|Yes|No)[^\"]*/i.test(l)) {
          console.log(path.relative(__dirname, full) + ':' + (idx+1) + ': ' + l.trim());
        }
      });
    }
  }
}

searchTexts(path.join(__dirname, 'decompiled_scripts', 'scripts'));

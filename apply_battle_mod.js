const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'decompiled_scripts', 'scripts', 'frame_130', 'DoAction.as');
let code = fs.readFileSync(filePath, 'utf8');

console.log('Original frame_130 length:', code.length);

// 1. Khởi tạo các biến mod tại hàm init2()
code = code.replace(
    'function init2()\r\n{',
    'function init2()\r\n{\r\n   _root.weaponConsumed_sword = 0;\r\n   _root.weaponConsumed_arrow = 0;\r\n   _root.weaponConsumed_spear = 0;\r\n   _root.weaponConsumed_fire = 0;\r\n   _root.weaponConsumed_coal = 0;'
);

// 2. Định nghĩa hàm xử lý tiêu hao vũ khí khi kẻ địch bị tiêu diệt
const helperFunctions = `
function onEnemyKilledByWeapon(weapType, mult)
{
   if(mult == undefined || mult <= 0) mult = 1;
   if(weapType == 1) { _root.weaponConsumed_sword += 1 * mult; }
   else if(weapType == 2) { _root.weaponConsumed_arrow += 1 * mult; }
   else if(weapType == 3) { _root.weaponConsumed_spear += 1 * mult; }
   else if(weapType == 4) { _root.weaponConsumed_fire += 1 * mult; }
   else if(weapType == 5) { _root.weaponConsumed_coal += 10 * mult; }
}
`;

code = code.replace(
    'function buatMusuh()',
    helperFunctions + '\r\nfunction buatMusuh()'
);

// 3. Cập nhật thông số lính ta và siêu lính trong masukSoldier(acak, indi1)
// Cập nhật HP, Tốc độ, Cơ chế ưu tiên hàng sau, và Dmg

// Tìm và thay thế logic lính siêu cấp (jenisSoldier[i] == 6)
code = code.replace(
    `      soldier.jenisan = 6;\r
      soldier.tipe = 1;\r
      soldier.range = 20;\r
      soldier.speed = random(4) + 4;\r
      soldier.speed3 = random(4) + 4;\r
      soldier.damage = 1.25;\r
      soldier.armor = 200;`,
    `      soldier.jenisan = 6;\r
      soldier.tipe = 1;\r
      soldier.range = 15;\r
      soldier.speed = random(6) + 4;\r
      soldier.speed3 = random(4) + 4;\r
      soldier.damage = 4;\r
      soldier.targetBackline = true;\r
      soldier.armor = 200;`
);

// Lính Kiếm thường (jenisPasukan 1, jenisSoldier 1): dmg 2
code = code.replace(
    `            soldier.damage = 0.05;\r
            soldier.armor = 50;`,
    `            soldier.damage = 2;\r
            soldier.armor = 50;`
);

// Lính Ngựa kiếm (jenisPasukan 1, jenisSoldier 2): dmg 2, speed nhanh, ưu tiên hàng sau
code = code.replace(
    `            soldier.damage = 0.1;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`,
    `            soldier.damage = 2;\r
            soldier.speed = random(8) + 5;\r
            soldier.targetBackline = true;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`
);

// Voi kiếm (jenisPasukan 1, jenisSoldier 5): dmg 2
code = code.replace(
    `            soldier.damage = 0.25;\r
            soldier.armor = 450;`,
    `            soldier.damage = 2;\r
            soldier.armor = 450;`
);

// Cung thường (jenisPasukan 2, jenisSoldier 1): dmg 2
code = code.replace(
    `            soldier.damage = 0.06;\r
            soldier._xscale = soldier._yscale = 85;\r
            soldier.armor = 50;`,
    `            soldier.damage = 2;\r
            soldier._xscale = soldier._yscale = 85;\r
            soldier.armor = 50;`
);

// Ngựa cung (jenisPasukan 2, jenisSoldier 2): dmg 2, ưu tiên hàng sau
code = code.replace(
    `            soldier.damage = 0.12;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`,
    `            soldier.damage = 2;\r
            soldier.speed = random(8) + 5;\r
            soldier.targetBackline = true;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`
);

// Pháo đá loại 1 (jenisPasukan 2, jenisSoldier 3): dmg 20
code = code.replace(
    `            soldier.damage = 0.8;\r
            soldier.armor = 25;`,
    `            soldier.damage = 20;\r
            soldier.armor = 25;`
);

// Voi cung (jenisPasukan 2, jenisSoldier 5): dmg 2
code = code.replace(
    `            soldier.damage = 0.24;\r
            soldier.armor = 450;`,
    `            soldier.damage = 2;\r
            soldier.armor = 450;`
);

// Giáo thường (jenisPasukan 3, jenisSoldier 1): dmg 4
code = code.replace(
    `            soldier.damage = 0.07;\r
            soldier.armor = 50;`,
    `            soldier.damage = 4;\r
            soldier.armor = 50;`
);

// Ngựa giáo (jenisPasukan 3, jenisSoldier 2): dmg 4, ưu tiên hàng sau
code = code.replace(
    `            soldier.damage = 0.14;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`,
    `            soldier.damage = 4;\r
            soldier.speed = random(8) + 5;\r
            soldier.targetBackline = true;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`
);

// Pháo giáo (jenisPasukan 3, jenisSoldier 3): dmg 20
code = code.replace(
    `            soldier.damage = 0.85;\r
            soldier.armor = 25;`,
    `            soldier.damage = 20;\r
            soldier.armor = 25;`
);

// Voi giáo (jenisPasukan 3, jenisSoldier 5): dmg 4
code = code.replace(
    `            soldier.damage = 0.28;\r
            soldier.armor = 450;`,
    `            soldier.damage = 4;\r
            soldier.armor = 450;`
);

// Cung lửa thường (jenisPasukan 4, jenisSoldier 1): dmg 4
code = code.replace(
    `            soldier.damage = 0.06;\r
            soldier.armor = 50;`,
    `            soldier.damage = 4;\r
            soldier.armor = 50;`
);

// Ngựa cung lửa (jenisPasukan 4, jenisSoldier 2): dmg 4, ưu tiên hàng sau
code = code.replace(
    `            soldier.damage = 0.12;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`,
    `            soldier.damage = 4;\r
            soldier.speed = random(8) + 5;\r
            soldier.targetBackline = true;\r
            soldier._xscale = soldier._yscale = 110;\r
            soldier.armor = 100;`
);

// Pháo lửa (jenisPasukan 4, jenisSoldier 3): dmg 20
code = code.replace(
    `            soldier.damage = 0.9;\r
            soldier.armor = 25;`,
    `            soldier.damage = 20;\r
            soldier.armor = 25;`
);

// Voi cung lửa (jenisPasukan 4, jenisSoldier 5): dmg 4
code = code.replace(
    `            soldier.damage = 0.24;\r
            soldier.armor = 450;`,
    `            soldier.damage = 4;\r
            soldier.armor = 450;`
);

// Pháo than (jenisPasukan 5, jenisSoldier 3): dmg 20
code = code.replace(
    `            soldier.damage = 1;\r
            soldier.armor = 25;`,
    `            soldier.damage = 20;\r
            soldier.armor = 25;`
);

// Bình thuốc phù thủy:
// Băng (jenisPasukan 6): 2 dmg
code = code.replace(
    `            soldier.damage = 0.15;\r
            soldier.armor = 25;`,
    `            soldier.damage = 2;\r
            soldier.armor = 25;`
);

// Lửa (jenisPasukan 7): 4 dmg
code = code.replace(
    `            soldier.damage = 0.2;\r
            soldier.armor = 25;`,
    `            soldier.damage = 4;\r
            soldier.armor = 25;`
);

// Độc (jenisPasukan 8): 1 dmg
code = code.replace(
    `            soldier.damage = 0.25;\r
            soldier.armor = 25;`,
    `            soldier.damage = 1;\r
            soldier.armor = 25;`
);

// Bão lốc (jenisPasukan 9): 2 dmg
code = code.replace(
    `            soldier.damage = 0.3;\r
            soldier.armor = 25;`,
    `            soldier.damage = 2;\r
            soldier.armor = 25;`
);

// Động đất (jenisPasukan 10): 2 dmg
code = code.replace(
    `            soldier.damage = 0.35;\r
            soldier.armor = 25;`,
    `            soldier.damage = 2;\r
            soldier.armor = 25;`
);

// Gán HP cho từng loại lính khi vào trận:
// Lính thường (jenisSoldier 1): 2 hp
// Ngựa (jenisSoldier 2): 2 hp
// Pháo (jenisSoldier 3): 2 hp
// Phù thủy (jenisSoldier 4): 1 hp
// Voi (jenisSoldier 5): 4 hp
// Siêu cấp (jenisSoldier 6): 4 hp
code = code.replace(
    '   soldier.nyawa = bawah["batalion" + i].jml;',
    `   var unitHp = 2;\r
   if(jenisSoldier[i] == 1) { unitHp = 2; }\r
   else if(jenisSoldier[i] == 2) { unitHp = 2; }\r
   else if(jenisSoldier[i] == 3) { unitHp = 2; }\r
   else if(jenisSoldier[i] == 4) { unitHp = 1; }\r
   else if(jenisSoldier[i] == 5) { unitHp = 4; }\r
   else if(jenisSoldier[i] == 6) { unitHp = 4; }\r
   soldier.nyawa = bawah["batalion" + i].jml * unitHp;\r
   soldier.maxUnitHp = unitHp;`
);

// 4. Cơ chế chọn mục tiêu ưu tiên hàng sau cho Ngựa và Siêu lính:
// Trong enterSoldier(), khi tìm mục tiêu mới:
const targetLogicOld = `            if(keHidup > 0)\r
            {\r
               this.serang = false;\r
               randKe = random(keHidup);\r
               this.xtarget = masihHidup[randKe];`;

const targetLogicNew = `            if(keHidup > 0)\r
            {\r
               this.serang = false;\r
               if(this.targetBackline == true)\r
               {\r
                  var bestBackTarget = masihHidup[0];\r
                  var maxBackX = -9999;\r
                  var hi = 0;\r
                  while(hi < keHidup)\r
                  {\r
                     var cand = masihHidup[hi];\r
                     var candX = _root["soldier2_mc" + cand]._x;\r
                     if(candX > maxBackX)\r
                     {\r
                        maxBackX = candX;\r
                        bestBackTarget = cand;\r
                     }\r
                     hi++;\r
                  }\r
                  this.xtarget = bestBackTarget;\r
               }\r
               else\r
               {\r
                  randKe = random(keHidup);\r
                  this.xtarget = masihHidup[randKe];\r
               }`;

code = code.replace(targetLogicOld, targetLogicNew);

// 5. Cập nhật sát thương cận chiến và hiệu ứng độc, tiêu hao vũ khí:
// Đoạn: _root["soldier2_mc" + this.xtarget].nyawa -= this.damage;
const meleeHitOld = `            if(this.tipe == 1)\r
            {\r
               _root["soldier2_mc" + this.xtarget].nyawa -= this.damage;\r
            }`;

const meleeHitNew = `            if(this.tipe == 1)\r
            {\r
               var tgt = _root["soldier2_mc" + this.xtarget];\r
               var prevNyawa = tgt.nyawa;\r
               var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
               tgt.nyawa -= (this.damage + dmgBonus);\r
               if(prevNyawa > 0 && tgt.nyawa <= 0)\r
               {\r
                  _root.onEnemyKilledByWeapon(this.jenisPasukan, 1);\r
               }\r
            }`;

code = code.replace(meleeHitOld, meleeHitNew);

// 6. Cập nhật các hàm đạn và phép (enterAnak, enterAnak2, enterBatu, enterSihir1..5)
// enterAnak (Cung tên thường: 2 dmg chuẩn)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekDarah1(_root["soldier2_mc" + this.xtarget]);\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 15;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekDarah1(tgt);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (2 + dmgBonus);\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(2, 1); }\r
      removeMovieClip(this);\r
   }`
);

// enterAnak2 (Cung lửa / Pháo lửa: 4 dmg, tiêu hao cung lửa)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekApi(_root["soldier2_mc" + this.xtarget]);\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 30;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekApi(tgt);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (4 + dmgBonus);\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(4, 1); }\r
      removeMovieClip(this);\r
   }`
);

// enterBatu & enterBatu2: Đạn than pháo 20 dmg, tiêu hao x10
code = code.replace(
    `   if(this.hitTest(_root["soldier_mc" + this.xtarget]))\r
   {\r
      cekDarah1(_root["soldier_mc" + this.xtarget]);\r
      _root["soldier_mc" + this.xtarget].nyawa -= this.damage * 20;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier_mc" + this.xtarget];\r
      cekDarah1(tgt);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (20 + dmgBonus);\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(5, 10); }\r
      removeMovieClip(this);\r
   }`
);

// enterSihir1 (Băng: 2 dmg + chậm tốc chạy, tốc đánh)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekAir(_root["soldier2_mc" + this.xtarget]);\r
      xrand = random(100);\r
      if(xrand < 15)\r
      {\r
         cekAir2(_root["soldier2_mc" + this.xtarget]);\r
      }\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 15;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekAir(tgt);\r
      cekAir2(tgt);\r
      tgt.speed = Math.max(1, tgt.speed * 0.5);\r
      tgt.speed3 = Math.max(1, tgt.speed3 * 0.5);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (2 + dmgBonus);\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(6, 1); }\r
      removeMovieClip(this);\r
   }`
);

// enterSihir2 (Lửa: 4 dmg)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekDarah(_root["soldier2_mc" + this.xtarget]);\r
      cekApi(_root["soldier2_mc" + this.xtarget]);\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 15;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekDarah(tgt);\r
      cekApi(tgt);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (4 + dmgBonus);\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(7, 1); }\r
      removeMovieClip(this);\r
   }`
);

// enterSihir3 (Độc: 1 dmg + cộng dồn stack độc, +1 dmg mỗi lần bị đánh bởi bất kỳ vũ khí nào)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekDarah(_root["soldier2_mc" + this.xtarget]);\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 20;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekDarah(tgt);\r
      if(tgt.poisonStacks == undefined) tgt.poisonStacks = 0;\r
      tgt.poisonStacks += 1;\r
      var prevNyawa = tgt.nyawa;\r
      tgt.nyawa -= (1 + tgt.poisonStacks);\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(8, 1); }\r
      removeMovieClip(this);\r
   }`
);

// enterSihir4 (Bão lốc: 2 dmg + khiến kẻ địch đổi mục tiêu sang đồng minh khác ưu tiên hàng trước)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekDarah(_root["soldier2_mc" + this.xtarget]);\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 20;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekDarah(tgt);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (2 + dmgBonus);\r
      var frontTarget = -1;\r
      var maxFrontX = -9999;\r
      var fi = 1;\r
      while(fi <= 20)\r
      {\r
         var ally = _root["soldier_mc" + fi];\r
         if(ally != undefined && ally.nyawa > 0 && ally._x > maxFrontX)\r
         {\r
            maxFrontX = ally._x;\r
            frontTarget = fi;\r
         }\r
         fi++;\r
      }\r
      if(frontTarget != -1) { tgt.xtarget = frontTarget; }\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(9, 1); }\r
      removeMovieClip(this);\r
   }`
);

// enterSihir5 (Động đất: 2 dmg + lan 1 dmg lên 2 kẻ địch khác)
code = code.replace(
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      cekDarah(_root["soldier2_mc" + this.xtarget]);\r
      _root["soldier2_mc" + this.xtarget].nyawa -= this.damage * 20;\r
      removeMovieClip(this);\r
   }`,
    `   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))\r
   {\r
      var tgt = _root["soldier2_mc" + this.xtarget];\r
      cekDarah(tgt);\r
      var prevNyawa = tgt.nyawa;\r
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);\r
      tgt.nyawa -= (2 + dmgBonus);\r
      var splashCount = 0;\r
      var si = 1;\r
      while(si <= 20 && splashCount < 2)\r
      {\r
         var otherTgt = _root["soldier2_mc" + si];\r
         if(si != this.xtarget && otherTgt != undefined && otherTgt.nyawa > 0)\r
         {\r
            otherTgt.nyawa -= 1;\r
            splashCount++;\r
         }\r
         si++;\r
      }\r
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(10, 1); }\r
      removeMovieClip(this);\r
   }`
);

// 7. Thu hồi vũ khí khi kết thúc trận:
// Khấu trừ số vũ khí đã tiêu hao do giết địch khỏi pedangSisa, panahSisa, tombakSisa, apiSisa, coalSisa
const endDeduction = `
   pedangSisa = Math.max(0, pedangSisa - _root.weaponConsumed_sword);
   panahSisa = Math.max(0, panahSisa - _root.weaponConsumed_arrow);
   tombakSisa = Math.max(0, tombakSisa - _root.weaponConsumed_spear);
   apiSisa = Math.max(0, apiSisa - _root.weaponConsumed_fire);
   coalSisa = Math.max(0, coalSisa - _root.weaponConsumed_coal);
`;

code = code.replace(
    '   end.jagoan1 = xjmlPasukan1 - xjmlSisa1;',
    endDeduction + '\r\n   end.jagoan1 = xjmlPasukan1 - xjmlSisa1;'
);

// Cập nhật tính số lính sống sót: chia lại cho unitHp
code = code.replace(
    `         if(jenisSoldier[i] == 1)\r
         {\r
            jmlSisa1 = _root["soldier_mc" + i].nyawa;\r
         }\r
         else if(jenisSoldier[i] == 2)\r
         {\r
            jmlSisa2 = _root["soldier_mc" + i].nyawa;\r
         }\r
         else if(jenisSoldier[i] == 3)\r
         {\r
            jmlSisa3 = _root["soldier_mc" + i].nyawa;\r
         }\r
         else if(jenisSoldier[i] == 4)\r
         {\r
            jmlSisa4 = _root["soldier_mc" + i].nyawa;\r
         }\r
         else if(jenisSoldier[i] == 5)\r
         {\r
            jmlSisa5 = _root["soldier_mc" + i].nyawa;\r
         }\r
         else if(jenisSoldier[i] == 6)\r
         {\r
            jmlSisa6 = _root["soldier_mc" + i].nyawa;\r
         }`,
    `         var sHp = _root["soldier_mc" + i].maxUnitHp;\r
         if(sHp == undefined || sHp <= 0) sHp = 1;\r
         if(jenisSoldier[i] == 1)\r
         {\r
            jmlSisa1 = _root["soldier_mc" + i].nyawa / sHp;\r
         }\r
         else if(jenisSoldier[i] == 2)\r
         {\r
            jmlSisa2 = _root["soldier_mc" + i].nyawa / sHp;\r
         }\r
         else if(jenisSoldier[i] == 3)\r
         {\r
            jmlSisa3 = _root["soldier_mc" + i].nyawa / sHp;\r
         }\r
         else if(jenisSoldier[i] == 4)\r
         {\r
            jmlSisa4 = _root["soldier_mc" + i].nyawa / sHp;\r
         }\r
         else if(jenisSoldier[i] == 5)\r
         {\r
            jmlSisa5 = _root["soldier_mc" + i].nyawa / sHp;\r
         }\r
         else if(jenisSoldier[i] == 6)\r
         {\r
            jmlSisa6 = _root["soldier_mc" + i].nyawa / sHp;\r
         }`
);

fs.writeFileSync(filePath, code, 'utf8');
console.log('Modified frame_130 successfully! New length:', code.length);

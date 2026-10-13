function init2()
{
   _root.weaponConsumed_sword = 0;
   _root.weaponConsumed_arrow = 0;
   _root.weaponConsumed_spear = 0;
   _root.weaponConsumed_fire = 0;
   _root.weaponConsumed_coal = 0;
   dalamBawah = 1000;
   dalamSoldier = 3000;
   dalamSoldier2 = 4000;
   dalamDarah = 5000;
   dalamDarah2 = 10;
   dalamKecil = 9000;
   dalamAnakPanah = 8000;
   dalamEnd = 50000;
   sedangDrag = false;
   zpause = false;
   indi1 = 1;
   indi2 = 1;
   xjml = 10;
   jmlJagoan = 0;
   jmlMusuh = 0;
}

function onEnemyKilledByWeapon(weapType, mult)
{
   if(mult == undefined || mult <= 0) mult = 1;
   if(weapType == 1) { _root.weaponConsumed_sword += 1 * mult; }
   else if(weapType == 2) { _root.weaponConsumed_arrow += 1 * mult; }
   else if(weapType == 3) { _root.weaponConsumed_spear += 1 * mult; }
   else if(weapType == 4) { _root.weaponConsumed_fire += 1 * mult; }
   else if(weapType == 5) { _root.weaponConsumed_coal += 10 * mult; }
}

function buatMusuh()
{
   jenisPasukan2 = new Array();
   angka = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
   zi = 1;
   while(zi <= xjml)
   {
      acak = random(angka.length);
      acak2 = angka[acak];
      angka[acak] = null;
      angka.sort();
      angka.pop();
      zcity = 0;
      i = 1;
      while(i <= bykKota)
      {
         if(punyaWilayah[i] == jenisKerajaan)
         {
            zcity++;
         }
         i++;
      }
      wcity = 0;
      if(tingkatSulit == 1)
      {
         if(day <= 200)
         {
            wcity = 1;
         }
         else if(day <= 450)
         {
            wcity = 2;
         }
         else if(day <= 700)
         {
            wcity = 3;
         }
         else if(day <= 950)
         {
            wcity = 4;
         }
         else if(day <= 1200)
         {
            wcity = 5;
         }
         else if(day <= 1450)
         {
            wcity = 6;
         }
         else
         {
            wcity = 7;
         }
         if(zcity > wcity)
         {
            vcity = zcity;
         }
         else
         {
            vcity = wcity;
         }
         if(vcity == 1)
         {
            jenisPasukan2[zi] = random(2) + 1;
         }
         if(vcity == 2)
         {
            jenisPasukan2[zi] = random(2) + 1;
         }
         if(vcity == 3)
         {
            jenisPasukan2[zi] = random(3) + 1;
         }
         if(vcity == 4)
         {
            jenisPasukan2[zi] = random(3) + 1;
         }
         if(vcity == 5)
         {
            jenisPasukan2[zi] = random(4) + 1;
         }
         if(vcity == 6)
         {
            jenisPasukan2[zi] = random(4) + 1;
         }
         if(vcity >= 7)
         {
            jenisPasukan2[zi] = random(5) + 1;
         }
      }
      else if(tingkatSulit == 2)
      {
         if(day <= 200)
         {
            wcity = 1;
         }
         else if(day <= 400)
         {
            wcity = 2;
         }
         else if(day <= 600)
         {
            wcity = 3;
         }
         else if(day <= 800)
         {
            wcity = 4;
         }
         else if(day <= 1000)
         {
            wcity = 5;
         }
         else if(day <= 1200)
         {
            wcity = 6;
         }
         else
         {
            wcity = 7;
         }
         if(zcity > wcity)
         {
            vcity = zcity;
         }
         else
         {
            vcity = wcity;
         }
         if(vcity == 1)
         {
            jenisPasukan2[zi] = random(2) + 1;
         }
         if(vcity == 2)
         {
            jenisPasukan2[zi] = random(2) + 1;
         }
         if(vcity == 3)
         {
            jenisPasukan2[zi] = random(3) + 1;
         }
         if(vcity == 4)
         {
            jenisPasukan2[zi] = random(4) + 1;
         }
         if(vcity == 5)
         {
            jenisPasukan2[zi] = random(5) + 1;
         }
         if(vcity == 6)
         {
            jenisPasukan2[zi] = random(6) + 1;
         }
         if(vcity >= 7)
         {
            jenisPasukan2[zi] = random(6) + 1;
         }
      }
      else if(tingkatSulit == 3)
      {
         if(day <= 100)
         {
            wcity = 1;
         }
         else if(day <= 300)
         {
            wcity = 2;
         }
         else if(day <= 500)
         {
            wcity = 3;
         }
         else if(day <= 700)
         {
            wcity = 4;
         }
         else if(day <= 900)
         {
            wcity = 5;
         }
         else if(day <= 1100)
         {
            wcity = 6;
         }
         else
         {
            wcity = 7;
         }
         if(zcity > wcity)
         {
            vcity = zcity;
         }
         else
         {
            vcity = wcity;
         }
         if(vcity == 1)
         {
            jenisPasukan2[zi] = random(2) + 1;
         }
         if(vcity == 2)
         {
            jenisPasukan2[zi] = random(2) + 2;
         }
         if(vcity == 3)
         {
            jenisPasukan2[zi] = random(3) + 2;
         }
         if(vcity == 4)
         {
            jenisPasukan2[zi] = random(3) + 3;
         }
         if(vcity == 5)
         {
            jenisPasukan2[zi] = random(4) + 3;
         }
         if(vcity == 6)
         {
            jenisPasukan2[zi] = random(4) + 4;
         }
         if(vcity >= 7)
         {
            jenisPasukan2[zi] = random(5) + 4;
         }
      }
      else if(tingkatSulit == 4)
      {
         if(day <= 100)
         {
            wcity = 1;
         }
         else if(day <= 250)
         {
            wcity = 2;
         }
         else if(day <= 400)
         {
            wcity = 3;
         }
         else if(day <= 550)
         {
            wcity = 4;
         }
         else if(day <= 700)
         {
            wcity = 5;
         }
         else if(day <= 850)
         {
            wcity = 6;
         }
         else
         {
            wcity = 7;
         }
         if(zcity > wcity)
         {
            vcity = zcity;
         }
         else
         {
            vcity = wcity;
         }
         if(vcity == 1)
         {
            jenisPasukan2[zi] = random(2) + 1;
         }
         if(vcity == 2)
         {
            jenisPasukan2[zi] = random(3) + 2;
         }
         if(vcity == 3)
         {
            jenisPasukan2[zi] = random(4) + 3;
         }
         if(vcity == 4)
         {
            jenisPasukan2[zi] = random(5) + 4;
         }
         if(vcity == 5)
         {
            jenisPasukan2[zi] = random(4) + 5;
         }
         if(vcity == 6)
         {
            jenisPasukan2[zi] = random(3) + 6;
         }
         if(vcity >= 7)
         {
            jenisPasukan2[zi] = random(2) + 7;
         }
      }
      masukSoldier2(acak2);
      zi++;
   }
}
function masukSoldier(acak, indi1)
{
   i = indi1;
   if(jenisSoldier[i] == 6)
   {
      soldier = attachMovie("xsuper_mc","soldier_mc" + i,dalamSoldier + i);
      soldier.jenisan = 6;
      soldier.tipe = 1;
      soldier.range = 15;
      soldier.speed = random(6) + 4;
      soldier.speed3 = random(4) + 4;
      soldier.damage = 4;
      soldier.targetBackline = true;
      soldier.armor = 200;
   }
   else
   {
      if(jenisPasukan[i] == 1)
      {
         if(jenisSoldier[i] == 1)
         {
            soldier = attachMovie("sword_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 1;
            soldier.tipe = 1;
            soldier.range = 10;
            soldier.speed = random(5) + 3;
            soldier.speed3 = random(3) + 3;
            soldier.damage = 2;
            soldier.armor = 50;
         }
         else if(jenisSoldier[i] == 2)
         {
            soldier = attachMovie("kuda_mc2","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 2;
            soldier.tipe = 1;
            soldier.range = 10;
            soldier.speed = random(6) + 4;
            soldier.speed3 = random(4) + 4;
            soldier.damage = 2;
            soldier.speed = random(8) + 5;
            soldier.targetBackline = true;
            soldier._xscale = soldier._yscale = 110;
            soldier.armor = 100;
         }
         else if(jenisSoldier[i] == 5)
         {
            soldier = attachMovie("gajah_mc2","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 5;
            soldier.tipe = 1;
            soldier.range = 10;
            soldier.speed = 2;
            soldier.speed3 = 2;
            soldier.damage = 2;
            soldier.armor = 450;
         }
      }
      else if(jenisPasukan[i] == 2)
      {
         if(jenisSoldier[i] == 1)
         {
            soldier = attachMovie("arrow_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 1;
            soldier.tipe = 2;
            soldier.range = 300;
            soldier.speed = random(4) + 2;
            soldier.speed3 = random(2) + 1;
            soldier.damage = 2;
            soldier._xscale = soldier._yscale = 85;
            soldier.armor = 50;
         }
         else if(jenisSoldier[i] == 2)
         {
            soldier = attachMovie("kuda_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 2;
            soldier.tipe = 2;
            soldier.range = 300;
            soldier.speed = random(6) + 4;
            soldier.speed3 = random(4) + 4;
            soldier.damage = 2;
            soldier.speed = random(8) + 5;
            soldier.targetBackline = true;
            soldier._xscale = soldier._yscale = 110;
            soldier.armor = 100;
         }
         else if(jenisSoldier[i] == 3)
         {
            soldier = attachMovie("ketapel_mc2","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 3;
            soldier.tipe = 2;
            soldier.range = 500;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 20;
            soldier.armor = 25;
         }
         else if(jenisSoldier[i] == 5)
         {
            soldier = attachMovie("gajah_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 5;
            soldier.tipe = 2;
            soldier.range = 300;
            soldier.speed = 2;
            soldier.speed3 = 2;
            soldier.damage = 2;
            soldier.armor = 450;
         }
      }
      else if(jenisPasukan[i] == 3)
      {
         if(jenisSoldier[i] == 1)
         {
            soldier = attachMovie("spear_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 1;
            soldier.tipe = 1;
            soldier.range = 15;
            soldier.speed = random(3) + 2;
            soldier.speed3 = random(2) + 1;
            soldier.damage = 4;
            soldier.armor = 50;
         }
         else if(jenisSoldier[i] == 2)
         {
            soldier = attachMovie("kuda_mc2","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 2;
            soldier.tipe = 1;
            soldier.range = 15;
            soldier.speed = random(6) + 4;
            soldier.speed3 = random(4) + 4;
            soldier.damage = 4;
            soldier.speed = random(8) + 5;
            soldier.targetBackline = true;
            soldier._xscale = soldier._yscale = 110;
            soldier.armor = 100;
         }
         else if(jenisSoldier[i] == 3)
         {
            soldier = attachMovie("ketapel_mc3","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 3;
            soldier.tipe = 2;
            soldier.range = 500;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 20;
            soldier.armor = 25;
         }
         else if(jenisSoldier[i] == 5)
         {
            soldier = attachMovie("gajah_mc2","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 5;
            soldier.tipe = 1;
            soldier.range = 15;
            soldier.speed = 2;
            soldier.speed3 = 2;
            soldier.damage = 4;
            soldier.armor = 450;
         }
      }
      else if(jenisPasukan[i] == 4)
      {
         if(jenisSoldier[i] == 1)
         {
            soldier = attachMovie("xfire_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 1;
            soldier.tipe = 2;
            soldier.range = 350;
            soldier.speed = random(4) + 2;
            soldier.speed3 = random(2) + 1;
            soldier.damage = 4;
            soldier.armor = 50;
         }
         else if(jenisSoldier[i] == 2)
         {
            soldier = attachMovie("kuda_mc3","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 2;
            soldier.tipe = 2;
            soldier.range = 300;
            soldier.speed = random(6) + 4;
            soldier.speed3 = random(4) + 4;
            soldier.damage = 4;
            soldier.speed = random(8) + 5;
            soldier.targetBackline = true;
            soldier._xscale = soldier._yscale = 110;
            soldier.armor = 100;
         }
         else if(jenisSoldier[i] == 3)
         {
            soldier = attachMovie("ketapel_mc4","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 3;
            soldier.tipe = 2;
            soldier.range = 500;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 20;
            soldier.armor = 25;
         }
         else if(jenisSoldier[i] == 5)
         {
            soldier = attachMovie("gajah_mc3","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 5;
            soldier.tipe = 2;
            soldier.range = 300;
            soldier.speed = 2;
            soldier.speed3 = 2;
            soldier.damage = 4;
            soldier.armor = 450;
         }
      }
      else if(jenisPasukan[i] == 5)
      {
         if(jenisSoldier[i] == 3)
         {
            soldier = attachMovie("ketapel_mc","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 3;
            soldier.tipe = 2;
            soldier.range = 500;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 20;
            soldier.armor = 25;
         }
      }
      if(jenisSoldier[i] == 4)
      {
         if(jenisPasukan[i] == 6)
         {
            soldier = attachMovie("witch1","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 4;
            soldier.tipe = 2;
            soldier.range = 500;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 2;
            soldier.armor = 25;
         }
         else if(jenisPasukan[i] == 7)
         {
            soldier = attachMovie("witch2","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 4;
            soldier.tipe = 2;
            soldier.range = 450;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 4;
            soldier.armor = 25;
         }
         else if(jenisPasukan[i] == 8)
         {
            soldier = attachMovie("witch3","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 4;
            soldier.tipe = 2;
            soldier.range = 400;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 1;
            soldier.armor = 25;
         }
         else if(jenisPasukan[i] == 9)
         {
            soldier = attachMovie("witch4","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 4;
            soldier.tipe = 2;
            soldier.range = 350;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 2;
            soldier.armor = 25;
         }
         else if(jenisPasukan[i] == 10)
         {
            soldier = attachMovie("witch5","soldier_mc" + i,dalamSoldier + i);
            soldier.jenisan = 4;
            soldier.tipe = 2;
            soldier.range = 300;
            soldier.speed = random(1) + 0.5;
            soldier.speed3 = random(1) + 0.5;
            soldier.damage = 2;
            soldier.armor = 25;
         }
      }
   }
   soldier.damage *= 1;
   soldier.armor = 0;
   soldier.lari = false;
   soldier.gotoAndStop(1);
   soldier._x = _root["kotak" + acak]._x;
   soldier._y = _root["kotak" + acak]._y;
   var unitHp = 2;
   if(jenisSoldier[i] == 1) { unitHp = 2; }
   else if(jenisSoldier[i] == 2) { unitHp = 2; }
   else if(jenisSoldier[i] == 3) { unitHp = 2; }
   else if(jenisSoldier[i] == 4) { unitHp = 1; }
   else if(jenisSoldier[i] == 5) { unitHp = 4; }
   else if(jenisSoldier[i] == 6) { unitHp = 4; }
   soldier.nyawa = bawah["batalion" + i].jml * unitHp;
   soldier.maxUnitHp = unitHp;
   bisaPrajurit = true;
   sudahIsi[acak] = true;
   jmlJagoan++;
}
function masukSoldier2(acak)
{
   i = indi2;
   if(jenisPasukan2[i] == 1)
   {
      soldier2 = attachMovie("sword2_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 1;
      soldier2.range = 10;
      soldier2.speed = random(4) + 2;
      soldier2.speed3 = random(3) + 3;
      soldier2.damage = 0.05;
      soldier2.armor = 50;
   }
   else if(jenisPasukan2[i] == 2)
   {
      soldier2 = attachMovie("arrow2_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 2;
      soldier2.range = 250;
      soldier2.speed = random(3) + 2;
      soldier2.speed3 = random(2) + 1;
      soldier2.damage = 0.06;
      soldier2._xscale = soldier._yscale = 85;
      soldier2.armor = 50;
   }
   else if(jenisPasukan2[i] == 3)
   {
      soldier2 = attachMovie("spear2_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 1;
      soldier2.range = 15;
      soldier2.speed = random(3) + 2;
      soldier2.speed3 = random(2) + 1;
      soldier2.damage = 0.07;
      soldier2.armor = 50;
   }
   else if(jenisPasukan2[i] == 4)
   {
      soldier2 = attachMovie("xkuda_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 1;
      soldier2.range = 15;
      soldier2.speed = random(5) + 3;
      soldier2.speed3 = random(3) + 3;
      soldier2.damage = 0.2;
      soldier2._xscale = soldier._yscale = 110;
      soldier2.armor = 100;
   }
   else if(jenisPasukan2[i] == 5)
   {
      soldier2 = attachMovie("xketapel_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 2;
      soldier2.range = 500;
      soldier2.speed = 1.5;
      soldier2.speed3 = 1.5;
      soldier2.damage = 0.8;
      soldier2.armor = 25;
   }
   else if(jenisPasukan2[i] == 6)
   {
      soldier2 = attachMovie("xwitch_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 2;
      soldier2.range = random(200) + 200;
      soldier2.speed = random(2) + 2;
      soldier2.speed3 = random(2) + 2;
      rand = random(4);
      if(rand == 0)
      {
         soldier2.damage = 0.2;
      }
      else if(rand == 1)
      {
         soldier2.damage = 0.25;
      }
      else if(rand == 2)
      {
         soldier2.damage = 0.3;
      }
      else
      {
         soldier2.damage = 0.35;
      }
      soldier2.armor = 25;
   }
   else if(jenisPasukan2[i] == 7)
   {
      soldier2 = attachMovie("xgajah_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 1;
      soldier2.range = 15;
      soldier2.speed = 2;
      soldier2.speed3 = 2;
      soldier2.damage = 0.3;
      soldier2.armor = 600;
   }
   else if(jenisPasukan2[i] == 8)
   {
      soldier2 = attachMovie("xxsuper_mc","soldier2_mc" + i,dalamSoldier2 + i);
      soldier2.tipe = 1;
      soldier2.range = 20;
      soldier2.speed = random(4) + 4;
      soldier2.speed3 = random(4) + 4;
      soldier2.damage = 1.25;
      soldier2.armor = 150;
   }
   soldier2.damage *= 1;
   soldier2.armor = 0;
   soldier2.lari = false;
   soldier2.gotoAndStop(1);
   soldier2._x = _root["xkotak" + acak]._x;
   soldier2._y = _root["xkotak" + acak]._y;
   if(_root.citySurvivingTroops[_root.kotaDiserang] != undefined && _root.citySurvivingTroops[_root.kotaDiserang] > 0 && _root.tipeWar == "serang")
   {
      soldier2.nyawa = Math.max(1, Math.floor(_root.citySurvivingTroops[_root.kotaDiserang] / 10));
   }
   else
   {
      soldier2.nyawa = zjmlMusuh + Math.floor(random(zjmlMusuh / 2));
   }
   indi2++;
   jmlMusuh++;
}
function enterSoldier()
{
   if(zpause == false)
   {
      if(this.nyawa <= 0)
      {
         this.serang = true;
      }
      else
      {
         if(_root["soldier2_mc" + this.xtarget].nyawa <= 0)
         {
            masihHidup = new Array();
            keHidup = 0;
            i = 1;
            while(i <= 20)
            {
               if(_root["soldier2_mc" + i].nyawa > 0)
               {
                  masihHidup[keHidup] = i;
                  keHidup++;
               }
               i++;
            }
            if(keHidup > 0)
            {
               this.serang = false;
               if(this.targetBackline == true)
               {
                  var bestBackTarget = masihHidup[0];
                  var maxBackX = -9999;
                  var hi = 0;
                  while(hi < keHidup)
                  {
                     var cand = masihHidup[hi];
                     var candX = _root["soldier2_mc" + cand]._x;
                     if(candX > maxBackX)
                     {
                        maxBackX = candX;
                        bestBackTarget = cand;
                     }
                     hi++;
                  }
                  this.xtarget = bestBackTarget;
               }
               else
               {
                  randKe = random(keHidup);
                  this.xtarget = masihHidup[randKe];
               }
               aimX = _root["soldier2_mc" + this.xtarget]._x;
               aimY = _root["soldier2_mc" + this.xtarget]._y;
               if(this._x < aimX)
               {
                  this.tambahan = 0;
               }
               else
               {
                  this.tambahan = 10;
               }
            }
            else
            {
               cekSelesai("menang");
            }
         }
         if(this._x < _root["soldier2_mc" + this.xtarget]._x)
         {
            this.tambahan = 0;
         }
         else
         {
            this.tambahan = 10;
         }
         this.serang = false;
         this.jarak = Math.sqrt(Math.pow(this._x - _root["soldier2_mc" + this.xtarget]._x,2) + Math.pow(this._y - _root["soldier2_mc" + this.xtarget]._y,2));
         if(this.jarak <= this.range && _root["soldier2_mc" + this.xtarget].nyawa > 0)
         {
            this.gotoAndStop(3 + this.tambahan);
            this.serang = true;
            if(this.tipe == 1)
            {
               var tgt = _root["soldier2_mc" + this.xtarget];
               var prevNyawa = tgt.nyawa;
               var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
               tgt.nyawa -= (this.damage + dmgBonus);
               if(prevNyawa > 0 && tgt.nyawa <= 0)
               {
                  _root.onEnemyKilledByWeapon(this.jenisPasukan, 1);
               }
            }
            this.rand = random(100);
            if(this.rand <= xjml)
            {
               this.kenaRand = true;
            }
            else
            {
               this.kenaRand = false;
            }
         }
      }
      if(this.kenaRand == true)
      {
         this.serang = true;
         if(this.speed3 > 0)
         {
            if(this._x >= 100 && this._x < 580)
            {
               if(this.tipe == 1)
               {
                  this._x += this.speed3;
               }
               else
               {
                  this._x -= this.speed3;
               }
               this.speed3 -= 0.5;
            }
         }
         else
         {
            this.speed3 = random(3) + 3;
            this.kenaRand = false;
         }
      }
      if(this.serang == false)
      {
         this.gotoAndStop(2 + this.tambahan);
         aimX = _root["soldier2_mc" + this.xtarget]._x;
         aimY = _root["soldier2_mc" + this.xtarget]._y;
         if(this._x < aimX)
         {
            this.tambahan = 0;
         }
         else
         {
            this.tambahan = 10;
         }
         deltaX = this._x - aimX;
         deltaY = this._y - aimY;
         angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
         if(Math.sqrt(deltaX * deltaX + deltaY * deltaY) > this.speed && _root["soldier2_mc" + this.xtarget].nyawa > 0)
         {
            this._y -= this.speed * Math.cos(angle * 0.017453292519943295);
            this._x += this.speed * Math.sin(angle * 0.017453292519943295);
         }
         else
         {
            this.gotoAndStop(1 + this.tambahan);
            this.serang = true;
            masihHidup = new Array();
            keHidup = 0;
            i = 1;
            while(i <= 20)
            {
               if(_root["soldier2_mc" + i].nyawa > 0)
               {
                  masihHidup[keHidup] = i;
                  keHidup++;
               }
               i++;
            }
            if(keHidup > 0)
            {
               this.serang = false;
               randKe = random(keHidup);
               this.xtarget = masihHidup[randKe];
               aimX = _root["soldier2_mc" + this.xtarget]._x;
               aimY = _root["soldier2_mc" + this.xtarget]._y;
               if(this._x < aimX)
               {
                  this.tambahan = 0;
               }
               else
               {
                  this.tambahan = 10;
               }
            }
         }
      }
      if(this.nyawa <= 0)
      {
         if(this.petamaMati == undefined)
         {
            this.petamaMati = false;
            this._rotation += random(50) - 25;
            this.swapDepths(this.getDepth() - 2000);
            jmlJagoan--;
            if(jmlJagoan <= 0)
            {
               cekSelesai("kalah");
            }
         }
         this.gotoAndStop(4 + this.tambahan);
         if(this.speed2 > 0)
         {
            this._x -= this.speed2;
            this.speed2 = this.speed2 - 1;
         }
      }
   }
}
function enterAsap()
{
   this._y -= this.speed / 1.5;
   rand = random(2);
   if(rand == 0)
   {
      this._x -= 0.5;
   }
   else
   {
      this._x += 0.5;
   }
   this._alpha -= random(4) + 1;
   if(this._alpha <= 0)
   {
      removeMovieClip(this);
   }
}
function enterSerpih()
{
   this._y -= this.speed;
   if(this.rand == 0)
   {
      this._x -= this.speedY;
   }
   else
   {
      this._x += this.speedY;
   }
   this._rotation += 5;
   this.speed = this.speed - 1;
   if(this.speed <= -10)
   {
      removeMovieClip(this);
   }
}
function cekSelesai(indi)
{
   zpause = true;
   bawah.surender_btn._visible = false;
   bawah.atas = "";
   i = 1;
   while(i <= 20)
   {
      if(_root["soldier_mc" + i].nyawa > 0)
      {
         _root["soldier_mc" + i].gotoAndStop(1);
      }
      if(_root["soldier2_mc" + i].nyawa > 0)
      {
         _root["soldier2_mc" + i].gotoAndStop(1);
      }
      if(indi == "menang")
      {
         if(_root["soldier2_mc" + i]._currentframe != 4 && _root["soldier2_mc" + i]._currentframe != 14)
         {
            _root["soldier2_mc" + i].nyawa = 0;
            _root["soldier2_mc" + i].gotoAndStop(4);
         }
      }
      else if(_root["soldier_mc" + i]._currentframe != 4 && _root["soldier_mc" + i]._currentframe != 14)
      {
         _root["soldier_mc" + i].nyawa = 0;
         _root["soldier_mc" + i].gotoAndStop(4);
      }
      i++;
   }
   end = attachMovie("end_mc","end_mc",dalamEnd);
   end._x = -60;
   end._y = -20;
   if(indi == "menang")
   {
      backMenang();
      perangMenang = true;
      end.gotoAndStop(1);
   }
   else
   {
      backKalah();
      perangMenang = false;
      end.gotoAndStop(2);
   }
   pedangSisa = 0;
   panahSisa = 0;
   tombakSisa = 0;
   apiSisa = 0;
   coalSisa = 0;
   iceballSisa = 0;
   fireballSisa = 0;
   poisonSisa = 0;
   hurricaneSisa = 0;
   earthquakeSisa = 0;
   xjmlSisa1 = 0;
   xjmlSisa2 = 0;
   xjmlSisa3 = 0;
   xjmlSisa4 = 0;
   xjmlSisa5 = 0;
   xjmlSisa6 = 0;
   i = 1;
   while(i <= 10)
   {
      jmlSisa1 = 0;
      jmlSisa2 = 0;
      jmlSisa3 = 0;
      jmlSisa4 = 0;
      jmlSisa5 = 0;
      jmlSisa6 = 0;
      if(_root["soldier_mc" + i].nyawa <= 0 || isNaN(_root["soldier_mc" + i].nyawa) || _root["soldier_mc" + i].nyawa == undefined)
      {
         jmlSisa1 = 0;
         jmlSisa2 = 0;
         jmlSisa3 = 0;
         jmlSisa4 = 0;
         jmlSisa5 = 0;
         jmlSisa6 = 0;
      }
      else
      {
         var sHp = _root["soldier_mc" + i].maxUnitHp;
         if(sHp == undefined || sHp <= 0) sHp = 1;
         if(jenisSoldier[i] == 1)
         {
            jmlSisa1 = _root["soldier_mc" + i].nyawa / sHp;
         }
         else if(jenisSoldier[i] == 2)
         {
            jmlSisa2 = _root["soldier_mc" + i].nyawa / sHp;
         }
         else if(jenisSoldier[i] == 3)
         {
            jmlSisa3 = _root["soldier_mc" + i].nyawa / sHp;
         }
         else if(jenisSoldier[i] == 4)
         {
            jmlSisa4 = _root["soldier_mc" + i].nyawa / sHp;
         }
         else if(jenisSoldier[i] == 5)
         {
            jmlSisa5 = _root["soldier_mc" + i].nyawa / sHp;
         }
         else if(jenisSoldier[i] == 6)
         {
            jmlSisa6 = _root["soldier_mc" + i].nyawa / sHp;
         }
         if(jenisPasukan[i] == 1)
         {
            pedangSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 2)
         {
            panahSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 3)
         {
            tombakSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 4)
         {
            apiSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 5)
         {
            coalSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 6)
         {
            iceballSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 7)
         {
            fireballSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 8)
         {
            poisonSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 9)
         {
            hurricaneSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
         else if(jenisPasukan[i] == 10)
         {
            earthquakeSisa += Math.ceil(_root["soldier_mc" + i].nyawa);
         }
      }
      xjmlSisa1 += Math.ceil(jmlSisa1);
      xjmlSisa2 += Math.ceil(jmlSisa2);
      xjmlSisa3 += Math.ceil(jmlSisa3);
      xjmlSisa4 += Math.ceil(jmlSisa4);
      xjmlSisa5 += Math.ceil(jmlSisa5);
      xjmlSisa6 += Math.ceil(jmlSisa6);
      i++;
   }

   pedangSisa = Math.max(0, pedangSisa - _root.weaponConsumed_sword);
   panahSisa = Math.max(0, panahSisa - _root.weaponConsumed_arrow);
   tombakSisa = Math.max(0, tombakSisa - _root.weaponConsumed_spear);
   apiSisa = Math.max(0, apiSisa - _root.weaponConsumed_fire);
   coalSisa = Math.max(0, coalSisa - _root.weaponConsumed_coal);

   end.jagoan1 = xjmlPasukan1 - xjmlSisa1;
   end.jagoan2 = xjmlPasukan2 - xjmlSisa2;
   end.jagoan3 = xjmlPasukan3 - xjmlSisa3;
   end.jagoan4 = xjmlPasukan4 - xjmlSisa4;
   end.jagoan5 = xjmlPasukan5 - xjmlSisa5;
   end.jagoan6 = xjmlPasukan6 - xjmlSisa6;
   var _totalEnemyAlive = 0;
   i = 1;
   while(i <= 10)
   {
      var _eNyawa = _root["soldier2_mc" + i].nyawa;
      if(_eNyawa != undefined && !isNaN(_eNyawa) && _eNyawa > 0)
      {
         _totalEnemyAlive += Math.floor(_eNyawa);
      }
      i++;
   }
   var _actualEnemyLosses = Math.max(0, Math.floor(xxjmlPasukan2 - _totalEnemyAlive));
   end.musuh = _actualEnemyLosses;
   
   if(indi == "menang")
   {
      _root.citySurvivingTroops[_root.kotaDiserang] = 0;
   }
   else if(indi == "kalah")
   {
      if(_root.tipeWar == "serang")
      {
         _root.citySurvivingTroops[_root.kotaDiserang] = Math.max(1, _totalEnemyAlive);
      }
   }
   if(indi == "menang")
   {
      end.money = (random(5) + 1) * 1500;
      end.food = (random(5) + 1) * 500;
      end.logs = (random(5) + 1) * 250;
      end.iron = (random(5) + 1) * 100;
      end.sword = (random(5) + 1) * 50;
      end.xarrow = (random(5) + 1) * 75;
   }
   else if(tipeWar == "serang")
   {
      end.money = Number(_root.bawaBarang1);
      end.food = Number(_root.bawaBarang2);
      end.logs = Number(_root.bawaBarang4);
      end.iron = Number(_root.bawaBarang3);
   }
   else
   {
      end.money = moneyKota[_root.pilihKota];
      end.food = foodKota[_root.pilihKota];
      end.logs = woodKota[_root.pilihKota];
      end.iron = ironKota[_root.pilihKota];
   }
   if(tipeWar == "bertahan" && indi == "menang")
   {
      _root.moneyKota[_root.pilihKota] += end.money;
      _root.foodKota[_root.pilihKota] += end.food;
      _root.ironKota[_root.pilihKota] += end.iron;
      _root.woodKota[_root.pilihKota] += end.logs;
      _root.soldierKota[_root.pilihKota] += xjmlSisa1;
      _root.horseKota[_root.pilihKota] += xjmlSisa2;
      _root.catapultKota[_root.pilihKota] += xjmlSisa3;
      _root.witchKota[_root.pilihKota] += xjmlSisa4;
      _root.elephantKota[_root.pilihKota] += xjmlSisa5;
      _root.xsuperKota[_root.pilihKota] += xjmlSisa6;
      if(pedangSisa >= 2000)
      {
         pedangSisa = 2000;
      }
      if(panahSisa >= 2000)
      {
         panahSisa = 2000;
      }
      if(tombakSisa >= 2000)
      {
         tombakSisa = 2000;
      }
      if(tombakSisa >= 2000)
      {
         tombakSisa = 2000;
      }
      if(apiSisa >= 2000)
      {
         apiSisa = 2000;
      }
      if(coalSisa >= 2000)
      {
         coalSisa = 2000;
      }
      if(iceballSisa >= 2000)
      {
         iceballSisa = 2000;
      }
      if(fireballSisa >= 2000)
      {
         fireballSisa = 2000;
      }
      if(poisonSisa >= 2000)
      {
         poisonSisa = 2000;
      }
      if(hurricaneSisa >= 2000)
      {
         hurricaneSisa = 2000;
      }
      if(earthquakeSisa >= 2000)
      {
         earthquakeSisa = 2000;
      }
      _root.swordKota[_root.pilihKota] += pedangSisa;
      _root.xarrowKota[_root.pilihKota] += panahSisa;
      _root.spearKota[_root.pilihKota] += tombakSisa;
      _root.fireKota[_root.pilihKota] += apiSisa;
      _root.coalKota[_root.pilihKota] += coalSisa;
      _root.iceballKota[_root.pilihKota] += iceballSisa;
      _root.fireballKota[_root.pilihKota] += fireballSisa;
      _root.posionKota[_root.pilihKota] += poisonSisa;
      _root.hurricaneKota[_root.pilihKota] += hurricaneSisa;
      _root.earthquakeKota[_root.pilihKota] += earthquakeSisa;
   }
   else if(tipeWar == "serang" && indi == "menang")
   {
      _root.moneyKota[_root.kotaDiserang] += end.money;
      _root.foodKota[_root.kotaDiserang] += end.food;
      _root.ironKota[_root.kotaDiserang] += end.iron;
      _root.woodKota[_root.kotaDiserang] += end.logs;
      _root.soldierKota[_root.pilihKota] += xjmlSisa1;
      _root.horseKota[_root.pilihKota] += xjmlSisa2;
      _root.catapultKota[_root.pilihKota] += xjmlSisa3;
      _root.witchKota[_root.pilihKota] += xjmlSisa4;
      _root.elephantKota[_root.pilihKota] += xjmlSisa5;
      _root.xsuperKota[_root.pilihKota] += xjmlSisa6;
      if(pedangSisa >= 2000)
      {
         pedangSisa = 2000;
      }
      if(panahSisa >= 2000)
      {
         panahSisa = 2000;
      }
      if(tombakSisa >= 2000)
      {
         tombakSisa = 2000;
      }
      if(tombakSisa >= 2000)
      {
         tombakSisa = 2000;
      }
      if(apiSisa >= 2000)
      {
         apiSisa = 2000;
      }
      if(coalSisa >= 2000)
      {
         coalSisa = 2000;
      }
      if(iceballSisa >= 2000)
      {
         iceballSisa = 2000;
      }
      if(fireballSisa >= 2000)
      {
         fireballSisa = 2000;
      }
      if(poisonSisa >= 2000)
      {
         poisonSisa = 2000;
      }
      if(hurricaneSisa >= 2000)
      {
         hurricaneSisa = 2000;
      }
      if(earthquakeSisa >= 2000)
      {
         earthquakeSisa = 2000;
      }
      _root.swordKota[_root.pilihKota] += pedangSisa;
      _root.xarrowKota[_root.pilihKota] += panahSisa;
      _root.spearKota[_root.pilihKota] += tombakSisa;
      _root.fireKota[_root.pilihKota] += apiSisa;
      _root.coalKota[_root.pilihKota] += coalSisa;
      _root.iceballKota[_root.pilihKota] += iceballSisa;
      _root.fireballKota[_root.pilihKota] += fireballSisa;
      _root.posionKota[_root.pilihKota] += poisonSisa;
      _root.hurricaneKota[_root.pilihKota] += hurricaneSisa;
      _root.earthquakeKota[_root.pilihKota] += earthquakeSisa;
   }
   _root.workerKota[_root.pilihKota] += end.jagoan1;
   _root.workerKota[_root.pilihKota] += end.jagoan2;
   _root.workerKota[_root.pilihKota] += end.jagoan3;
   _root.workerKota[_root.pilihKota] += end.jagoan4;
   _root.workerKota[_root.pilihKota] += end.jagoan5;
   _root.workerKota[_root.pilihKota] += end.jagoan6;
   end.ok_btn.onRelease = function()
   {
      clearSemua2();
      gotoAndStop(129);
   };
}
function cekDarah1(indi)
{
   drand = random(100);
   if(drand <= 25)
   {
      backDarah();
   }
   darah = attachMovie("darah_mc","darah_mc" + dalamDarah,dalamDarah);
   darah._rotation = random(360);
   darah._xscale = darah._yscale = random(25) + 50;
   darah._x = indi._x - random(50) + 25;
   darah._y = indi._y - random(50) + 25;
   dalamDarah++;
   if(dalamDarah > 5500)
   {
      dalamDarah = 5000;
   }
}
function cekAir(indi)
{
   drand = random(100);
   if(drand <= 25)
   {
      backDarah();
   }
   darah = attachMovie("air2_mc","darah_mc" + dalamDarah,dalamDarah);
   darah._rotation = random(360);
   darah._xscale = darah._yscale = random(25) + 50;
   darah._x = indi._x - random(50) + 25;
   darah._y = indi._y - random(50) + 25;
   dalamDarah++;
   if(dalamDarah > 5500)
   {
      dalamDarah = 5000;
   }
}
function cekAir2(indi)
{
   drand = random(100);
   if(drand <= 25)
   {
      backDarah();
   }
   darah = attachMovie("water2_mc","darah_mc" + dalamDarah,dalamDarah2);
   darah._rotation = random(360);
   darah._xscale = darah._yscale = random(50) + 50;
   darah._x = indi._x - random(50) + 25;
   darah._y = indi._y - random(50) + 25;
   dalamDarah2++;
   if(dalamDarah2 > 99)
   {
      dalamDarah2 = 10;
   }
}
function cekApi(indi)
{
   backApi();
   drand = random(100);
   if(drand <= 25)
   {
      backDarah();
   }
   darah = attachMovie("api_mc","darah_mc" + dalamDarah,dalamDarah);
   darah._xscale = darah._yscale = random(10) + 10;
   darah._x = indi._x - random(50) + 25;
   darah._y = indi._y - random(50) + 25;
   dalamDarah++;
   if(dalamDarah > 5500)
   {
      dalamDarah = 5000;
   }
   xrand = random(100);
   if(xrand > 30)
   {
      i = 0;
      while(i <= 3)
      {
         rand = random(2);
         if(rand == 1)
         {
            asap = attachMovie("asap2_mc","asap_mc" + dalamDarah,dalamDarah);
         }
         else
         {
            asap = attachMovie("asap_mc","asap_mc" + dalamDarah,dalamDarah);
         }
         asap._x = indi._x + random(20) - 10;
         asap._y = indi._y + random(20) - 10;
         asap._xscale = random(25) + 25;
         asap._yscale = asap._xscale;
         asap._rotation = random(360);
         asap.speed = random(15) + 1;
         asap.onEnterFrame = enterAsap;
         dalamDarah++;
         if(dalamDarah > 5500)
         {
            dalamDarah = 5000;
         }
         i++;
      }
   }
   xrand = random(100);
   if(xrand > 30)
   {
      i = 0;
      while(i <= 10)
      {
         rand = 12;
         serpih = attachMovie("serpih" + rand,"serpih_mc" + dalamDarah,dalamDarah);
         serpih._x = indi._x;
         serpih._y = indi._y;
         serpih._xscale = random(5) + 3;
         serpih._yscale = serpih._xscale;
         serpih._rotation = random(360);
         serpih.speed = random(10) + 5;
         serpih.rand = random(2);
         serpih.speedY = random(5) + 2;
         serpih.onEnterFrame = enterSerpih;
         dalamDarah++;
         if(dalamDarah > 5500)
         {
            dalamDarah = 5000;
         }
         i++;
      }
   }
}
function cekDarah2(indi)
{
   backMati();
   rand = random(2);
   if(rand == 0)
   {
      darah2 = attachMovie("darah2_mc","darah2_mc" + dalamDarah2,dalamDarah2);
   }
   else
   {
      darah2 = attachMovie("darah3_mc","darah2_mc" + dalamDarah2,dalamDarah2);
   }
   darah2._rotation = random(360);
   darah2._xscale = darah2._yscale = random(50) + 50;
   darah2._x = indi._x - random(50) + 25;
   darah2._y = indi._y - random(50) + 25;
   dalamDarah2++;
   if(dalamDarah2 > 500)
   {
      dalamDarah2 = 10;
   }
}
function cekPanah(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("anak_panah","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterAnak;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekPanahApi(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("anak_panah_api","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterAnak2;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekBatu(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("batu_panah","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier_mc" + indi.xtarget]._x;
      aimY = _root["soldier_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterBatu;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function xxcekBatu(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("batu_panah2","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier_mc" + indi.xtarget]._x;
      aimY = _root["soldier_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterBatu2;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function yycekBatu(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      wrand = random(4);
      if(wrand == 0)
      {
         anak = attachMovie("sihir1","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      }
      else if(wrand == 1)
      {
         anak = attachMovie("sihir2","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      }
      else if(wrand == 2)
      {
         anak = attachMovie("sihir3","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      }
      else if(wrand == 3)
      {
         anak = attachMovie("sihir4","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      }
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier_mc" + indi.xtarget]._x;
      aimY = _root["soldier_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      if(wrand == 0)
      {
         anak.onEnterFrame = enterBatu2x;
      }
      else
      {
         anak.onEnterFrame = enterBatu2;
      }
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekSihir1(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("sihir1","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterSihir1;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekSihir2(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("sihir2","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterSihir2;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekSihir3(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("sihir3","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterSihir3;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekSihir4(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("sihir4","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterSihir4;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekSihir5(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("sihir5","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      anak.angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak.onEnterFrame = enterSihir5;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekBatu2(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("batu_panah2","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 18;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterAnak2;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekBatu3(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("anak_panah","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterAnak;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekBatu4(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("tombak_panah","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterAnak;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function cekBatu5(indi, indi2)
{
   if(_root["soldier2_mc" + indi.xtarget].nyawa > 0)
   {
      anak = attachMovie("anak_panah_api","anak_panah" + dalamAnakPanah,dalamAnakPanah);
      anak._x = indi._x;
      anak._y = indi._y - 25;
      anak._xscale = anak._yscale = 9;
      anak.jenis = indi2;
      anak.speed = 20;
      anak.damage = indi.damage;
      aimX = _root["soldier2_mc" + indi.xtarget]._x;
      aimY = _root["soldier2_mc" + indi.xtarget]._y;
      anak.xtarget = indi.xtarget;
      deltaX = indi._x - aimX;
      deltaY = indi._y - aimY;
      angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
      anak._rotation = angle;
      anak.onEnterFrame = enterAnak;
      dalamAnakPanah++;
      if(dalamAnakPanah > 8500)
      {
         dalamAnakPanah = 8000;
      }
   }
}
function enterAnak()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekDarah1(tgt);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (2 + dmgBonus);
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(2, 1); }
      removeMovieClip(this);
   }
}
function enterAnak2()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekApi(tgt);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (4 + dmgBonus);
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(4, 1); }
      removeMovieClip(this);
   }
}
function enterBatu()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier_mc" + this.xtarget]))
   {
      var tgt = _root["soldier_mc" + this.xtarget];
      cekDarah1(tgt);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (20 + dmgBonus);
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(5, 10); }
      removeMovieClip(this);
   }
}
function enterBatu2()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier_mc" + this.xtarget]))
   {
      cekDarah1(_root["soldier_mc" + this.xtarget]);
      cekApi(_root["soldier2_mc" + this.xtarget]);
      _root["soldier_mc" + this.xtarget].nyawa -= this.damage * 20;
      removeMovieClip(this);
   }
}
function enterBatu2x()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier_mc" + this.xtarget]))
   {
      cekAir(_root["soldier_mc" + this.xtarget]);
      xrand = random(100);
      if(xrand < 15)
      {
         cekAir2(_root["soldier_mc" + this.xtarget]);
      }
      _root["soldier_mc" + this.xtarget].nyawa -= this.damage * 20;
      removeMovieClip(this);
   }
}
function enterSihir1()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekAir(tgt);
      cekAir2(tgt);
      tgt.speed = Math.max(1, tgt.speed * 0.5);
      tgt.speed3 = Math.max(1, tgt.speed3 * 0.5);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (2 + dmgBonus);
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(6, 1); }
      removeMovieClip(this);
   }
}
function enterSihir2()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekDarah(tgt);
      cekApi(tgt);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (4 + dmgBonus);
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(7, 1); }
      removeMovieClip(this);
   }
}
function enterSihir3()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekDarah(tgt);
      if(tgt.poisonStacks == undefined) tgt.poisonStacks = 0;
      tgt.poisonStacks += 1;
      var prevNyawa = tgt.nyawa;
      tgt.nyawa -= (1 + tgt.poisonStacks);
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(8, 1); }
      removeMovieClip(this);
   }
}
function enterSihir4()
{
   this._y -= this.speed * Math.cos(this._rotation * 0.017453292519943295);
   this._x += this.speed * Math.sin(this._rotation * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekDarah(tgt);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (2 + dmgBonus);
      var frontTarget = -1;
      var maxFrontX = -9999;
      var fi = 1;
      while(fi <= 20)
      {
         var ally = _root["soldier_mc" + fi];
         if(ally != undefined && ally.nyawa > 0 && ally._x > maxFrontX)
         {
            maxFrontX = ally._x;
            frontTarget = fi;
         }
         fi++;
      }
      if(frontTarget != -1) { tgt.xtarget = frontTarget; }
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(9, 1); }
      removeMovieClip(this);
   }
}
function enterSihir5()
{
   this._y -= this.speed * Math.cos(this.angle * 0.017453292519943295);
   this._x += this.speed * Math.sin(this.angle * 0.017453292519943295);
   if(this.speed < 5)
   {
      this.speed -= 0.25;
   }
   if(this._x > 700 || this._x < 0)
   {
      removeMovieClip(this);
   }
   if(this.hitTest(_root["soldier2_mc" + this.xtarget]))
   {
      var tgt = _root["soldier2_mc" + this.xtarget];
      cekDarah(tgt);
      var prevNyawa = tgt.nyawa;
      var dmgBonus = (tgt.poisonStacks > 0 ? tgt.poisonStacks : 0);
      tgt.nyawa -= (2 + dmgBonus);
      var splashCount = 0;
      var si = 1;
      while(si <= 20 && splashCount < 2)
      {
         var otherTgt = _root["soldier2_mc" + si];
         if(si != this.xtarget && otherTgt != undefined && otherTgt.nyawa > 0)
         {
            otherTgt.nyawa -= 1;
            splashCount++;
         }
         si++;
      }
      if(prevNyawa > 0 && tgt.nyawa <= 0) { _root.onEnemyKilledByWeapon(10, 1); }
      removeMovieClip(this);
   }
}
function enterSoldier2()
{
   if(zpause == false)
   {
      zxjmlSisa2 = 0;
      i = 1;
      while(i <= 10)
      {
         if(_root["soldier2_mc" + i].nyawa <= 0 || isNaN(_root["soldier2_mc" + i].nyawa) || _root["soldier2_mc" + i].nyawa == undefined)
         {
            zjmlSisa2 = 0;
         }
         else
         {
            zjmlSisa2 = _root["soldier2_mc" + i].nyawa;
         }
         zxjmlSisa2 += Math.floor(_root["soldier2_mc" + i].nyawa);
         i++;
      }
      if(this.nyawa > 0)
      {
         if(zxjmlSisa2 <= xxjmlPasukan2 / 10)
         {
            if(musuhLari == true)
            {
               this.lari = true;
            }
         }
      }
      if(this.lari == false)
      {
         if(this.nyawa <= 0)
         {
            this.serang = true;
            this.kenaRand = false;
         }
         else
         {
            if(_root["soldier_mc" + this.xtarget].nyawa <= 0)
            {
               masihHidup = new Array();
               keHidup = 0;
               i = 1;
               while(i <= 20)
               {
                  if(_root["soldier_mc" + i].nyawa > 0)
                  {
                     masihHidup[keHidup] = i;
                     keHidup++;
                  }
                  i++;
               }
               if(keHidup > 0)
               {
                  this.serang = false;
                  randKe = random(keHidup);
                  this.xtarget = masihHidup[randKe];
                  aimX = _root["soldier_mc" + this.xtarget]._x;
                  aimY = _root["soldier_mc" + this.xtarget]._y;
                  if(this._x > aimX)
                  {
                     this.tambahan = 0;
                  }
                  else
                  {
                     this.tambahan = 10;
                  }
               }
               else
               {
                  cekSelesai("kalah");
               }
            }
            if(this._x > _root["soldier_mc" + this.xtarget]._x)
            {
               this.tambahan = 0;
            }
            else
            {
               this.tambahan = 10;
            }
            this.serang = false;
            this.jarak = Math.sqrt(Math.pow(this._x - _root["soldier_mc" + this.xtarget]._x,2) + Math.pow(this._y - _root["soldier_mc" + this.xtarget]._y,2));
            if(this.jarak <= this.range && _root["soldier_mc" + this.xtarget].nyawa > 0)
            {
               this.gotoAndStop(3 + this.tambahan);
               this.serang = true;
               if(this.tipe == 1)
               {
                  _root["soldier_mc" + this.xtarget].nyawa -= this.damage;
               }
               this.rand = random(100);
               if(this.rand <= xjml)
               {
                  this.kenaRand = true;
               }
               else
               {
                  this.kenaRand = false;
               }
            }
         }
         if(this.kenaRand == true)
         {
            this.serang = true;
            if(this.speed3 > 0)
            {
               if(this._x >= 100 && this._x < 580)
               {
                  if(this.tipe == 1)
                  {
                     this._x -= this.speed3;
                  }
                  else
                  {
                     this._x += this.speed3;
                  }
                  this.speed3 -= 0.5;
               }
            }
            else
            {
               this.speed3 = random(3) + 3;
               this.kenaRand = false;
            }
         }
         if(this.serang == false)
         {
            this.gotoAndStop(2 + this.tambahan);
            aimX = _root["soldier_mc" + this.xtarget]._x;
            aimY = _root["soldier_mc" + this.xtarget]._y;
            if(this._x > aimX)
            {
               this.tambahan = 0;
            }
            else
            {
               this.tambahan = 10;
            }
            deltaX = this._x - aimX;
            deltaY = this._y - aimY;
            angle = (- Math.atan2(deltaX,deltaY)) / 0.017453292519943295;
            if(Math.sqrt(deltaX * deltaX + deltaY * deltaY) > this.speed && _root["soldier_mc" + this.xtarget].nyawa > 0)
            {
               this._y -= this.speed * Math.cos(angle * 0.017453292519943295);
               this._x += this.speed * Math.sin(angle * 0.017453292519943295);
            }
            else
            {
               this.gotoAndStop(1 + this.tambahan);
               this.serang = true;
               masihHidup = new Array();
               keHidup = 0;
               i = 1;
               while(i <= 20)
               {
                  if(_root["soldier_mc" + i].nyawa > 0)
                  {
                     masihHidup[keHidup] = i;
                     keHidup++;
                  }
                  i++;
               }
               if(keHidup > 0)
               {
                  this.serang = false;
                  randKe = random(keHidup);
                  this.xtarget = masihHidup[randKe];
                  aimX = _root["soldier_mc" + this.xtarget]._x;
                  aimY = _root["soldier_mc" + this.xtarget]._y;
                  if(this._x > aimX)
                  {
                     this.tambahan = 0;
                  }
                  else
                  {
                     this.tambahan = 10;
                  }
               }
            }
         }
      }
      else if(this.nyawa > 0)
      {
         this.gotoAndStop(12);
         this._x += this.speed * 1.5;
         if(this._x >= 700)
         {
            this.nyawa = 0;
         }
      }
      if(this.nyawa <= 0)
      {
         if(this.petamaMati == undefined)
         {
            this.petamaMati = false;
            this._rotation += random(50) - 25;
            this.swapDepths(this.getDepth() - 2000);
            jmlMusuh--;
            if(jmlMusuh <= 0)
            {
               cekSelesai("menang");
            }
         }
         this.gotoAndStop(4 + this.tambahan);
         if(this.speed2 > 0)
         {
            this._x += this.speed2;
            this.speed2 = this.speed2 - 1;
         }
      }
   }
}
function buatBawah()
{
   bawah = attachMovie("bawah_mc","bawah_mc",dalamBawah);
   bawah._x = -250;
   bawah._y = 380;
   bawah.atas = "Place a battalion (press, hold and drag buttons below to green box) after finished, click start.";
   cekPosX = new Array();
   cekPosY = new Array();
   sudahIsi = new Array();
   jenisPasukan = new Array();
   jenisSoldier = new Array();
   i = 1;
   while(i <= 20)
   {
      sudahIsi[i] = false;
      _root["xbatalion" + i]._visible = false;
      i++;
   }
   i = 1;
   while(i <= xjml)
   {
      if(wsoldier[i] == 1)
      {
         bawah["batalion" + i].gotoAndStop(wjenis[i]);
      }
      else if(wsoldier[i] == 2)
      {
         bawah["batalion" + i].gotoAndStop(wjenis[i] + 10);
      }
      else if(wsoldier[i] == 3)
      {
         bawah["batalion" + i].gotoAndStop(wjenis[i] + 20);
      }
      else if(wsoldier[i] == 4)
      {
         bawah["batalion" + i].gotoAndStop(wjenis[i] + 30);
      }
      else if(wsoldier[i] == 5)
      {
         bawah["batalion" + i].gotoAndStop(wjenis[i] + 40);
      }
      else if(wsoldier[i] == 6)
      {
         bawah["batalion" + i].gotoAndStop(wjenis[i] + 50);
      }
      bawah["batalion" + i].jml = wbatalion[i];
      bawah["batalion" + i].posX = bawah["batalion" + i]._x;
      bawah["batalion" + i].posY = bawah["batalion" + i]._y;
      if(bawah["batalion" + i].jml == 0)
      {
         bawah["batalion" + i]._visible = false;
         jenisPasukan[i] = 0;
         jenisSoldier[i] = 0;
      }
      else
      {
         bawah["batalion" + i].onPress = pressBatalion;
         bawah["batalion" + i].onRelease = releaseBatalion;
         jenisPasukan[i] = wjenis[i];
         jenisSoldier[i] = wsoldier[i];
      }
      i++;
   }
   bawah.surender_btn._visible = false;
   bawah.random_btn.onRelease = klikRandom;
   bawah.start_btn.onRelease = klikMulai;
   bawah.undo_btn.onRelease = klikUndo;
}
function klikSurender()
{
   cekSelesai("kalah");
}
function klikUndo()
{
   indi1 = 1;
   i = 1;
   while(i <= 20)
   {
      removeMovieClip(_root["soldier_mc" + i]);
      i++;
   }
   buatBawah();
}
function klikMulai()
{
   bisaMulai = false;
   i = 1;
   while(i <= 10)
   {
      if(_root["soldier_mc" + i] != undefined)
      {
         bisaMulai = true;
      }
      i++;
   }
   if(bisaMulai == true)
   {
      bawah.atas = "Click surender if you want to surender.";
      bawah.surender_btn._visible = true;
      bawah.random_btn._visible = false;
      bawah.start_btn._visible = false;
      bawah.undo_btn._visible = false;
      bawah.surender_btn.onRelease = klikSurender;
      jmlPasukan1 = 10;
      jmlPasukan2 = 10;
      i = 1;
      while(i <= 20)
      {
         _root["kotak" + i]._visible = false;
         bawah["batalion" + i].enabled = false;
         bawah["batalion" + i]._visible = true;
         if(_root.soldier_mc.nyawa == undefined)
         {
            _root.soldier_mc.nyawa = 0;
         }
         bawah["batalion" + i].jml = _root["soldier_mc" + i].nyawa;
         _root["xbatalion" + i]._visible = true;
         _root["xbatalion" + i].gotoAndStop(jenisPasukan2[i]);
         if(_root.soldier_mc.nyawa == undefined)
         {
            _root.soldier_mc.nyawa = 0;
         }
         _root["xbatalion" + i].jml = _root["soldier2_mc" + i].nyawa;
         _root["soldier_mc" + i].speed2 = random(6) + 6;
         _root["soldier_mc" + i].xtarget = random(10) + 1;
         _root["soldier_mc" + i].tambahan = 0;
         _root["soldier_mc" + i].gotoAndStop(2);
         _root["soldier_mc" + i].onEnterFrame = enterSoldier;
         i++;
      }
      i = 1;
      while(i <= 20)
      {
         _root["xkotak" + i]._visible = false;
         _root["soldier2_mc" + i].speed2 = random(6) + 6;
         _root["soldier2_mc" + i].xtarget = random(10) + 1;
         _root["soldier2_mc" + i].tambahan = 0;
         _root["soldier2_mc" + i].gotoAndStop(2);
         _root["soldier2_mc" + i].onEnterFrame = enterSoldier2;
         i++;
      }
   }
}
function cekKedalaman()
{
   i = 1;
   while(i <= 10)
   {
      j = i + 1;
      while(j <= 10)
      {
         if(_root["soldier_mc" + i]._y > _root["soldier2_mc" + j]._y)
         {
            if(_root["soldier_mc" + i].getDepth() < _root["soldier2_mc" + j].getDepth())
            {
               if(_root["soldier_mc" + i].nyawa > 0 && _root["soldier2_mc" + j].nyawa > 0)
               {
                  _root["soldier_mc" + i].swapDepths(_root["soldier2_mc" + j]);
               }
            }
         }
         else if(_root["soldier_mc" + i]._y < _root["soldier2_mc" + j]._y)
         {
            if(_root["soldier_mc" + i].getDepth() > _root["soldier2_mc" + j].getDepth())
            {
               if(_root["soldier_mc" + i].nyawa > 0 && _root["soldier2_mc" + j].nyawa > 0)
               {
                  _root["soldier2_mc" + j].swapDepths(_root["soldier_mc" + i]);
               }
            }
         }
         if(_root["soldier_mc" + i]._y > _root["soldier_mc" + j]._y)
         {
            if(_root["soldier_mc" + i].getDepth() < _root["soldier_mc" + j].getDepth())
            {
               if(_root["soldier_mc" + i].nyawa > 0 && _root["soldier_mc" + j].nyawa > 0)
               {
                  _root["soldier_mc" + i].swapDepths(_root["soldier_mc" + j]);
               }
            }
         }
         else if(_root["soldier_mc" + i]._y < _root["soldier_mc" + j]._y)
         {
            if(_root["soldier_mc" + i].getDepth() > _root["soldier_mc" + j].getDepth())
            {
               if(_root["soldier_mc" + i].nyawa > 0 && _root["soldier_mc" + j].nyawa > 0)
               {
                  _root["soldier_mc" + j].swapDepths(_root["soldier_mc" + i]);
               }
            }
         }
         if(_root["soldier2_mc" + i]._y > _root["soldier2_mc" + j]._y)
         {
            if(_root["soldier2_mc" + i].getDepth() < _root["soldier2_mc" + j].getDepth())
            {
               if(_root["soldier2_mc" + i].nyawa > 0 && _root["soldier2_mc" + j].nyawa > 0)
               {
                  _root["soldier2_mc" + i].swapDepths(_root["soldier2_mc" + j]);
               }
            }
         }
         else if(_root["soldier2_mc" + i]._y < _root["soldier2_mc" + j]._y)
         {
            if(_root["soldier2_mc" + i].getDepth() > _root["soldier2_mc" + j].getDepth())
            {
               if(_root["soldier2_mc" + i].nyawa > 0 && _root["soldier2_mc" + j].nyawa > 0)
               {
                  _root["soldier2_mc" + j].swapDepths(_root["soldier2_mc" + i]);
               }
            }
         }
         j++;
      }
      i++;
   }
}
function klikRandom()
{
   indi1 = 1;
   i = 1;
   while(i <= 20)
   {
      removeMovieClip(_root["soldier_mc" + i]);
      i++;
   }
   angka = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
   zi = 1;
   while(zi <= xjml)
   {
      if(bawah["batalion" + zi].jml > 0)
      {
         acak = random(angka.length);
         acak2 = angka[acak];
         angka[acak] = null;
         angka.sort();
         angka.pop();
         masukSoldier(acak2,zi);
         bawah["batalion" + zi]._visible = false;
      }
      zi++;
   }
}
function pressBatalion()
{
   sedangDrag = true;
   startDrag(this,1);
   this.swapDepths(this.getNextHighestDepth());
}
function releaseBatalion()
{
   myStr = new String(this);
   if(myStr.length == 26)
   {
      indi1 = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi1 = myStr.substr(myStr.length - 2,2);
   }
   bisaPrajurit = false;
   ai = 1;
   while(ai <= 20)
   {
      if(sudahIsi[ai] == false)
      {
         if(this.hitTest(_root["kotak" + ai]))
         {
            if(this.jml > 0)
            {
               masukSoldier(ai,indi1);
               ai = 20;
            }
         }
      }
      ai++;
   }
   sedangDrag = false;
   stopDrag();
   this._x = this.posX;
   this._y = this.posY;
   if(bisaPrajurit == false)
   {
      this._visible = true;
   }
   else
   {
      this._visible = false;
   }
}
function clearSemua2()
{
   delete _root.onEnterFrame;
   removeMovieClip(end_mc);
   removeMovieClip(bawah_mc);
   i = 1;
   while(i <= 20)
   {
      removeMovieClip(_root["soldier_mc" + i]);
      removeMovieClip(_root["soldier2_mc" + i]);
      i++;
   }
   i = 5000;
   while(i <= 5500)
   {
      removeMovieClip(_root["darah_mc" + i]);
      i++;
   }
   i = 0;
   while(i <= 500)
   {
      removeMovieClip(_root["darah2_mc" + i]);
      i++;
   }
   i = 8000;
   while(i <= 8500)
   {
      removeMovieClip(_root["anak_panah" + i]);
      i++;
   }
}
stop();
trace(zjmlMusuh);
if(zjmlMusuh == undefined || isNaN(zjmlMusuh) || zjmlMusuh <= 0)
{
   zjmlMusuh = random(100) + 100;
}
trace(zjmlMusuh);
xxday = "DAY " + day;
if(tingkatSulit == 1)
{
   xxlevel = "EASY";
}
else if(tingkatSulit == 2)
{
   xxlevel = "NORMAL";
}
else if(tingkatSulit == 3)
{
   xxlevel = "HARD";
}
else if(tingkatSulit == 4)
{
   xxlevel = "IMPOSSIBLE";
}
bisaMulai = false;
randLari = random(10);
if(randLari >= 4)
{
   musuhLari = true;
}
else
{
   musuhLari = false;
}
backPerang();
if(tipeWar == "bertahan")
{
   medan_mc.gotoAndStop(_root.pilihKota);
}
else if(tipeWar == "serang")
{
   medan_mc.gotoAndStop(_root.kotaDiserang + 20);
}
init2();
buatKecil();
buatBawah();
buatMusuh();
xjmlPasukan1 = 0;
xjmlPasukan2 = 0;
xjmlPasukan3 = 0;
xjmlPasukan4 = 0;
xjmlPasukan5 = 0;
xjmlPasukan6 = 0;
pedangBawa = 0;
panahBawa = 0;
tombakBawa = 0;
i = 1;
while(i <= 10)
{
   jmlSisa1 = 0;
   jmlSisa2 = 0;
   jmlSisa3 = 0;
   jmlSisa4 = 0;
   jmlSisa5 = 0;
   jmlSisa6 = 0;
   if(wbatalion[i] <= 0 || isNaN(wbatalion[i]) || wbatalion[i] == undefined)
   {
      jmlSisa1 = 0;
      jmlSisa2 = 0;
      jmlSisa3 = 0;
      jmlSisa4 = 0;
      jmlSisa5 = 0;
      jmlSisa6 = 0;
   }
   else if(jenisSoldier[i] == 1)
   {
      jmlSisa1 = wbatalion[i];
   }
   else if(jenisSoldier[i] == 2)
   {
      jmlSisa2 = wbatalion[i];
   }
   else if(jenisSoldier[i] == 3)
   {
      jmlSisa3 = wbatalion[i];
   }
   else if(jenisSoldier[i] == 4)
   {
      jmlSisa4 = wbatalion[i];
   }
   else if(jenisSoldier[i] == 5)
   {
      jmlSisa5 = wbatalion[i];
   }
   else if(jenisSoldier[i] == 6)
   {
      jmlSisa6 = wbatalion[i];
   }
   if(jenisPasukan[i] == 1)
   {
      pedangBawa += _root["soldier_mc" + i].nyawa;
   }
   else if(jenisPasukan[i] == 2)
   {
      panahBawa += _root["soldier_mc" + i].nyawa;
   }
   else if(jenisPasukan[i] == 3)
   {
      tombakBawa += _root["soldier_mc" + i].nyawa;
   }
   else if(jenisPasukan[i] == 3)
   {
      apiBawa += _root["soldier_mc" + i].nyawa;
   }
   xjmlPasukan1 += Math.ceil(jmlSisa1);
   xjmlPasukan2 += Math.ceil(jmlSisa2);
   xjmlPasukan3 += Math.ceil(jmlSisa3);
   xjmlPasukan4 += Math.ceil(jmlSisa4);
   xjmlPasukan5 += Math.ceil(jmlSisa5);
   xjmlPasukan6 += Math.ceil(jmlSisa6);
   i++;
}
xxjmlPasukan2 = 0;
i = 1;
while(i <= 10)
{
   if(_root["soldier2_mc" + i].nyawa <= 0 || isNaN(_root["soldier2_mc" + i].nyawa) || _root["soldier2_mc" + i].nyawa == undefined)
   {
      xxjmlSisa2 = 0;
   }
   else
   {
      xxjmlSisa2 = _root["soldier2_mc" + i].nyawa;
   }
   xxjmlPasukan2 += Math.floor(xxjmlSisa2);
   i++;
}
_root.onEnterFrame = function()
{
   if(bisaMulai == true)
   {
      i = 1;
      while(i <= 10)
      {
         if(_root["soldier_mc" + i].nyawa == undefined)
         {
            _root["soldier_mc" + i].nyawa = 0;
         }
         bawah["batalion" + i].jml = Math.floor(_root["soldier_mc" + i].nyawa);
         if(bawah["batalion" + i].jml <= 0)
         {
            bawah["batalion" + i].jml = 0;
            if(bawah["batalion" + i]._alpha <= 0)
            {
               bawah["batalion" + i]._visible = false;
            }
            else
            {
               bawah["batalion" + i]._alpha -= 10;
            }
         }
         if(_root["soldier_mc" + i].nyawa == undefined)
         {
            _root["soldier_mc" + i].nyawa = 0;
         }
         _root["xbatalion" + i].jml = Math.floor(_root["soldier2_mc" + i].nyawa);
         if(_root["xbatalion" + i].jml <= 0)
         {
            _root["xbatalion" + i].jml = 0;
            if(_root["xbatalion" + i]._alpha <= 0)
            {
               _root["xbatalion" + i]._visible = false;
            }
            else
            {
               _root["xbatalion" + i]._alpha -= 10;
            }
         }
         i++;
      }
      cekKedalaman();
   }
};

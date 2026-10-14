function buatTutor()
{
   xcekInfo();
   xpause = true;
   tutor = attachMovie("tutor_mc","tutor",dalamTutor);
   tutor._x = 500;
   tutor._y = 220;
   i = 1;
   while(i <= bykArea)
   {
      peta["area" + i].enabled = false;
      i++;
   }
   map.actions_btn.enabled = false;
   map.map_btn.enabled = false;
   map.options_btn.enabled = false;
   i = 1;
   while(i <= bykArea)
   {
      map["button" + i].enabled = false;
      map["map" + i].enabled = false;
      i++;
   }
}
function skipTutor()
{
   xpause = false;
   removeMovieClip(tutor);
   map.actions_btn.enabled = true;
   map.map_btn.enabled = true;
   map.options_btn.enabled = true;
   i = 1;
   while(i <= bykArea)
   {
      peta["area" + i].enabled = true;
      i++;
   }
   i = 1;
   while(i <= bykArea)
   {
      map["button" + i].enabled = true;
      map["map" + i].enabled = true;
      i++;
   }
   clearInterval(dayDelay);
   dayDelay = setInterval(dayItung,delayHari);
}
function resetWilayah(xindi, windi)
{
   punyaWilayah[xindi] = windi;
   moneyKota[xindi] = 0;
   foodKota[xindi] = 0;
   ironKota[xindi] = 0;
   woodKota[xindi] = 0;
   swordKota[xindi] = 0;
   xarrowKota[xindi] = 0;
   soldierKota[xindi] = 0;
   workerKota[xindi] = 0;
   diamondKota[xindi] = 0;
   coalKota[xindi] = 0;
   oilKota[xindi] = 0;
   spearKota[xindi] = 0;
   horseKota[xindi] = 0;
   catapultKota[xindi] = 0;
   witchKota[xindi] = 0;
   elephantKota[xindi] = 0;
   j = 1;
   while(j <= bykArea)
   {
      k = 1;
      while(k <= bykProperti)
      {
         jenisBangunan[xindi][j][k] = 1;
         upgradeProperti[xindi][j][k] = 1;
         k++;
      }
      j++;
   }
}
function cekGameOver()
{
   sudahKalah = true;
   clearSemua();
   gotoAndStop(132);
}
function cekVictory()
{
   sudahKalah = true;
   clearSemua();
   gotoAndStop(133);
}
function initSemua()
{
// ================= MOD GLOBAL SYSTEM INITIALIZATION =================
if(_root.citySurvivingTroops == undefined)
{
   _root.citySurvivingTroops = new Array();
   _root.logisticsResType = new Array();
   _root.logisticsAmount = new Array();
   _root.logisticsWorkerAmount = new Array();
   _root.logisticsTab = 1;
   _root.gdpKota = new Array();
   _root.exportGdpKota = new Array();
   _root.importGdpKota = new Array();
   _root.neutralAccumulatedGarrison = new Array();
   var _ci = 1;
   while(_ci <= 12)
   {
      _root.citySurvivingTroops[_ci] = 0;
      _root.logisticsResType[_ci] = 0;
      _root.logisticsAmount[_ci] = new Array();
      _root.logisticsWorkerAmount[_ci] = new Array();
      _root.gdpKota[_ci] = 0;
      _root.exportGdpKota[_ci] = 0;
      _root.importGdpKota[_ci] = 0;
      _root.neutralAccumulatedGarrison[_ci] = 0;
      var _cj = 1;
      while(_cj <= 12)
      {
         _root.logisticsAmount[_ci][_cj] = 0;
         _root.logisticsWorkerAmount[_ci][_cj] = 0;
         _cj++;
      }
      _ci++;
   }
}

   initMap();
   buatKotak();
   buatPeta();
   buatMap();
   buatMsgBox();
   buatInfo();
   buatInfo2();
   cekAnim();
   clearInterval(dayDelay);
   dayDelay = setInterval(dayItung,delayHari);
}
function xcekInfo()
{
   xi = pilihKota;
   if(isNaN(moneyKota[xi]) || moneyKota[xi] == undefined)
   {
      moneyKota[xi] = 0;
   }
   if(isNaN(foodKota[xi]) || foodKota[xi] == undefined)
   {
      foodKota[xi] = 0;
   }
   if(isNaN(ironKota[xi]) || ironKota[xi] == undefined)
   {
      ironKota[xi] = 0;
   }
   if(isNaN(woodKota[xi]) || woodKota[xi] == undefined)
   {
      woodKota[xi] = 0;
   }
   if(isNaN(swordKota[xi]) || swordKota[xi] == undefined)
   {
      swordKota[xi] = 0;
   }
   if(isNaN(xarrowKota[xi]) || xarrowKota[xi] == undefined)
   {
      xarrowKota[xi] = 0;
   }
   if(isNaN(soldierKota[xi]) || soldierKota[xi] == undefined)
   {
      soldierKota[xi] = 0;
   }
   if(isNaN(diamondKota[xi]) || diamondKota[xi] == undefined)
   {
      diamondKota[xi] = 0;
   }
   if(isNaN(coalKota[xi]) || coalKota[xi] == undefined)
   {
      coalKota[xi] = 0;
   }
   if(isNaN(oilKota[xi]) || oilKota[xi] == undefined)
   {
      moneyKota[xi] = 0;
   }
   if(isNaN(spearKota[xi]) || spearKota[xi] == undefined)
   {
      spearKota[xi] = 0;
   }
   if(isNaN(horseKota[xi]) || horseKota[xi] == undefined)
   {
      horseKota[xi] = 0;
   }
   if(isNaN(catapultKota[xi]) || catapultKota[xi] == undefined)
   {
      catapultKota[xi] = 0;
   }
   if(isNaN(witchKota[xi]) || witchKota[xi] == undefined)
   {
      witchKota[xi] = 0;
   }
   if(isNaN(elephantKota[xi]) || elephantKota[xi] == undefined)
   {
      elephantKota[xi] = 0;
   }
   if(isNaN(fireKota[xi]) || fireKota[xi] == undefined)
   {
      fireKota[xi] = 0;
   }
   if(isNaN(steelKota[xi]) || steelKota[xi] == undefined)
   {
      steelKota[xi] = 0;
   }
   if(isNaN(xsuperKota[xi]) || xsuperKota[xi] == undefined)
   {
      steelKota[xi] = 0;
   }
   if(isNaN(iceballKota[xi]) || iceballKota[xi] == undefined)
   {
      iceballKota[xi] = 0;
   }
   if(isNaN(fireballKota[xi]) || fireballKota[xi] == undefined)
   {
      fireballKota[xi] = 0;
   }
   if(isNaN(poisonKota[xi]) || poisonKota[xi] == undefined)
   {
      poisonKota[xi] = 0;
   }
   if(isNaN(hurricaneKota[xi]) || hurricaneKota[xi] == undefined)
   {
      hurricaneKota[xi] = 0;
   }
   if(isNaN(earthquakeKota[xi]) || earthquakeKota[xi] == undefined)
   {
      earthquakeKota[xi] = 0;
   }
   if(map.list_mc._currentframe == 1)
   {
      map.list_mc.money = "$" + moneyKota[xi];
      map.list_mc.food = foodKota[xi];
      map.list_mc.iron = ironKota[xi];
      map.list_mc.wood = woodKota[xi];
      map.list_mc.sword = swordKota[xi];
      map.list_mc.xarrow = xarrowKota[xi];
      map.list_mc.soldier = soldierKota[xi];
      map.list_mc.worker = workerKota[xi];
   }
   else if(map.list_mc._currentframe == 2)
   {
      map.list_mc.diamond = diamondKota[xi];
      map.list_mc.coal = coalKota[xi];
      map.list_mc.oil = oilKota[xi];
      map.list_mc.spear = spearKota[xi];
      map.list_mc.horse = horseKota[xi];
      map.list_mc.catapult = catapultKota[xi];
      map.list_mc.witch = witchKota[xi];
      map.list_mc.elephant = elephantKota[xi];
   }
   else if(map.list_mc._currentframe == 3)
   {
      map.list_mc.fire = fireKota[xi];
      map.list_mc.steel = steelKota[xi];
      map.list_mc.xsuper = xsuperKota[xi];
      map.list_mc.iceball = iceballKota[xi];
      map.list_mc.fireball = fireballKota[xi];
      map.list_mc.poison = poisonKota[xi];
      map.list_mc.hurricane = hurricaneKota[xi];
      map.list_mc.earthquake = earthquakeKota[xi];
   }
   if(tingkatSulit == 1)
   {
      map.list_mc.xlevel = "DỄ";
   }
   else if(tingkatSulit == 2)
   {
      map.list_mc.xlevel = "TRUNG BÌNH";
   }
   else if(tingkatSulit == 3)
   {
      map.list_mc.xlevel = "KHÓ";
   }
   else if(tingkatSulit == 4)
   {
      map.list_mc.xlevel = "CỰC KHÓ";
   }
   if(jenisKerajaan == 1)
   {
      map.list_mc.xkerajaan = "ZARGAS";
   }
   else if(jenisKerajaan == 2)
   {
      map.list_mc.xkerajaan = "ARTAVERA";
   }
   map.day = "NGÀY \n" + day;
}
function awalSemua()
{
   zawalMoney = moneyKota[pilihKota];
   zawalFood = foodKota[pilihKota];
   zawalIron = ironKota[pilihKota];
   zawalWood = woodKota[pilihKota];
   zawalSword = swordKota[pilihKota];
   zawalArrow = xarrowKota[pilihKota];
   zawalSoldier = soldierKota[pilihKota];
   zawalWorker = workerKota[pilihKota];
   zawalDiamond = diamondKota[pilihKota];
   zawalCoal = coalKota[pilihKota];
   zawalOil = oilKota[pilihKota];
   zawalSpear = spearKota[pilihKota];
   zawalHorse = horseKota[pilihKota];
   zawalCatapult = catapultKota[pilihKota];
   zawalWitch = witchKota[pilihKota];
   zawalElephant = elephantKota[pilihKota];
   zawalFire = fireKota[pilihKota];
   zawalSteel = steelKota[pilihKota];
   zawalSuper = xsuperKota[pilihKota];
   zawalIceball = iceballKota[pilihKota];
   zawalFireball = fireballKota[pilihKota];
   zawalPoison = poisonKota[pilihKota];
   zawalHurricane = hurricaneKota[pilihKota];
   zawalEarthquake = earthquakeKota[pilihKota];
}
function dayItung()
{
   if(xpause == false)
   {
      day++;
      awalSemua();
      randomFood = 3 + random(3);
      randomIron = 3 * (3 + random(3));
      randomLog = 2 * (3 + random(3));
      randomPearl = 7 * (3 + random(3));
      randomCoal = 6 * (3 + random(3));
      randomOil = 5 * (3 + random(3));
      randomSteel = 8 * (3 + random(3));
      sekaliIlang = false;
      i = 1;
      while(i <= bykKota)
      {
         j = 1;
         while(j <= bykArea)
         {
            k = 1;
            while(k <= bykProperti)
            {
               if(jenisBangunan[i][j][k] == 3)
               {
                  foodKota[i] += 200 * upgradeProperti[i][j][k];
               }
               else if(jenisBangunan[i][j][k] == 10)
               {
                  foodKota[i] += 250 * upgradeProperti[i][j][k];
               }
               else if(jenisBangunan[i][j][k] == 15)
               {
                  var fAmt15 = 300;
                  if(tingkatSulit >= 3 && punyaWilayah[i] == jenisKerajaan)
                  {
                     fAmt15 = 150;
                  }
                  foodKota[i] += fAmt15 * upgradeProperti[i][j][k];
               }
               else if(jenisBangunan[i][j][k] == 16)
               {
                  foodKota[i] += 300 * upgradeProperti[i][j][k];
               }
               else if(jenisBangunan[i][j][k] == 13)
               {
                  diamondKota[i] += 4 * upgradeProperti[i][j][k];
               }
               else if(jenisBangunan[i][j][k] == 22)
               {
                  moneyKota[i] -= 45 * upgradeProperti[i][j][k];
                  foodKota[i] -= 30 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0)
                  {
                     steelKota[i] += 5 * upgradeProperti[i][j][k];
                  }
               }
               k++;
            }
            j++;
         }
         i++;
      }
      i = 1;
      while(i <= bykKota)
      {
         j = 1;
         while(j <= bykArea)
         {
            k = 1;
            while(k <= bykProperti)
            {
               if(jenisBangunan[i][j][k] == 4)
               {
                  foodKota[i] -= 50 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0)
                  {
                     var mktIncome = 100;
                     if(tingkatSulit >= 3 && punyaWilayah[i] == jenisKerajaan)
                     {
                        mktIncome = 50;
                     }
                     moneyKota[i] += mktIncome * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 5)
               {
                  moneyKota[i] -= 10 * upgradeProperti[i][j][k];
                  foodKota[i] -= 20 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0)
                  {
                     woodKota[i] += 10 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 6)
               {
                  moneyKota[i] -= 20 * upgradeProperti[i][j][k];
                  foodKota[i] -= 25 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0)
                  {
                     ironKota[i] += 5 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 7)
               {
                  moneyKota[i] -= 15 * upgradeProperti[i][j][k];
                  foodKota[i] -= 10 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && woodKota[i] > 2 * upgradeProperti[i][j][k] && ironKota[i] > 5 * upgradeProperti[i][j][k])
                  {
                     swordKota[i] += 1 * upgradeProperti[i][j][k];
                  }
                  if(woodKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     woodKota[i] -= 2 * upgradeProperti[i][j][k];
                  }
                  if(ironKota[i] > 5 * upgradeProperti[i][j][k])
                  {
                     ironKota[i] -= 5 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 8)
               {
                  moneyKota[i] -= 15 * upgradeProperti[i][j][k];
                  foodKota[i] -= 10 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && woodKota[i] > 4 * upgradeProperti[i][j][k] && ironKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     xarrowKota[i] += 1 * upgradeProperti[i][j][k];
                  }
                  if(woodKota[i] > 4 * upgradeProperti[i][j][k])
                  {
                     woodKota[i] -= 4 * upgradeProperti[i][j][k];
                  }
                  if(ironKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     ironKota[i] -= 2 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 9)
               {
                  moneyKota[i] -= 30 * upgradeProperti[i][j][k];
                  if(workerKota[i] >= 2 * upgradeProperti[i][j][k] && moneyKota[i] > 0)
                  {
                     soldierKota[i] += 2 * upgradeProperti[i][j][k];
                     workerKota[i] -= 2 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 11)
               {
                  moneyKota[i] -= 15 * upgradeProperti[i][j][k];
                  foodKota[i] -= 10 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0)
                  {
                     moneyKota[i] += 200 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 12)
               {
                  moneyKota[i] -= 15 * upgradeProperti[i][j][k];
                  foodKota[i] -= 10 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && ironKota[i] > 10 * upgradeProperti[i][j][k])
                  {
                     spearKota[i] += 1 * upgradeProperti[i][j][k];
                  }
                  if(ironKota[i] > 10 * upgradeProperti[i][j][k])
                  {
                     ironKota[i] -= 10 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 14)
               {
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && workerKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     horseKota[i] += 2 * upgradeProperti[i][j][k];
                     workerKota[i] -= 2 * upgradeProperti[i][j][k];
                     moneyKota[i] -= 20 * upgradeProperti[i][j][k];
                     foodKota[i] -= 30 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 17)
               {
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && workerKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     elephantKota[i] += 1 * upgradeProperti[i][j][k];
                     workerKota[i] -= 1 * upgradeProperti[i][j][k];
                     moneyKota[i] -= 30 * upgradeProperti[i][j][k];
                     foodKota[i] -= 40 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 18)
               {
                  moneyKota[i] -= 20 * upgradeProperti[i][j][k];
                  foodKota[i] -= 15 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0)
                  {
                     coalKota[i] += 3 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 19)
               {
                  moneyKota[i] -= 40 * upgradeProperti[i][j][k];
                  foodKota[i] -= 25 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0)
                  {
                     oilKota[i] += 100 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 20)
               {
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && woodKota[i] > 10 * upgradeProperti[i][j][k] && ironKota[i] > 5 * upgradeProperti[i][j][k] && workerKota[i] > 5 * upgradeProperti[i][j][k])
                  {
                     catapultKota[i] += 1 * upgradeProperti[i][j][k];
                     workerKota[i] -= 1 * upgradeProperti[i][j][k];
                     moneyKota[i] -= 50 * upgradeProperti[i][j][k];
                     foodKota[i] -= 25 * upgradeProperti[i][j][k];
                  }
                  if(woodKota[i] > 10 * upgradeProperti[i][j][k])
                  {
                     woodKota[i] -= 10 * upgradeProperti[i][j][k];
                  }
                  if(ironKota[i] > 5 * upgradeProperti[i][j][k])
                  {
                     ironKota[i] -= 5 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 21)
               {
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && workerKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     moneyKota[i] -= 75 * upgradeProperti[i][j][k];
                     foodKota[i] -= 50 * upgradeProperti[i][j][k];
                     witchKota[i] += 2 * upgradeProperti[i][j][k];
                     workerKota[i] -= 2 * upgradeProperti[i][j][k];
                     if(spellBuat[i][j][k] == 1)
                     {
                        iceballKota[i] += 2 * upgradeProperti[i][j][k];
                     }
                     else if(spellBuat[i][j][k] == 2)
                     {
                        fireballKota[i] += 2 * upgradeProperti[i][j][k];
                     }
                     else if(spellBuat[i][j][k] == 3)
                     {
                        poisonKota[i] += 2 * upgradeProperti[i][j][k];
                     }
                     else if(spellBuat[i][j][k] == 4)
                     {
                        hurricaneKota[i] += 2 * upgradeProperti[i][j][k];
                     }
                     else
                     {
                        earthquakeKota[i] += 2 * upgradeProperti[i][j][k];
                     }
                  }
               }
               else if(jenisBangunan[i][j][k] == 23)
               {
                  moneyKota[i] -= 25 * upgradeProperti[i][j][k];
                  foodKota[i] -= 10 * upgradeProperti[i][j][k];
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && woodKota[i] > 4 * upgradeProperti[i][j][k] && ironKota[i] > 2 * upgradeProperti[i][j][k] && oilKota[i] > 200 * upgradeProperti[i][j][k])
                  {
                     fireKota[i] += 1 * upgradeProperti[i][j][k];
                  }
                  if(woodKota[i] > 4 * upgradeProperti[i][j][k])
                  {
                     woodKota[i] -= 4 * upgradeProperti[i][j][k];
                  }
                  if(ironKota[i] > 2 * upgradeProperti[i][j][k])
                  {
                     ironKota[i] -= 2 * upgradeProperti[i][j][k];
                  }
                  if(oilKota[i] > 200 * upgradeProperti[i][j][k])
                  {
                     oilKota[i] -= 200 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 24)
               {
                  if(diamondKota[i] > 20 * upgradeProperti[i][j][k])
                  {
                     moneyKota[i] += 2000 * upgradeProperti[i][j][k];
                  }
                  if(diamondKota[i] > 20 * upgradeProperti[i][j][k])
                  {
                     diamondKota[i] -= 20 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 25)
               {
                  if(foodKota[i] > 0 && moneyKota[i] > 0 && steelKota[i] > 25 * upgradeProperti[i][j][k] && workerKota[i] > 1 * upgradeProperti[i][j][k])
                  {
                     xsuperKota[i] += 1 * upgradeProperti[i][j][k];
                     workerKota[i] -= 1 * upgradeProperti[i][j][k];
                     moneyKota[i] -= 30 * upgradeProperti[i][j][k];
                     foodKota[i] -= 60 * upgradeProperti[i][j][k];
                  }
                  if(steelKota[i] > 25 * upgradeProperti[i][j][k])
                  {
                     steelKota[i] -= 25 * upgradeProperti[i][j][k];
                  }
               }
               else if(jenisBangunan[i][j][k] == 2)
               {
                  var houseCons = 25;
                  if(tingkatSulit == 4 && punyaWilayah[i] == jenisKerajaan)
                  {
                     houseCons = 50;
                  }
                  foodKota[i] -= houseCons * upgradeProperti[i][j][k];
                  if(foodKota[i] <= 0 && sekaliIlang == false)
                  {
                     if(punyaWilayah[i] == jenisKerajaan)
                     {
                        sekaliIlang = true;
                        workerKota[i] -= 50 * upgradeProperti[i][j][k];
                        moneyKota[i] += 100 * upgradeProperti[i][j][k];
                        jenisBangunan[i][j][k] = 1;
                        upgradeProperti[i][j][k] = 1;
                        peta["area" + k].gotoAndStop(1);
                        map["map" + j].xpeta_mc["area" + k].gotoAndStop(1);
                        cekInfo(2000,"Một ngôi nhà dân tại " + namaKota[i] + " đã bị bỏ hoang do thiếu hụt lương thực! (MẸO: Nhấn HÀNH ĐỘNG -> NHẬP KHẨU hoặc xây thêm ruộng lúa, ao tôm, trại bò ngay)",2,i);
                        cekAnim();
                        i = bykKota;
                        j = bykArea;
                        k = bykProperti;
                     }
                  }
               }
               k++;
            }
            j++;
         }
         i++;
      }
      xadaIlang = false;
      i = 1;
      while(i <= bykKota)
      {
         if(tingkatSulit == 3 || tingkatSulit == 4)
         {
            moneyKota[i] -= soldierKota[i] * 2;
            moneyKota[i] -= horseKota[i] * 3;
            moneyKota[i] -= catapultKota[i] * 7;
            moneyKota[i] -= witchKota[i] * 5;
            moneyKota[i] -= elephantKota[i] * 4;
            moneyKota[i] -= xsuperKota[i] * 10;
         }
         if(moneyKota[i] < 0)
         {
            xadaIlang = true;
         }
         else if(workerKota[i] < 0)
         {
            xadaIlang = true;
         }
         i++;
      }
      if(xadaIlang == true)
      {
         adaKurangSoldier = false;
         i = 1;
         while(i <= bykKota)
         {
            if(moneyKota[i] < 0 && soldierKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(soldierKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = soldierKota[i];
                  }
                  soldierKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Binh lính tại " + namaKota[i] + " đã đào ngũ do ngân khố không đủ tiền trả lương! (MẸO: Nhấn HÀNH ĐỘNG -> XUẤT KHẨU hoặc xây thêm mỏ vàng, chợ)",2,i);
               }
            }
            else if(workerKota[i] < 0 && soldierKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(soldierKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = soldierKota[i];
                  }
                  soldierKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Binh lính tại " + namaKota[i] + " đã rời đi do không có đủ nhà dân để cư trú! (MẸO: Hãy xây dựng thêm nhà ở)",2,i);
               }
            }
            if(moneyKota[i] < 0 && horseKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(horseKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = horseKota[i];
                  }
                  horseKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Kỵ binh tại " + namaKota[i] + " đã đào ngũ do không có tiền trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);
               }
            }
            else if(workerKota[i] < 0 && horseKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(horseKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = horseKota[i];
                  }
                  horseKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Kỵ binh tại " + namaKota[i] + " đã rời đi do không đủ nhà ở! (MẸO: Xây thêm nhà ở)",2,i);
               }
            }
            if(moneyKota[i] < 0 && catapultKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(catapultKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = catapultKota[i];
                  }
                  catapultKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Lính máy bắn đá tại " + namaKota[i] + " đã rời đi do không đủ tiền trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);
               }
            }
            else if(workerKota[i] < 0 && catapultKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(catapultKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = catapultKota[i];
                  }
                  catapultKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Lính máy bắn đá tại " + namaKota[i] + " đã rời đi do thiếu nhà ở! (MẸO: Xây thêm nhà ở)",2,i);
               }
            }
            if(moneyKota[i] < 0 && witchKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(witchKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = witchKota[i];
                  }
                  witchKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Phù thủy tại " + namaKota[i] + " đã rời đi do không có tiền chi trả lương bổng! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);
               }
            }
            else if(workerKota[i] < 0 && witchKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(witchKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = witchKota[i];
                  }
                  witchKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Phù thủy tại " + namaKota[i] + " đã rời đi do không đủ nhà ở! (MẸO: Xây thêm nhà ở)",2,i);
               }
            }
            if(moneyKota[i] < 0 && elephantKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(elephantKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = elephantKota[i];
                  }
                  elephantKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Quân lính voi tại " + namaKota[i] + " đã rời đi do không đủ tiền trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);
               }
            }
            else if(workerKota[i] < 0 && elephantKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(elephantKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = elephantKota[i];
                  }
                  elephantKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Quân lính voi tại " + namaKota[i] + " đã rời đi do thiếu nhà ở! (MẸO: Xây thêm nhà ở)",2,i);
               }
            }
            if(moneyKota[i] < 0 && xsuperKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(xsuperKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = xsuperKota[i];
                  }
                  xsuperKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Siêu chiến binh tại " + namaKota[i] + " đã giải tán do không có tiền chi trả lương! (MẸO: Xuất khẩu hàng hóa hoặc xây mỏ vàng, chợ)",2,i);
               }
            }
            else if(workerKota[i] < 0 && xsuperKota[i] > 0)
            {
               if(punyaWilayah[i] == jenisKerajaan)
               {
                  adaKurangSoldier = true;
                  kurangSoldier = 5;
                  if(xsuperKota[i] <= kurangSoldier)
                  {
                     kurangSoldier = xsuperKota[i];
                  }
                  xsuperKota[i] -= kurangSoldier;
                  workerKota[i] += kurangSoldier;
                  cekInfo(2000,"Siêu chiến binh tại " + namaKota[i] + " đã rời đi do không đủ nhà ở! (MẸO: Xây thêm nhà ở)",2,i);
               }
            }
            i++;
         }
         a = bykBangunan;
         while(a >= 2)
         {
            i = 1;
            while(i <= bykKota)
            {
               j = 1;
               while(j <= bykArea)
               {
                  k = 1;
                  while(k <= bykProperti)
                  {
                     if(workerKota[i] < 0 && soldierKota[i] <= 0)
                     {
                        adaIlang = false;
                        yangHilang = "";
                        if(jenisBangunan[i][j][k] == a)
                        {
                           if(a == 9)
                           {
                              yangHilang = "doanh trại lính";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 25)
                           {
                              yangHilang = "trại lính siêu cấp";
                              workerKota[i] += 30 * upgradeProperti[i][j][k];
                           }
                           else if(a == 23)
                           {
                              yangHilang = "lò rèn cung lửa";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 12)
                           {
                              yangHilang = "lò rèn giáo";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 8)
                           {
                              yangHilang = "lò rèn cung";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 7)
                           {
                              yangHilang = "lò rèn kiếm";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 20)
                           {
                              yangHilang = "xưởng máy bắn đá";
                              workerKota[i] += 25 * upgradeProperti[i][j][k];
                           }
                           else if(a == 21)
                           {
                              yangHilang = "nhà phù thủy";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 14)
                           {
                              yangHilang = "chuồng ngựa";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 17)
                           {
                              yangHilang = "chuồng voi";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 22)
                           {
                              yangHilang = "mỏ thép";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 24)
                           {
                              yangHilang = "tiệm đá quý";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 13)
                           {
                              yangHilang = "hồ ngọc trai";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 19)
                           {
                              yangHilang = "nhà máy lọc dầu";
                              workerKota[i] += 15 * upgradeProperti[i][j][k];
                           }
                           else if(a == 18)
                           {
                              yangHilang = "mỏ than";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 11)
                           {
                              yangHilang = "mỏ vàng";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 6)
                           {
                              yangHilang = "mỏ sắt";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 5)
                           {
                              yangHilang = "xưởng gỗ";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 15)
                           {
                              yangHilang = "trại bò";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 16)
                           {
                              yangHilang = "ao tôm";
                              workerKota[i] += 15 * upgradeProperti[i][j][k];
                           }
                           else if(a == 4)
                           {
                              yangHilang = "chợ";
                              workerKota[i] += 20 * upgradeProperti[i][j][k];
                           }
                           else if(a == 3)
                           {
                              yangHilang = "ruộng lúa";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 10)
                           {
                              yangHilang = "hồ cá";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           adaIlang = true;
                        }
                        if(adaIlang == true)
                        {
                           if(punyaWilayah[i] == jenisKerajaan)
                           {
                              upgradeProperti[i][j][k] = 1;
                              jenisBangunan[i][j][k] = 1;
                              peta["area" + k].gotoAndStop(1);
                              map["map" + j].xpeta_mc["area" + k].gotoAndStop(1);
                              cekInfo(2000,"Một " + yangHilang + " tại " + namaKota[i] + " đã bị bỏ hoang do không đủ nhà ở cho thợ! (MẸO: Đừng để nhà ở thiếu hụt, luôn kiểm tra dân số tự do)",2,i);
                              cekAnim();
                              i = bykKota;
                              j = bykArea;
                              k = bykProperti;
                              a = 2;
                           }
                        }
                     }
                     else if(moneyKota[i] < 0 && adaKurangSoldier == false)
                     {
                        adaIlang = false;
                        yangHilang = "";
                        if(jenisBangunan[i][j][k] == a)
                        {
                           if(a == 9)
                           {
                              yangHilang = "doanh trại lính";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 25)
                           {
                              yangHilang = "trại lính siêu cấp";
                              workerKota[i] += 30 * upgradeProperti[i][j][k];
                           }
                           else if(a == 23)
                           {
                              yangHilang = "lò rèn cung lửa";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 12)
                           {
                              yangHilang = "lò rèn giáo";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 8)
                           {
                              yangHilang = "lò rèn cung";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 7)
                           {
                              yangHilang = "lò rèn kiếm";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 20)
                           {
                              yangHilang = "xưởng máy bắn đá";
                              workerKota[i] += 25 * upgradeProperti[i][j][k];
                           }
                           else if(a == 21)
                           {
                              yangHilang = "nhà phù thủy";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 14)
                           {
                              yangHilang = "chuồng ngựa";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 17)
                           {
                              yangHilang = "chuồng voi";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 22)
                           {
                              yangHilang = "mỏ thép";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 24)
                           {
                              yangHilang = "tiệm đá quý";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 13)
                           {
                              yangHilang = "hồ ngọc trai";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 19)
                           {
                              yangHilang = "nhà máy lọc dầu";
                              workerKota[i] += 15 * upgradeProperti[i][j][k];
                           }
                           else if(a == 18)
                           {
                              yangHilang = "mỏ than";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 11)
                           {
                              yangHilang = "mỏ vàng";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 6)
                           {
                              yangHilang = "mỏ sắt";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 5)
                           {
                              yangHilang = "xưởng gỗ";
                              workerKota[i] += 5 * upgradeProperti[i][j][k];
                           }
                           else if(a == 15)
                           {
                              yangHilang = "trại bò";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 16)
                           {
                              yangHilang = "ao tôm";
                              workerKota[i] += 15 * upgradeProperti[i][j][k];
                           }
                           else if(a == 4)
                           {
                              yangHilang = "chợ";
                              workerKota[i] += 20 * upgradeProperti[i][j][k];
                           }
                           else if(a == 3)
                           {
                              yangHilang = "ruộng lúa";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           else if(a == 10)
                           {
                              yangHilang = "hồ cá";
                              workerKota[i] += 10 * upgradeProperti[i][j][k];
                           }
                           adaIlang = true;
                        }
                        if(adaIlang == true)
                        {
                           if(punyaWilayah[i] == jenisKerajaan)
                           {
                              upgradeProperti[i][j][k] = 1;
                              jenisBangunan[i][j][k] = 1;
                              peta["area" + k].gotoAndStop(1);
                              map["map" + j].xpeta_mc["area" + k].gotoAndStop(1);
                              cekInfo(2000,"Một " + yangHilang + " tại " + namaKota[i] + " đã bị bán tháo do không đủ tiền trả công cho thợ! (MẸO: Xuất khẩu hàng hóa hoặc xây thêm mỏ vàng, chợ)",2,i);
                              cekAnim();
                              i = bykKota;
                              j = bykArea;
                              k = bykProperti;
                              a = 2;
                           }
                        }
                     }
                     k++;
                  }
                  j++;
               }
               i++;
            }
            a--;
         }
      }

      // ================= LOGISTICS & REGIONAL TRADE GDP ENGINE =================
      var _resPrices = new Array(0, 4, 12, 8, 28, 24, 20, 32, 1);
      var _dailyExportVal = new Array();
      var _dailyImportVal = new Array();
      var _li = 1;
      while(_li <= 12)
      {
         _dailyExportVal[_li] = 0;
         _dailyImportVal[_li] = 0;
         _li++;
      }
      
      // 1. Commodity Logistics (1 resource type per region)
      var _src = 1;
      while(_src <= 12)
      {
         if(punyaWilayah[_src] == jenisKerajaan)
         {
            var _rType = _root.logisticsResType[_src];
            if(_rType > 0 && _rType <= 8)
            {
               var _stock = 0;
               if(_rType == 1) _stock = foodKota[_src];
               else if(_rType == 2) _stock = ironKota[_src];
               else if(_rType == 3) _stock = woodKota[_src];
               else if(_rType == 4) _stock = diamondKota[_src];
               else if(_rType == 5) _stock = coalKota[_src];
               else if(_rType == 6) _stock = oilKota[_src];
               else if(_rType == 7) _stock = steelKota[_src];
               else if(_rType == 8) _stock = moneyKota[_src];
               
               var _totalReq = 0;
               var _dst = 1;
               while(_dst <= 12)
               {
                  if(_dst != _src && punyaWilayah[_dst] == jenisKerajaan)
                  {
                     var _reqAmt = Number(_root.logisticsAmount[_src][_dst]);
                     if(_reqAmt > 0) _totalReq += _reqAmt;
                  }
                  _dst++;
               }
               
               if(_totalReq > 0 && _stock > 0)
               {
                  var _factor = 1.0;
                  if(_stock < _totalReq) _factor = _stock / _totalReq;
                  
                  var _totalActuallySent = 0;
                  _dst = 1;
                  while(_dst <= 12)
                  {
                     if(_dst != _src && punyaWilayah[_dst] == jenisKerajaan)
                     {
                        var _reqAmt2 = Number(_root.logisticsAmount[_src][_dst]);
                        if(_reqAmt2 > 0)
                        {
                           var _actualSend = Math.floor(_reqAmt2 * _factor);
                           if(_actualSend > 0)
                           {
                              _totalActuallySent += _actualSend;
                              if(_rType == 1) foodKota[_dst] += _actualSend;
                              else if(_rType == 2) ironKota[_dst] += _actualSend;
                              else if(_rType == 3) woodKota[_dst] += _actualSend;
                              else if(_rType == 4) diamondKota[_dst] += _actualSend;
                              else if(_rType == 5) coalKota[_dst] += _actualSend;
                              else if(_rType == 6) oilKota[_dst] += _actualSend;
                              else if(_rType == 7) steelKota[_dst] += _actualSend;
                              else if(_rType == 8) moneyKota[_dst] += _actualSend;
                              
                              var _tradeVal = _actualSend * _resPrices[_rType];
                              _dailyExportVal[_src] += _tradeVal;
                              _dailyImportVal[_dst] += _tradeVal;
                           }
                        }
                     }
                     _dst++;
                  }
                  
                  if(_rType == 1) foodKota[_src] -= _totalActuallySent;
                  else if(_rType == 2) ironKota[_src] -= _totalActuallySent;
                  else if(_rType == 3) woodKota[_src] -= _totalActuallySent;
                  else if(_rType == 4) diamondKota[_src] -= _totalActuallySent;
                  else if(_rType == 5) coalKota[_src] -= _totalActuallySent;
                  else if(_rType == 6) oilKota[_src] -= _totalActuallySent;
                  else if(_rType == 7) steelKota[_src] -= _totalActuallySent;
                  else if(_rType == 8) moneyKota[_src] -= _totalActuallySent;
               }
            }
         }
         _src++;
      }
      
      // 2. Worker / Population Migration (SEPARATE from commodity limit!)
      var _wSrc = 1;
      while(_wSrc <= 12)
      {
         if(punyaWilayah[_wSrc] == jenisKerajaan)
         {
            var _availWorkers = workerKota[_wSrc];
            var _totalReqWorkers = 0;
            var _wDst = 1;
            while(_wDst <= 12)
            {
               if(_wDst != _wSrc && punyaWilayah[_wDst] == jenisKerajaan)
               {
                  var _wAmt = Number(_root.logisticsWorkerAmount[_wSrc][_wDst]);
                  if(_wAmt > 0) _totalReqWorkers += _wAmt;
               }
               _wDst++;
            }
            
            if(_totalReqWorkers > 0 && _availWorkers > 0)
            {
               var _wFactor = 1.0;
               if(_availWorkers < _totalReqWorkers) _wFactor = _availWorkers / _totalReqWorkers;
               
               var _totalActuallyMoved = 0;
               _wDst = 1;
               while(_wDst <= 12)
               {
                  if(_wDst != _wSrc && punyaWilayah[_wDst] == jenisKerajaan)
                  {
                     var _wAmt2 = Number(_root.logisticsWorkerAmount[_wSrc][_wDst]);
                     if(_wAmt2 > 0)
                     {
                        var _actMove = Math.floor(_wAmt2 * _wFactor);
                        if(_actMove > 0)
                        {
                           _totalActuallyMoved += _actMove;
                           workerKota[_wDst] += _actMove;
                        }
                     }
                  }
                  _wDst++;
               }
               workerKota[_wSrc] -= _totalActuallyMoved;
            }
         }
         _wSrc++;
      }
      
      // 3. Update Net Regional Trade GDP
      var _gi = 1;
      while(_gi <= 12)
      {
         _root.exportGdpKota[_gi] = _dailyExportVal[_gi];
         _root.importGdpKota[_gi] = _dailyImportVal[_gi];
         _root.gdpKota[_gi] = _dailyExportVal[_gi] - _dailyImportVal[_gi];
         _gi++;
      }
      
      // 4. Normal difficulty neutral garrison accumulation
      if(tingkatSulit == 2)
      {
         var _ni = 1;
         while(_ni <= 12)
         {
            if(punyaWilayah[_ni] == 0)
            {
               _root.neutralAccumulatedGarrison[_ni] += 1;
            }
            _ni++;
         }
      }

      akhirSemua();
      if(day == lawanNyerang)
      {
         // MOD: Vung trung lap khong tu tan cong chu dong!
         lawanNyerang += 100;
         xrand1 = random(2) + 1;
         xrand2 = random(2) + 1;
         xrand3 = random(2) + 1;
         xrand4 = random(2) + 1;
         xadaSerang = new Array();
         xkeSerang = 0;
         i = 1;
         while(i <= bykKota)
         {
            if(punyaWilayah[i] == 0)
            {
               j = 1;
               while(j <= linkWilayah[i].length - 1)
               {
                  if(punyaWilayah[linkWilayah[i][j]] != 0)
                  {
                     xadaSerang[xkeSerang] = i;
                     xkeSerang++;
                  }
                  j++;
               }
            }
            i++;
         }
         if(xkeSerang > 0)
         {
            xrand = random(xadaSerang.length - 1);
            i = xadaSerang[xrand];
            yangMenyerang = i;
            adaSerang = new Array();
            keSerang = 0;
            j = 1;
            while(j <= linkWilayah[i].length - 1)
            {
               if(punyaWilayah[linkWilayah[i][j]] != 0)
               {
                  adaSerang[keSerang] = linkWilayah[i][j];
                  keSerang++;
               }
               j++;
            }
            if(keSerang > 0)
            {
               rand = random(adaSerang.length - 1);
               yangDiserang = adaSerang[rand];
               if(punyaWilayah[yangDiserang] == jenisKerajaan)
               {
                  cekInfo(2000,"Quân Man Tộc đã tấn công thành phố " + namaKota[yangDiserang] + " của bạn từ " + namaKota[yangMenyerang] + "!");
                  xrand1 = random(2) + 1;
                  xrand2 = random(2) + 1;
                  xrand3 = random(2) + 1;
                  xrand4 = random(2) + 1;
                  tipeMenyerang = 0;
                  jenisMenyerang = 1;
                  if(tingkatSulit == 3)
                  {
                     randBribe = random(100);
                  }
                  else if(tingkatSulit == 4)
                  {
                     randBribe = random(150);
                  }
                  else
                  {
                     randBribe = -9;
                  }
                  cekDiserang("Barbarian");
               }
               else
               {
                  if(tingkatSulit == 1)
                  {
                     wrand = random(110);
                  }
                  else if(tingkatSulit == 2)
                  {
                     wrand = random(100);
                  }
                  else if(tingkatSulit == 3)
                  {
                     wrand = random(90);
                  }
                  else if(tingkatSulit == 4)
                  {
                     wrand = random(80);
                  }
                  if(wrand >= 70)
                  {
                     cekInfo(2000,"Quân Man Tộc đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " và đã chiếm đóng thành công thành phố!");
                     punyaWilayah[yangDiserang] = 0;
                  }
                  else
                  {
                     cekInfo(2000,"Quân Man Tộc đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " nhưng đã bị đẩy lùi thất bại!");
                  }
               }
            }
         }
      }
      else if(day == lawanNyerang2)
      {
         if(lawanNyerang2 == lawanNyerang)
         {
            lawanNyerang += random(25) + 25;
         }
         if(tingkatSulit == 1)
         {
            lawanNyerang2 += random(90) + 90;
         }
         else if(tingkatSulit == 2)
         {
            lawanNyerang2 += random(60) + 60;
         }
         else if(tingkatSulit == 3)
         {
            lawanNyerang2 += random(50) + 50;
         }
         else if(tingkatSulit == 4)
         {
            lawanNyerang2 += random(40) + 40;
         }
         if(lawanNyerang2 == lawanNyerang)
         {
            lawanNyerang += random(25) + 25;
         }
         xrand1 = random(2) + 1;
         xrand2 = random(2) + 1;
         xrand3 = random(2) + 1;
         xrand4 = random(2) + 1;
         xadaSerang = new Array();
         xkeSerang = 0;
         i = 1;
         while(i <= bykKota)
         {
            if(punyaWilayah[i] == jenisMusuh)
            {
               j = 1;
               while(j <= linkWilayah[i].length - 1)
               {
                  if(punyaWilayah[linkWilayah[i][j]] != jenisMusuh)
                  {
                     xadaSerang[xkeSerang] = i;
                     xkeSerang++;
                  }
                  j++;
               }
            }
            i++;
         }
         if(xkeSerang > 0)
         {
            xrand = random(xadaSerang.length);
            i = xadaSerang[xrand];
            yangMenyerang = i;
            adaSerang = new Array();
            keSerang = 0;
            j = 1;
            while(j <= linkWilayah[i].length - 1)
            {
               if(punyaWilayah[linkWilayah[i][j]] != jenisMusuh)
               {
                  adaSerang[keSerang] = linkWilayah[i][j];
                  keSerang++;
               }
               j++;
            }
            if(keSerang > 0)
            {
               rand = random(adaSerang.length);
               yangDiserang = adaSerang[rand];
               if(punyaWilayah[yangDiserang] == jenisKerajaan)
               {
                  cekInfo(2000,"Quân đội " + namaEmpire[jenisMusuh] + " đã tấn công thành phố " + namaKota[yangDiserang] + " của bạn từ " + namaKota[yangMenyerang] + "!");
                  xrand1 = random(2) + 1;
                  xrand2 = random(2) + 1;
                  xrand3 = random(2) + 1;
                  xrand4 = random(2) + 1;
                  tipeMenyerang = jenisMusuh;
                  jenisMenyerang = 2;
                  if(tingkatSulit == 3)
                  {
                     randBribe = random(100);
                  }
                  else if(tingkatSulit == 4)
                  {
                     randBribe = random(150);
                  }
                  else
                  {
                     randBribe = -9;
                  }
                  cekDiserang(namaEmpire[jenisMusuh]);
               }
               else
               {
                  if(tingkatSulit == 1)
                  {
                     wrand = random(90);
                  }
                  else if(tingkatSulit == 2)
                  {
                     wrand = random(100);
                  }
                  else if(tingkatSulit == 3)
                  {
                     wrand = random(110);
                  }
                  else if(tingkatSulit == 4)
                  {
                     wrand = random(120);
                  }
                  if(wrand >= 20)
                  {
                     cekInfo(2000,"Quân đội " + namaEmpire[jenisMusuh] + " đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " và chiếm đóng thành phố thành công!");
                     punyaWilayah[yangDiserang] = jenisMusuh;
                     if(jenisMusuh == 1)
                     {
                        posSatu = yangDiserang;
                     }
                     else if(jenisMusuh == 2)
                     {
                        posDua = yangDiserang;
                     }
                  }
                  else
                  {
                     cekInfo(2000,"Quân đội " + namaEmpire[jenisMusuh] + " đã tấn công " + namaKota[yangDiserang] + " từ " + namaKota[yangMenyerang] + " nhưng đã bị đẩy lùi thất bại!");
                  }
               }
            }
         }
      }
   }
}
function cekJmlMusuh()
{
   zjmlMusuh = 0;
   zcity = 0;
   wcity = 0;
   i = 1;
   while(i <= bykKota)
   {
      if(punyaWilayah[i] == jenisKerajaan)
      {
         zcity++;
      }
      else if(punyaWilayah[i] == jenisMusuh)
      {
         wcity++;
      }
      i++;
   }
   zcity2 = 0;
   if(zcity >= 6)
   {
      zcity2 = 13 - zcity;
   }
   else
   {
      zcity2 = zcity;
   }
   actions.city = zcity;
   if(tingkatSulit == 1)
   {
      if(jenisMenyerang == 1)
      {
         // De: Vung trung lap suc manh cung, khong tang theo ngay
         zjmlMusuh = Math.floor(75 * (zcity2 * persenMusuh));
      }
      else
      {
         zjmlMusuh = Math.floor(75 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);
      }
   }
   else if(tingkatSulit == 2)
   {
      zjmlMusuh = Math.floor(150 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);
      if(jenisMenyerang == 1)
      {
         // Trung binh: Vung trung lap tich luy quan, tang tien suc manh theo ngay
         var nAcc = _root.neutralAccumulatedGarrison[kotaDiserang];
         if(nAcc == undefined) nAcc = 0;
         zjmlMusuh += nAcc + Math.floor(day * 0.4);
      }
   }
   else if(tingkatSulit == 3)
   {
      zjmlMusuh = Math.floor(250 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);
   }
   else if(tingkatSulit == 4)
   {
      zjmlMusuh = Math.floor(300 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);
   }
   if(tingkatSulit == 3)
   {
      zjmlMusuh += wcity * 25;
   }
   else if(tingkatSulit == 4)
   {
      zjmlMusuh += wcity * 25;
   }
   if(jenisMenyerang == 1)
   {
      zjmlMusuh = Math.floor(zjmlMusuh / 10);
   }
   else if(jenisMenyerang == 2)
   {
      zjmlMusuh = Math.floor(zjmlMusuh / 7.5);
   }
   if(tipeWar == "serang" && _root.citySurvivingTroops[kotaDiserang] != undefined && _root.citySurvivingTroops[kotaDiserang] > 0)
   {
      zjmlMusuh = Math.max(1, Math.floor(_root.citySurvivingTroops[kotaDiserang] / 10));
   }
}
function cekDiserang(aindi)
{
   aindi = aindi;
   pilihKota = yangDiserang;
   xkotaDiserang = pilihKota;
   xpilihKota = yangDiserang;
   clearSemua();
   initSemua();
   xi = pilihKota;
   map.list_mc.gotoAndStop(1);
   map.list_mc.money = "$" + moneyKota[xi];
   map.list_mc.food = foodKota[xi];
   map.list_mc.iron = ironKota[xi];
   map.list_mc.wood = woodKota[xi];
   map.list_mc.sword = swordKota[xi];
   map.list_mc.xarrow = xarrowKota[xi];
   map.list_mc.soldier = soldierKota[xi];
   map.list_mc.worker = workerKota[xi];
   map.day = "NGÀY \n" + day;
   bisaTombol2(false);
   bisaTombol(false);
   xpause = true;
   actions = attachMovie("actions_mc","actions_mc",dalamActions);
   actions.gotoAndStop(8);
   actions._x = 340;
   actions._y = 240;
   actions.isi = "Thành phố " + namaKota[yangDiserang] + " đang bị " + aindi + " tấn công! Bạn chọn phương án nào?\nPHÒNG THỦ: Nghênh chiến chống giặc.\nHỐI LỘ: Cống nạp của cải cầu hòa.\nRÚT LUI: Rút quân về thành lân cận.\nĐẦU HÀNG: Bỏ thành không kháng cự.";
   tipeWar = "bertahan";
   actions.defense_btn.onRelease = function()
   {
      bisaWar = false;
      if(soldierKota[xkotaDiserang] > 0 || horseKota[xkotaDiserang] > 0 || elephantKota[xkotaDiserang] > 0 || catapultKota[xkotaDiserang] > 0 || xsuperKota[xkotaDiserang] > 0 || witchKota[xkotaDiserang] > 0)
      {
         if(swordKota[pilihKota] > 0 || xarrowKota[pilihKota] > 0 || spearKota[pilihKota] > 0 || fireKota[pilihKota] > 0 || coalKota[pilihKota] > 0 || iceballKota[pilihKota] > 0 || fireballKota[pilihKota] > 0 || poisonKota[pilihKota] > 0 || hurricaneKota[pilihKota] > 0 || earthquakeKota[pilihKota] > 0)
         {
            bisaWar = true;
            klikWar("sudah");
         }
      }
      if(bisaWar == false)
      {
         if(xsuperKota[xkotaDiserang] > 0)
         {
            bisaWar = true;
            klikWar("sudah");
         }
      }
      if(bisaWar == false)
      {
         actions.isi = "Thành phố không có binh lính hoặc vũ khí để phòng thủ! Hãy chọn hành động khác:\nHỐI LỘ: Cống nạp của cải để địch rút lui.\nRÚT LUI: Rút về thành trì khác.\nĐẦU HÀNG: Nhường thành trì không giao chiến.";
      }
   };
   actions.bribe_btn.onRelease = function()
   {
      if(randBribe <= 75)
      {
         actions.gotoAndStop(9);
         actions.winfo = "";
         daftarNama = new Array("","Money","Foods","Irons","Logs");
         adaPenuh = true;
         i = 1;
         while(i <= 4)
         {
            actions["nama" + i] = daftarNama[i];
            if(daftarNama[i] == "Money")
            {
               actions["owned" + i] = _root.moneyKota[_root.pilihKota];
               actions["bribe" + i] = Math.floor(_root.moneyKota[_root.pilihKota] / xrand1);
               if(actions["bribe" + i] <= 0)
               {
                  actions["bribe" + i] = random(1000) + 1000;
               }
               if(actions["owned" + i] <= 0)
               {
                  adaPenuh = false;
               }
            }
            else if(daftarNama[i] == "Foods")
            {
               actions["owned" + i] = _root.foodKota[_root.pilihKota];
               actions["bribe" + i] = Math.floor(_root.foodKota[_root.pilihKota] / xrand2);
               if(actions["bribe" + i] <= 0)
               {
                  actions["bribe" + i] = random(500) + 500;
               }
               if(actions["owned" + i] <= 0)
               {
                  adaPenuh = false;
               }
            }
            else if(daftarNama[i] == "Irons")
            {
               actions["owned" + i] = _root.ironKota[_root.pilihKota];
               actions["bribe" + i] = Math.floor(_root.ironKota[_root.pilihKota] / xrand3);
               if(actions["bribe" + i] <= 0)
               {
                  actions["bribe" + i] = random(50) + 50;
               }
               if(actions["owned" + i] <= 0)
               {
                  adaPenuh = false;
               }
            }
            else if(daftarNama[i] == "Logs")
            {
               actions["owned" + i] = _root.woodKota[_root.pilihKota];
               actions["bribe" + i] = Math.floor(_root.woodKota[_root.pilihKota] / xrand4);
               if(actions["bribe" + i] <= 0)
               {
                  actions["bribe" + i] = random(75) + 75;
               }
               if(actions["owned" + i] <= 0)
               {
                  adaPenuh = false;
               }
            }
            i++;
         }
      }
      else
      {
         actions.isi = "Kẻ địch khinh thường lễ vật và từ chối lời cầu hòa! Chúng quyết tâm công phá thành phố của bạn!";
      }
      actions.xbribe_btn.onRelease = function()
      {
         if(adaPenuh == true)
         {
            i = 1;
            while(i <= 4)
            {
               if(i == 1)
               {
                  _root.moneyKota[_root.pilihKota] -= actions["bribe" + i];
               }
               else if(i == 2)
               {
                  _root.foodKota[_root.pilihKota] -= actions["bribe" + i];
               }
               else if(i == 3)
               {
                  _root.ironKota[_root.pilihKota] -= actions["bribe" + i];
               }
               else if(i == 4)
               {
                  _root.woodKota[_root.pilihKota] -= actions["bribe" + i];
               }
               i++;
            }
            actions.gotoAndStop(10);
            actions.isi = "Kẻ địch đã chấp nhận cống phẩm! Chúng đã rút quân và hủy bỏ cuộc tấn công!";
            actions.ok_btn.onRelease = function()
            {
               bisaTombol2(true);
               removeMovieClip(dunia);
               bisaTombol(true);
               removeMovieClip(actions);
               xpause = false;
            };
         }
         else
         {
            backSalah();
            actions.winfo = "Không thể hối lộ, bạn không có đủ tiền hoặc của cải!";
         }
      };
      actions.back_btn.onRelease = function()
      {
         cekDiserang(aindi);
      };
   };
   actions.retreat_btn.onRelease = function()
   {
      klikMove("diserang");
   };
   actions.surender_btn.onRelease = function()
   {
      sudahKalah = false;
      removeMovieClip(actions);
      resetWilayah(xkotaDiserang,tipeMenyerang);
      masihPunya = false;
      i = 1;
      while(i <= 12)
      {
         if(punyaWilayah[i] == jenisKerajaan)
         {
            kotaSekarang = i;
            i = 13;
            masihPunya = true;
         }
         i++;
      }
      if(masihPunya == true)
      {
         xpilihKota = kotaSekarang;
         cekPilihKota(xpilihKota);
      }
      else
      {
         cekGameOver();
      }
      if(sudahKalah == false)
      {
         initSemua();
      }
   };
}
function akhirSemua()
{
   i = 1;
   while(i <= 8)
   {
      naikTurun[i] = "-";
      i++;
   }
   if(map.list_mc._currentframe == 1)
   {
      if(moneyKota[pilihKota] > zawalMoney)
      {
         map.list_mc.arrow1.gotoAndStop(1);
         naikTurun[1] = "Tăng +" + String(moneyKota[pilihKota] - zawalMoney);
      }
      else if(moneyKota[pilihKota] < zawalMoney)
      {
         map.list_mc.arrow1.gotoAndStop(2);
         naikTurun[1] = "Giảm -" + String(zawalMoney - moneyKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow1.gotoAndStop(3);
      }
      if(foodKota[pilihKota] > zawalFood)
      {
         map.list_mc.arrow2.gotoAndStop(1);
         naikTurun[2] = "Tăng +" + String(foodKota[pilihKota] - zawalFood);
      }
      else if(foodKota[pilihKota] < zawalFood)
      {
         map.list_mc.arrow2.gotoAndStop(2);
         naikTurun[2] = "Giảm -" + String(zawalFood - foodKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow2.gotoAndStop(3);
      }
      if(ironKota[pilihKota] > zawalIron)
      {
         map.list_mc.arrow3.gotoAndStop(1);
         naikTurun[3] = "Tăng +" + String(ironKota[pilihKota] - zawalIron);
      }
      else if(ironKota[pilihKota] < zawalIron)
      {
         map.list_mc.arrow3.gotoAndStop(2);
         naikTurun[3] = "Giảm -" + String(zawalIron - ironKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow3.gotoAndStop(3);
      }
      if(woodKota[pilihKota] > zawalWood)
      {
         map.list_mc.arrow4.gotoAndStop(1);
         naikTurun[4] = "Tăng +" + String(woodKota[pilihKota] - zawalWood);
      }
      else if(woodKota[pilihKota] < zawalWood)
      {
         map.list_mc.arrow4.gotoAndStop(2);
         naikTurun[4] = "Giảm -" + String(zawalWood - woodKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow4.gotoAndStop(3);
      }
      if(swordKota[pilihKota] > zawalSword)
      {
         map.list_mc.arrow5.gotoAndStop(1);
         naikTurun[5] = "Tăng +" + String(swordKota[pilihKota] - zawalSword);
      }
      else if(swordKota[pilihKota] < zawalSword)
      {
         map.list_mc.arrow5.gotoAndStop(2);
         naikTurun[5] = "Giảm -" + String(zawalSword - swordKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow5.gotoAndStop(3);
      }
      if(xarrowKota[pilihKota] > zawalArrow)
      {
         map.list_mc.arrow6.gotoAndStop(1);
         naikTurun[6] = "Tăng +" + String(xarrowKota[pilihKota] - zawalArrow);
      }
      else if(xarrowKota[pilihKota] < zawalArrow)
      {
         map.list_mc.arrow6.gotoAndStop(2);
         naikTurun[6] = "Giảm -" + String(zawalArrow - xarrowKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow6.gotoAndStop(3);
      }
      if(soldierKota[pilihKota] > zawalSoldier)
      {
         map.list_mc.arrow7.gotoAndStop(1);
         naikTurun[7] = "Tăng +" + String(soldierKota[pilihKota] - zawalSoldier);
      }
      else if(soldierKota[pilihKota] < zawalSoldier)
      {
         map.list_mc.arrow7.gotoAndStop(2);
         naikTurun[7] = "Giảm -" + String(zawalSoldier - soldierKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow7.gotoAndStop(3);
      }
      if(workerKota[pilihKota] > zawalWorker)
      {
         map.list_mc.arrow8.gotoAndStop(1);
         naikTurun[8] = "Tăng +" + String(workerKota[pilihKota] - zawalWorker);
      }
      else if(workerKota[pilihKota] < zawalWorker)
      {
         map.list_mc.arrow8.gotoAndStop(2);
         naikTurun[8] = "Giảm -" + String(zawalWorker - workerKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow8.gotoAndStop(3);
      }
   }
   else if(map.list_mc._currentframe == 2)
   {
      if(diamondKota[pilihKota] > zawalDiamond)
      {
         map.list_mc.arrow1.gotoAndStop(1);
         naikTurun[1] = "Tăng +" + String(diamondKota[pilihKota] - zawalDiamond);
      }
      else if(diamondKota[pilihKota] < zawalDiamond)
      {
         map.list_mc.arrow1.gotoAndStop(2);
         naikTurun[1] = "Giảm -" + String(zawalDiamond - diamondKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow1.gotoAndStop(3);
      }
      if(coalKota[pilihKota] > zawalCoal)
      {
         map.list_mc.arrow2.gotoAndStop(1);
         naikTurun[2] = "Tăng +" + String(coalKota[pilihKota] - zawalCoal);
      }
      else if(coalKota[pilihKota] < zawalCoal)
      {
         map.list_mc.arrow2.gotoAndStop(2);
         naikTurun[2] = "Giảm -" + String(zawalCoal - coalKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow2.gotoAndStop(3);
      }
      if(oilKota[pilihKota] > zawalOil)
      {
         map.list_mc.arrow3.gotoAndStop(1);
         naikTurun[3] = "Tăng +" + String(oilKota[pilihKota] - zawalOil);
      }
      else if(oilKota[pilihKota] < zawalOil)
      {
         map.list_mc.arrow3.gotoAndStop(2);
         naikTurun[3] = "Giảm -" + String(zawalOil - oilKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow3.gotoAndStop(3);
      }
      if(horseKota[pilihKota] > zawalHorse)
      {
         map.list_mc.arrow4.gotoAndStop(1);
         naikTurun[4] = "Tăng +" + String(horseKota[pilihKota] - zawalHorse);
      }
      else if(horseKota[pilihKota] < zawalHorse)
      {
         map.list_mc.arrow4.gotoAndStop(2);
         naikTurun[4] = "Giảm -" + String(zawalHorse - horseKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow4.gotoAndStop(3);
      }
      if(spearKota[pilihKota] > zawalSpear)
      {
         map.list_mc.arrow5.gotoAndStop(1);
         naikTurun[5] = "Tăng +" + String(spearKota[pilihKota] - zawalSpear);
      }
      else if(spearKota[pilihKota] < zawalSpear)
      {
         map.list_mc.arrow5.gotoAndStop(2);
         naikTurun[5] = "Giảm -" + String(zawalSpear - spearKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow5.gotoAndStop(3);
      }
      if(catapultKota[pilihKota] > zawalCatapult)
      {
         map.list_mc.arrow6.gotoAndStop(1);
         naikTurun[6] = "Tăng +" + String(catapultKota[pilihKota] - zawalCatapult);
      }
      else if(catapultKota[pilihKota] < zawalCatapult)
      {
         map.list_mc.arrow6.gotoAndStop(2);
         naikTurun[6] = "Giảm -" + String(zawalCatapult - catapultKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow6.gotoAndStop(3);
      }
      if(witchKota[pilihKota] > zawalWitch)
      {
         map.list_mc.arrow7.gotoAndStop(1);
         naikTurun[7] = "Tăng +" + String(witchKota[pilihKota] - zawalWitch);
      }
      else if(witchKota[pilihKota] < zawalWitch)
      {
         map.list_mc.arrow7.gotoAndStop(2);
         naikTurun[7] = "Giảm -" + String(zawalWitch - witchKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow7.gotoAndStop(3);
      }
      if(elephantKota[pilihKota] > zawalElephant)
      {
         map.list_mc.arrow8.gotoAndStop(1);
         naikTurun[8] = "Tăng +" + String(elephantKota[pilihKota] - zawalElephant);
      }
      else if(elephantKota[pilihKota] < zawalElephant)
      {
         map.list_mc.arrow8.gotoAndStop(2);
         naikTurun[8] = "Giảm -" + String(zawalElephant - elephantKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow8.gotoAndStop(3);
      }
   }
   else if(map.list_mc._currentframe == 3)
   {
      if(fireKota[pilihKota] > zawalFire)
      {
         map.list_mc.arrow1.gotoAndStop(1);
         naikTurun[1] = "Tăng +" + String(fireKota[pilihKota] - zawalFire);
      }
      else if(fireKota[pilihKota] < zawalFire)
      {
         map.list_mc.arrow1.gotoAndStop(2);
         naikTurun[1] = "Giảm -" + String(zawalFire - fireKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow1.gotoAndStop(3);
      }
      if(steelKota[pilihKota] > zawalSteel)
      {
         map.list_mc.arrow2.gotoAndStop(1);
         naikTurun[2] = "Tăng +" + String(steelKota[pilihKota] - zawalSteel);
      }
      else if(steelKota[pilihKota] < zawalSteel)
      {
         map.list_mc.arrow2.gotoAndStop(2);
         naikTurun[2] = "Giảm -" + String(zawalSteel - steelKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow2.gotoAndStop(3);
      }
      if(xsuperKota[pilihKota] > zawalSuper)
      {
         map.list_mc.arrow3.gotoAndStop(1);
         naikTurun[3] = "Tăng +" + String(xsuperKota[pilihKota] - zawalSuper);
      }
      else if(xsuperKota[pilihKota] < zawalSuper)
      {
         map.list_mc.arrow3.gotoAndStop(2);
         naikTurun[3] = "Giảm -" + String(zawalSuper - xsuperKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow3.gotoAndStop(3);
      }
      if(iceballKota[pilihKota] > zawalIceball)
      {
         map.list_mc.arrow4.gotoAndStop(1);
         naikTurun[4] = "Tăng +" + String(iceballKota[pilihKota] - zawalIceball);
      }
      else if(iceballKota[pilihKota] < zawalIceball)
      {
         map.list_mc.arrow4.gotoAndStop(2);
         naikTurun[4] = "Giảm -" + String(zawalIceball - iceballKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow4.gotoAndStop(3);
      }
      if(fireballKota[pilihKota] > zawalFireball)
      {
         map.list_mc.arrow5.gotoAndStop(1);
         naikTurun[5] = "Tăng +" + String(fireballKota[pilihKota] - zawalFireball);
      }
      else if(fireballKota[pilihKota] < zawalFireball)
      {
         map.list_mc.arrow5.gotoAndStop(2);
         naikTurun[5] = "Giảm -" + String(zawalFireball - fireballKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow5.gotoAndStop(3);
      }
      if(poisonKota[pilihKota] > zawalPoison)
      {
         map.list_mc.arrow6.gotoAndStop(1);
         naikTurun[6] = "Tăng +" + String(poisonKota[pilihKota] - zawalPoison);
      }
      else if(poisonKota[pilihKota] < zawalPoison)
      {
         map.list_mc.arrow6.gotoAndStop(2);
         naikTurun[6] = "Giảm -" + String(zawalPoison - poisonKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow6.gotoAndStop(3);
      }
      if(hurricaneKota[pilihKota] > zawalHurricane)
      {
         map.list_mc.arrow7.gotoAndStop(1);
         naikTurun[7] = "Tăng +" + String(hurricaneKota[pilihKota] - zawalHurricane);
      }
      else if(hurricaneKota[pilihKota] < zawalHurricane)
      {
         map.list_mc.arrow7.gotoAndStop(2);
         naikTurun[7] = "Giảm -" + String(zawalHurricane - hurricaneKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow7.gotoAndStop(3);
      }
      if(earthquakeKota[pilihKota] > zawalEarthquake)
      {
         map.list_mc.arrow8.gotoAndStop(1);
         naikTurun[8] = "Tăng +" + String(earthquakeKota[pilihKota] - zawalEarthquake);
      }
      else if(earthquakeKota[pilihKota] < zawalEarthquake)
      {
         map.list_mc.arrow8.gotoAndStop(2);
         naikTurun[8] = "Giảm -" + String(zawalEarthquake - earthquakeKota[pilihKota]);
      }
      else
      {
         map.list_mc.arrow8.gotoAndStop(3);
      }
   }
}
function cekPilihKota(indi)
{
   if(indi == 1)
   {
      xpilihMap = 1;
   }
   else if(indi == 2)
   {
      xpilihMap = 1;
   }
   else if(indi == 3)
   {
      xpilihMap = 1;
   }
   else if(indi == 4)
   {
      xpilihMap = 1;
   }
   else if(indi == 5)
   {
      xpilihMap = 2;
   }
   else if(indi == 6)
   {
      xpilihMap = 3;
   }
   else if(indi == 7)
   {
      xpilihMap = 1;
   }
   else if(indi == 8)
   {
      xpilihMap = 1;
   }
   else if(indi == 9)
   {
      xpilihMap = 2;
   }
   else if(indi == 10)
   {
      xpilihMap = 1;
   }
   else if(indi == 11)
   {
      xpilihMap = 4;
   }
   else if(indi == 12)
   {
      xpilihMap = 4;
   }
}
function initMap()
{
   panjang = 20;
   lebar = 20;
   dalam1 = 9;
   scalaKotak = 100;
   bKotak = 40;
   posAwalX = 250;
   posAwalY = -200;
   dalamPeta = 1000;
   dalamMap = 1100;
   dalamDrag = 10000;
   dalamMsgBox = 10015;
   dalamSemua = 10002;
   dalamInfo = 1050;
   dalamInfo2 = 10004;
   dalamActions = 5000;
   dalamDunia = 10003;
   dalamActions2 = 10006;
   dalamOptions = 10010;
   dalamTutor = 10099;
   pilihKota = xpilihKota;
   cekPilihKota(xpilihKota);
   pilihMap = xpilihMap;
   pilihBangun = 1;
   overMana = 1;
   zjmlMusuh = 0;
   persenMusuh = 0.3;
   randomFood = 3 + random(3);
   randomIron = 3 * (3 + random(3));
   randomLog = 2 * (3 + random(3));
   randomPearl = 7 * (3 + random(3));
   randomCoal = 6 * (3 + random(3));
   randomOil = 5 * (3 + random(3));
   randomSteel = 8 * (3 + random(3));
   sedangDrag = false;
   xpause = false;
   perangMenang = false;
   naikTurun = new Array();
   i = 1;
   while(i <= 8)
   {
      naikTurun[i] = "-";
      i++;
   }
   i = 1;
   while(i <= 4)
   {
      _root["bawaBarang" + i] = 0;
      i++;
   }
}
function buatKotak()
{
   i = 0;
   while(i <= panjang)
   {
      j = 0;
      while(j <= lebar)
      {
         ubahDalam("j","i","dalam");
         namaBaru = "rumput_mc" + dalam;
         rumput = attachMovie("rumput_mc",namaBaru,dalam1);
         posX = i * bKotak;
         posY = j * bKotak;
         rumput._x = posAwalX + (posX - posY);
         rumput._y = posAwalY + (posX + posY) / 2;
         rumput._xscale = scalaKotak;
         rumput._yscale = scalaKotak;
         dalam1++;
         j++;
      }
      i++;
   }
}
function buatPeta()
{
   stopDrag();
   removeMovieClip(object);
   sedangDrag = false;
   peta = attachMovie("area" + String(pilihKota) + String(pilihMap),"xpeta_mc",dalamPeta);
   i = 1;
   while(i <= bykKota)
   {
      j = 1;
      while(j <= bykArea)
      {
         k = 1;
         while(k <= bykProperti)
         {
            if(peta["sungai" + k] != undefined)
            {
               peta["sungai" + k]._visible = false;
               bisaSungai[i][j][k] = 1;
            }
            else
            {
               bisaSungai[i][j][k] = 0;
            }
            if(peta["hutan" + k] != undefined)
            {
               peta["hutan" + k]._visible = false;
               bisaHutan[i][j][k] = 1;
            }
            else
            {
               bisaHutan[i][j][k] = 0;
            }
            if(peta["gunung" + k] != undefined)
            {
               peta["gunung" + k]._visible = false;
               bisaGunung[i][j][k] = 1;
            }
            else
            {
               bisaGunung[i][j][k] = 0;
            }
            k++;
         }
         j++;
      }
      i++;
   }
   peta._x = 0;
   peta._y = 0;
   cekArea(peta,bykArea);
   cekAnim();
}
function cekAnim(indi)
{
   if(pilihKota == 9 && pilihMap == 2)
   {
      i = 1;
      while(i <= 4)
      {
         i++;
      }
   }
   i = 1;
   while(i <= 4)
   {
      peta["anim" + i].gotoAndStop(1);
      peta["anim" + i]._visible = false;
      i++;
   }
   cekKapal();
}
function cekKapal()
{
   j = 1;
   while(j <= bykArea)
   {
      i = 1;
      while(i <= bykBangunan)
      {
         if(jenisBangunan[pilihKota][j][i] == 10)
         {
            if(map["map" + j].xpeta_mc["kapal" + i]._currentframe == 1)
            {
               map["map" + j].xpeta_mc["kapal" + i]._visible = true;
               map["map" + j].xpeta_mc["kapal" + i].gotoAndStop(2);
            }
         }
         else
         {
            map["map" + j].xpeta_mc["kapal" + i]._visible = false;
            map["map" + j].xpeta_mc["kapal" + i].gotoAndStop(1);
         }
         i++;
      }
      j++;
   }
   i = 1;
   while(i <= bykBangunan)
   {
      if(jenisBangunan[pilihKota][pilihMap][i] == 10)
      {
         if(peta["kapal" + i]._currentframe == 1)
         {
            peta["kapal" + i]._visible = true;
            peta["kapal" + i].gotoAndStop(map["map" + pilihMap].xpeta_mc["kapal" + i]._currentframe);
         }
      }
      else
      {
         peta["kapal" + i]._visible = false;
         peta["kapal" + i].gotoAndStop(1);
      }
      i++;
   }
}
function buatMsgBox()
{
   msgBox = attachMovie("msgBox_mc","msgBox_mc",dalamMsgBox);
   msgBox._x = 0;
   msgBox._y = 0;
   msgBox._xscale = msgBox._yscale = 80;
   msgBox._alpha = -100;
   sentuhMsgBox = false;
   msgBox.onEnterFrame = enterMsgBox;
}
function enterMsgBox()
{
   this.gotoAndStop(overMana);
   if(sentuhMsgBox == true)
   {
      if(jenisSentuh == "button")
      {
         if(overMana == 4)
         {
            if(map.list_mc._currentframe == 1)
            {
               this.judul = judulButton2[pilihButton];
            }
            else if(map.list_mc._currentframe == 2)
            {
               this.judul = judulButton2[pilihButton + 8];
            }
            else if(map.list_mc._currentframe == 3)
            {
               this.judul = judulButton2[pilihButton + 16];
            }
         }
         else if(overMana == 5)
         {
            this.judul = judulButton2[pilihButton];
         }
         else
         {
            this.judul = judulButton[pilihButton];
         }
         if(overMana == 1)
         {
            if(tingkatSulit == 3 || tingkatSulit == 4)
            {
               this.isi = isiButton[pilihButton];
            }
            else if(tingkatSulit == 1 || tingkatSulit == 2)
            {
               this.isi = xisiButton[pilihButton];
            }
         }
         else if(overMana == 2)
         {
            if(tingkatSulit == 3 || tingkatSulit == 4)
            {
               this.isi = isiButton2[pilihButton];
            }
            else if(tingkatSulit == 1 || tingkatSulit == 2)
            {
               this.isi = xisiButton2[pilihButton];
            }
         }
         else if(overMana == 3)
         {
            if(lihatMana == 1)
            {
               if(pilihButton != 0)
               {
                  if(tingkatSulit == 3 || tingkatSulit == 4)
                  {
                     this.isi = isiButton[pilihButton] + "\n\nNhấn vào đây để nâng cấp hoặc bán công trình";
                  }
                  else if(tingkatSulit == 1 || tingkatSulit == 2)
                  {
                     this.isi = xisiButton[pilihButton] + "\n\nNhấn vào đây để nâng cấp hoặc bán công trình";
                  }
               }
               else if(tingkatSulit == 3 || tingkatSulit == 4)
               {
                  this.isi = isiButton[pilihButton];
               }
               else if(tingkatSulit == 1 || tingkatSulit == 2)
               {
                  this.isi = xisiButton[pilihButton];
               }
            }
            else if(pilihButton != 0)
            {
               if(tingkatSulit == 3 || tingkatSulit == 4)
               {
                  this.isi = isiButton2[pilihButton] + "\n\nPress here for upgrade or sell the building";
               }
               else if(tingkatSulit == 1 || tingkatSulit == 2)
               {
                  this.isi = xisiButton2[pilihButton] + "\n\nPress here for upgrade or sell the building";
               }
            }
            else if(tingkatSulit == 3 || tingkatSulit == 4)
            {
               this.isi = isiButton2[pilihButton];
            }
            else if(tingkatSulit == 1 || tingkatSulit == 2)
            {
               this.isi = xisiButton2[pilihButton];
            }
         }
         else if(overMana == 4)
         {
            this.isi = naikTurun[pilihButton];
         }
         else if(overMana == 5)
         {
            this.isi = "";
         }
         this.xmoney = kebutuhanMoney[pilihButton];
         this.xfood = kebutuhanFood[pilihButton];
         this.xiron = kebutuhanIron[pilihButton];
         this.xwood = kebutuhanWood[pilihButton];
         this.xworker = kebutuhanWorker[pilihButton];
         if(this.xmoney <= 0)
         {
            this.xmoney = 0;
         }
         if(this.xfood <= 0)
         {
            this.xfood = 0;
         }
         if(this.xiron <= 0)
         {
            this.xiron = 0;
         }
         if(this.xwood <= 0)
         {
            this.xwood = 0;
         }
         if(this.xworker <= 0)
         {
            this.xworker = 0;
         }
      }
      else if(jenisSentuh == "peta")
      {
         if(overMana == 6)
         {
            var _gVal = _root.gdpKota[pilihButton];
            if(_gVal == undefined) _gVal = 0;
            var _gSign = (_gVal >= 0 ? "+$" : "-$") + Math.abs(_gVal);
            this.judul = namaKota[pilihButton] + " [Trade GDP: " + _gSign + "]";
            this.isi = "Xuất khẩu hàng ngày: $" + _root.exportGdpKota[pilihButton] + " | Nhập khẩu: $" + _root.importGdpKota[pilihButton] + "\n(Nhấp chuột để di chuyển tới | Nhấn nút [Vận tải] hoặc phím 'L')";
            this.jml1 = Number(_root.soldierKota[pilihButton]);
            this.jml2 = Number(_root.horseKota[pilihButton]);
            this.jml3 = Number(_root.catapultKota[pilihButton]);
            this.jml4 = Number(_root.witchKota[pilihButton]);
            this.jml5 = Number(_root.elephantKota[pilihButton]);
            this.jml6 = Number(_root.xsuperKota[pilihButton]);
         }
         else if(overMana == 7)
         {
            this.judul = namaKota[pilihButton];
         }
      }
      this._x = _root._xmouse;
      this._y = _root._ymouse;
      if(this._alpha < 125)
      {
         this._alpha += 50;
      }
   }
   else if(sentuhMsgBox == false)
   {
      if(this._alpha > -25)
      {
         this._alpha -= 50;
      }
      else
      {
         this._y = -1000;
      }
   }
   if(this._x <= 300)
   {
      this.gotoAndStop(this._currentframe + 10);
   }
   else
   {
      this.gotoAndStop(this._currentframe - 10);
   }
}
function buatInfo()
{
   info = attachMovie("info_mc","info_mc",dalamInfo);
   info._x = 0;
   info._y = 80;
   info._alpha = 0;
   sentuhInfo = false;
   info._xinfo = "";
   info.onEnterFrame = enterInfo;
}
function buatInfo2()
{
   info2 = attachMovie("info_mc","info_mc2",dalamInfo2);
   info2._x = 0;
   info2._y = 0;
   info2._alpha = 0;
   sentuhInfo2 = false;
   info2._xinfo = "";
   info2.onEnterFrame = enterInfo2;
}
function enterInfo()
{
   if(sentuhInfo == true)
   {
      this.go_btn._visible = true;
      this.close_btn._visible = true;
      if(this._alpha < lamaDelay)
      {
         this._alpha += 20;
      }
      else
      {
         sentuhInfo = false;
      }
   }
   else if(sentuhInfo == false)
   {
      if(this._alpha > -100)
      {
         this._alpha -= 20;
      }
      else
      {
         this.go_btn._visible = false;
         this.close_btn._visible = false;
      }
   }
}
function cekInfo(wdelay, winfo, wkemana, wkota)
{
   if(info._alpha <= -50)
   {
      sentuhInfo = true;
      info._alpha = 0;
      lamaDelay = wdelay;
      if(wkemana == undefined)
      {
         wkemana = 1;
         info.gotoAndStop(wkemana);
         info.close_btn.onRelease = function()
         {
            close_btn._visible = false;
            info._alpha = -50;
            sentuhInfo = false;
         };
      }
      else if(wkemana == 2)
      {
         info.gotoAndStop(wkemana);
         info.go_btn.onRelease = function()
         {
            pilihKota = wkota;
            xpilihKota = wkota;
            clearSemua();
            initSemua();
            xi = pilihKota;
            map.list_mc.gotoAndStop(1);
            map.list_mc.money = "$" + moneyKota[xi];
            map.list_mc.food = foodKota[xi];
            map.list_mc.iron = ironKota[xi];
            map.list_mc.wood = woodKota[xi];
            map.list_mc.sword = swordKota[xi];
            map.list_mc.xarrow = xarrowKota[xi];
            map.list_mc.soldier = soldierKota[xi];
            map.list_mc.worker = workerKota[xi];
            map.day = "NGÀY \n" + day;
         };
         info.close_btn.onRelease = function()
         {
            go_btn._visible = false;
            close_btn._visible = false;
            info._alpha = -50;
            sentuhInfo = false;
         };
      }
      info.xinfo = winfo;
   }
}
function enterInfo2()
{
   if(sentuhInfo2 == true)
   {
      this.go_btn._visible = true;
      this.close_btn._visible = true;
      if(this._alpha < lamaDelay2)
      {
         this._alpha += 20;
      }
      else
      {
         sentuhInfo2 = false;
      }
   }
   else if(sentuhInfo2 == false)
   {
      if(this._alpha > -100)
      {
         this.go_btn._visible = false;
         this.close_btn._visible = false;
         this._alpha -= 20;
      }
   }
}
function cekInfo2(wdelay2, winfo2, wkemana, wkota)
{
   sentuhInfo2 = true;
   info2._alpha = 0;
   lamaDelay2 = wdelay2;
   info2.xinfo = winfo2;
   if(wkemana == undefined)
   {
      wkemana = 1;
      info2.gotoAndStop(wkemana);
      info2.close_btn.onRelease = function()
      {
         info2._alpha = -50;
         sentuhInfo2 = false;
      };
   }
   else if(wkemana == 2)
   {
      info2.gotoAndStop(wkemana);
      info2.go_btn.onRelease = function()
      {
         pilihKota = wkota;
         xpilihKota = wkota;
         clearSemua();
         initSemua();
         xi = pilihKota;
         map.list_mc.gotoAndStop(1);
         map.list_mc.money = "$" + moneyKota[xi];
         map.list_mc.food = foodKota[xi];
         map.list_mc.iron = ironKota[xi];
         map.list_mc.wood = woodKota[xi];
         map.list_mc.sword = swordKota[xi];
         map.list_mc.xarrow = xarrowKota[xi];
         map.list_mc.soldier = soldierKota[xi];
         map.list_mc.worker = workerKota[xi];
         map.day = "NGÀY \n" + day;
      };
   }
}
function buatMap()
{
   map = attachMovie("map" + String(pilihKota),"map_mc",dalamMap);
   map._x = 0;
   map._y = 0;
   var _curG = _root.gdpKota[pilihKota];
   if(_curG == undefined) _curG = 0;
   var _curGStr = (_curG >= 0 ? "+$" : "-$") + Math.abs(_curG);
   map.city = namaKota[pilihKota] + " [GDP: " + _curGStr + "]";
   i = 1;
   while(i <= bykArea)
   {
      map["map" + i].onRollOver = function()
      {
         this._alpha = 50;
      };
      map["map" + i].onRollOut = function()
      {
         this._alpha = 100;
      };
      map["map" + i].onReleaseOutside = function()
      {
         this._alpha = 100;
      };
      map["map" + i].onRelease = function()
      {
         myStr = new String(this);
         mindi = Number(myStr.substr(myStr.length - 1,1));
         pilihMap = mindi;
         buatPeta();
      };
      i++;
   }
   i = 1;
   while(i <= 8)
   {
      map.list_mc["arrow" + i].gotoAndStop(3);
      i++;
   }
   map.list_mc.kiri_mc.onRelease = function()
   {
      i = 1;
      while(i <= 8)
      {
         naikTurun[i] = "-";
         i++;
      }
      if(map.list_mc._currentframe == 2)
      {
         map.list_mc.gotoAndStop(1);
         xcekInfo();
      }
      else if(map.list_mc._currentframe == 3)
      {
         map.list_mc.gotoAndStop(2);
         xcekInfo();
      }
      i = 1;
      while(i <= 8)
      {
         map.list_mc["arrow" + i].gotoAndStop(3);
         i++;
      }
   };
   map.list_mc.kanan_mc.onRelease = function()
   {
      i = 1;
      while(i <= 8)
      {
         naikTurun[i] = "-";
         i++;
      }
      if(map.list_mc._currentframe == 1)
      {
         map.list_mc.gotoAndStop(2);
         xcekInfo();
      }
      else if(map.list_mc._currentframe == 2)
      {
         map.list_mc.gotoAndStop(3);
         xcekInfo();
      }
      i = 1;
      while(i <= 8)
      {
         map.list_mc["arrow" + i].gotoAndStop(3);
         i++;
      }
   };
   i = 1;
   while(i <= bykBangunan)
   {
      map["button" + i].onPress = klikButton;
      map["button" + i].onRollOver = overButton;
      map["button" + i].onRollOut = outButton;
      map["stat" + i].onRollOver = overStat;
      map["stat" + i].onRollOut = outStat;
      i++;
   }
   map.map_btn.onRelease = klikMap;
   map.actions_btn.onRelease = klikActions;
   map.options_btn.onRelease = klikOptions;
   
   // Nút logistics duoc tich hop truc tiep vao ban do Map theo yeu cau UI
   
   dalam1++;
   cekArea2();
}
function klikOptions()
{
   stopDrag();
   removeMovieClip(object);
   sedangDrag = false;
   clearInterval(dayDelay);
   options = attachMovie("options_mc","options_mc",dalamOptions);
   options._x = 340;
   options._y = 240;
   xpause = true;
   bisaTombol(false);
   bisaTombol2(false);
   options.save_btn.onRelease = function()
   {
      clearSemua();
      xjenisData = "save";
      posMain = "main";
      gotoAndStop("load");
   };
   options.load_btn.onRelease = function()
   {
      clearSemua();
      xjenisData = "load";
      posMain = "main";
      gotoAndStop("load");
   };
   options.quit_btn.onRelease = function()
   {
      clearSemua();
      gotoAndStop(38);
   };
   options.back_btn.onRelease = function()
   {
      removeMovieClip(options);
      bisaTombol(true);
      bisaTombol2(true);
      xpause = false;
      clearInterval(dayDelay);
      dayDelay = setInterval(dayItung,delayHari);
   };
   options.more_btn.onRelease = function()
   {
      getUrl("http://www.maxgames.com", "_blank");
   };
}
function overStat()
{
   if(sedangDrag == false)
   {
      overMana = 4;
      myStr = new String(this);
      windi = Number(myStr.substr(myStr.length - 1,1));
      pilihButton = windi;
      jenisSentuh = "button";
      sentuhMsgBox = true;
   }
   else
   {
      sentuhMsgBox = false;
   }
}
function outStat()
{
   sentuhMsgBox = false;
}
function overStat2()
{
   if(sedangDrag == false)
   {
      overMana = 5;
      myStr = new String(this);
      if(myStr.length == 24)
      {
         windi = Number(myStr.substr(myStr.length - 1,1));
      }
      else if(myStr.length == 25)
      {
         windi = Number(myStr.substr(myStr.length - 2,2));
      }
      pilihButton = windi;
      jenisSentuh = "button";
      sentuhMsgBox = true;
   }
   else
   {
      sentuhMsgBox = false;
   }
}
function outStat2()
{
   sentuhMsgBox = false;
}

// ================= INTERACTIVE LOGISTICS MANAGER UI (2 TABS: GOODS & WORKERS) =================
_root.openLogisticsManager = function()
{
   if(_root.logisticsPanel != undefined)
   {
      _root.logisticsPanel.removeMovieClip();
      _root.logisticsPanel = undefined;
      return;
   }
   
   var p = _root.createEmptyMovieClip("logisticsPanel", 19999);
   _root.logisticsPanel = p;
   p._x = 40;
   p._y = 25;
   
   p.drawBox = function(mc, x, y, w, h, bgCol, bgAlpha, borderCol, borderThick) {
      mc.lineStyle(borderThick, borderCol, 100);
      mc.beginFill(bgCol, bgAlpha);
      mc.moveTo(x, y);
      mc.lineTo(x + w, y);
      mc.lineTo(x + w, y + h);
      mc.lineTo(x, y + h);
      mc.lineTo(x, y);
      mc.endFill();
   };
   
   p.createBtn = function(name, depth, x, y, w, h, label, bgCol, borderCol, onClick) {
      var btn = p.createEmptyMovieClip(name, depth);
      p.drawBox(btn, x, y, w, h, bgCol, 100, borderCol, 1);
      btn.createTextField("lbl", 1, x, y + 2, w, h - 2);
      var tf = btn.lbl;
      tf.selectable = false;
      var fmt = new TextFormat();
      fmt.font = "Arial";
      fmt.size = 11;
      fmt.bold = true;
      fmt.align = "center";
      fmt.color = 0xFFFFFF;
      tf.setNewTextFormat(fmt);
      tf.text = label;
      btn.onRelease = onClick;
      return btn;
   };
   
   _root.renderLogisticsUI = function() {
      p.clear();
      var cDepth = 100;
      
      // Panel Background (width 600, height 430)
      p.drawBox(p, 0, 0, 600, 430, 0x141824, 96, 0x3E5C8D, 2);
      
      // Header Title
      p.createTextField("title_tf", 1, 15, 10, 530, 24);
      var tFmt = new TextFormat();
      tFmt.font = "Arial";
      tFmt.size = 14;
      tFmt.bold = true;
      tFmt.color = 0xFFAA22;
      p.title_tf.setNewTextFormat(tFmt);
      p.title_tf.text = "MẠNG LƯỚI VẬN TẢI & ĐIỀU ĐỘNG DÂN SỐ";
      
      // Close Button [X]
      p.createBtn("btn_close", 2, 560, 8, 28, 24, "X", 0x882222, 0xFF4444, function() {
         _root.openLogisticsManager();
      });
      
      // Origin City banner
      var curC = _root.pilihKota;
      p.createTextField("city_info", 3, 15, 34, 350, 22);
      var cFmt = new TextFormat();
      cFmt.font = "Arial";
      cFmt.size = 12;
      cFmt.bold = true;
      cFmt.color = 0x88DDFF;
      p.city_info.setNewTextFormat(cFmt);
      p.city_info.text = "Thành phố xuất phát: " + _root.namaKota[curC] + " (Dân tự do: " + _root.workerKota[curC] + ")";
      
      // Navigation buttons to cycle origin city
      p.createBtn("btn_prev_city", 4, 380, 32, 95, 22, "< Thành trước", 0x223355, 0x5588CC, function() {
         var prevC = _root.pilihKota - 1;
         if(prevC < 1) prevC = 12;
         while(_root.punyaWilayah[prevC] != _root.jenisKerajaan && prevC != _root.pilihKota) {
            prevC--;
            if(prevC < 1) prevC = 12;
         }
         _root.pilihKota = prevC;
         _root.xpilihKota = prevC;
         _root.renderLogisticsUI();
      });
      p.createBtn("btn_next_city", 5, 485, 32, 95, 22, "Thành sau >", 0x223355, 0x5588CC, function() {
         var nextC = _root.pilihKota + 1;
         if(nextC > 12) nextC = 1;
         while(_root.punyaWilayah[nextC] != _root.jenisKerajaan && nextC != _root.pilihKota) {
            nextC++;
            if(nextC > 12) nextC = 1;
         }
         _root.pilihKota = nextC;
         _root.xpilihKota = nextC;
         _root.renderLogisticsUI();
      });
      
      // ================= TAB BUTTONS =================
      var isTab1 = (_root.logisticsTab != 2);
      var tab1Bg = isTab1 ? 0x2A4E7A : 0x182333;
      var tab1Border = isTab1 ? 0x66AAFF : 0x334455;
      var tab2Bg = !isTab1 ? 0x2A4E7A : 0x182333;
      var tab2Border = !isTab1 ? 0x66AAFF : 0x334455;
      
      p.createBtn("tab_goods", 6, 15, 60, 280, 26, "[1] VẬN TẢI HÀNG HÓA (1 Mặt hàng/Vùng)", tab1Bg, tab1Border, function() {
         _root.logisticsTab = 1;
         _root.renderLogisticsUI();
      });
      p.createBtn("tab_workers", 7, 305, 60, 280, 26, "[2] DI DÂN / ĐIỀU ĐỘNG LAO ĐỘNG", tab2Bg, tab2Border, function() {
         _root.logisticsTab = 2;
         _root.renderLogisticsUI();
      });
      
      // Divider line
      p.lineStyle(1, 0x334466, 100);
      p.moveTo(15, 92); p.lineTo(585, 92);
      
      var sFmt = new TextFormat();
      sFmt.font = "Arial";
      sFmt.size = 11;
      sFmt.bold = true;
      sFmt.color = 0xCCCCCC;
      
      // =====================================================================
      // TAB 1: COMMODITY LOGISTICS
      // =====================================================================
      if(isTab1)
      {
         p.createTextField("sec1_tf", 8, 15, 96, 570, 20);
         p.sec1_tf.setNewTextFormat(sFmt);
         p.sec1_tf.text = "MẶT HÀNG XUẤT CUNG ỨNG (Tối đa 1 mặt hàng mỗi vùng):";
         
         var resNames = new Array("Không", "Lương thực", "Sắt", "Gỗ", "Ngọc trai", "Than đá", "Dầu", "Thép", "Tiền vàng");
         var curRes = _root.logisticsResType[curC];
         if(curRes == undefined) curRes = 0;
         
         var ri = 0;
         while(ri <= 8) {
            var rx = 15 + ri * 63;
            var ry = 116;
            var isSel = (curRes == ri);
            var bBg = isSel ? 0x2E6B34 : 0x1F2A3D;
            var bBorder = isSel ? 0x55FF66 : 0x445A7A;
            p.createBtn("btn_res_" + ri, 10 + ri, rx, ry, 59, 24, resNames[ri], bBg, bBorder, function() {
               var rId = Number(this._name.substr(8));
               _root.logisticsResType[_root.pilihKota] = rId;
               _root.renderLogisticsUI();
            });
            ri++;
         }
         
         p.lineStyle(1, 0x334466, 100);
         p.moveTo(15, 146); p.lineTo(585, 146);
         
         p.createTextField("sec2_tf", 20, 15, 150, 570, 20);
         p.sec2_tf.setNewTextFormat(sFmt);
         p.sec2_tf.text = "CÁC VÙNG ĐÍCH TIẾP NHẬN (Tự động vận chuyển mỗi ngày):";
         
         var rowY = 172;
         var dIdx = 1;
         var hasTargets = false;
         var totalDailySending = 0;
         
         while(dIdx <= 12) {
            if(dIdx != curC && _root.punyaWilayah[dIdx] == _root.jenisKerajaan) {
               hasTargets = true;
               var sendAmt = Number(_root.logisticsAmount[curC][dIdx]);
               if(isNaN(sendAmt) || sendAmt == undefined) sendAmt = 0;
               totalDailySending += sendAmt;
               
               p.createTextField("dst_lbl_" + dIdx, cDepth++, 20, rowY + 2, 160, 20);
               var dFmt = new TextFormat();
               dFmt.font = "Arial";
               dFmt.size = 11;
               dFmt.color = 0xFFFFFF;
               p["dst_lbl_" + dIdx].setNewTextFormat(dFmt);
               p["dst_lbl_" + dIdx].text = dIdx + ". " + _root.namaKota[dIdx];
               
               p.createTextField("amt_lbl_" + dIdx, cDepth++, 185, rowY + 2, 110, 20);
               var aFmt = new TextFormat();
               aFmt.font = "Arial";
               aFmt.size = 11;
               aFmt.bold = true;
               aFmt.color = (sendAmt > 0 ? 0xFFEE44 : 0x888888);
               p["amt_lbl_" + dIdx].setNewTextFormat(aFmt);
               p["amt_lbl_" + dIdx].text = sendAmt + " /ngày";
               
               p.createBtn("btn_p10_" + dIdx, cDepth++, 305, rowY, 48, 20, "+10", 0x24334A, 0x486B98, function() {
                  var tId = Number(this._name.substr(8));
                  if(_root.logisticsAmount[_root.pilihKota][tId] == undefined) _root.logisticsAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsAmount[_root.pilihKota][tId] += 10;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_p50_" + dIdx, cDepth++, 360, rowY, 48, 20, "+50", 0x24334A, 0x486B98, function() {
                  var tId = Number(this._name.substr(8));
                  if(_root.logisticsAmount[_root.pilihKota][tId] == undefined) _root.logisticsAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsAmount[_root.pilihKota][tId] += 50;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_p200_" + dIdx, cDepth++, 415, rowY, 55, 20, "+200", 0x24334A, 0x486B98, function() {
                  var tId = Number(this._name.substr(9));
                  if(_root.logisticsAmount[_root.pilihKota][tId] == undefined) _root.logisticsAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsAmount[_root.pilihKota][tId] += 200;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_clr_" + dIdx, cDepth++, 480, rowY, 55, 20, "Xóa", 0x4A2424, 0x984848, function() {
                  var tId = Number(this._name.substr(8));
                  _root.logisticsAmount[_root.pilihKota][tId] = 0;
                  _root.renderLogisticsUI();
               });
               
               rowY += 23;
               if(rowY > 350) break;
            }
            dIdx++;
         }
         
         if(!hasTargets) {
            p.createTextField("no_target_tf", cDepth++, 25, 180, 500, 30);
            var ntFmt = new TextFormat();
            ntFmt.font = "Arial";
            ntFmt.size = 12;
            ntFmt.color = 0xAAAAAA;
            p.no_target_tf.setNewTextFormat(ntFmt);
            p.no_target_tf.text = "Bạn chưa có thành phố trực thuộc nào khác. Hãy mở rộng lãnh thổ để thiết lập tuyến thương mại!";
         }
         
         p.lineStyle(1, 0x334466, 100);
         p.moveTo(15, 368); p.lineTo(585, 368);
         
         var curGdpVal = _root.gdpKota[curC];
         if(curGdpVal == undefined) curGdpVal = 0;
         var curExp = _root.exportGdpKota[curC];
         if(curExp == undefined) curExp = 0;
         var curImp = _root.importGdpKota[curC];
         if(curImp == undefined) curImp = 0;
         
         p.createTextField("summary_tf", cDepth++, 20, 374, 450, 42);
         var sumFmt = new TextFormat();
         sumFmt.font = "Arial";
         sumFmt.size = 11;
         sumFmt.color = 0xDDDDDD;
         p.summary_tf.setNewTextFormat(sumFmt);
         p.summary_tf.text = "THƯƠNG MẠI MỖI NGÀY: Chuyển " + totalDailySending + " " + resNames[curRes] + "/ngày | Xuất: $" + curExp + " | Nhập: $" + curImp + "\nTHẶNG DƯ GDP THƯƠNG MẠI: " + (curGdpVal >= 0 ? "+$" : "-$") + Math.abs(curGdpVal) + " /ngày";
      }
      // =====================================================================
      // TAB 2: WORKER / POPULATION MIGRATION
      // =====================================================================
      else
      {
         p.createTextField("wsec_tf", 8, 15, 96, 570, 20);
         p.wsec_tf.setNewTextFormat(sFmt);
         p.wsec_tf.text = "ĐIỀU ĐỘNG DÂN CƯ (Không giới hạn tài nguyên - chi viện cho tiền tuyến và vùng ít đất):";
         
         var rowY = 122;
         var dIdx = 1;
         var hasTargets = false;
         var totalWorkersMoving = 0;
         
         while(dIdx <= 12) {
            if(dIdx != curC && _root.punyaWilayah[dIdx] == _root.jenisKerajaan) {
               hasTargets = true;
               var wAmt = Number(_root.logisticsWorkerAmount[curC][dIdx]);
               if(isNaN(wAmt) || wAmt == undefined) wAmt = 0;
               totalWorkersMoving += wAmt;
               
               p.createTextField("wdst_lbl_" + dIdx, cDepth++, 20, rowY + 2, 180, 20);
               var dFmt = new TextFormat();
               dFmt.font = "Arial";
               dFmt.size = 11;
               dFmt.color = 0xFFFFFF;
               p["wdst_lbl_" + dIdx].setNewTextFormat(dFmt);
               p["wdst_lbl_" + dIdx].text = dIdx + ". " + _root.namaKota[dIdx] + " (Dân số: " + _root.workerKota[dIdx] + ")";
               
               p.createTextField("wamt_lbl_" + dIdx, cDepth++, 205, rowY + 2, 100, 20);
               var aFmt = new TextFormat();
               aFmt.font = "Arial";
               aFmt.size = 11;
               aFmt.bold = true;
               aFmt.color = (wAmt > 0 ? 0x55FF99 : 0x888888);
               p["wamt_lbl_" + dIdx].setNewTextFormat(aFmt);
               p["wamt_lbl_" + dIdx].text = wAmt + " người/ngày";
               
               p.createBtn("btn_wp5_" + dIdx, cDepth++, 310, rowY, 40, 20, "+5", 0x1E3B2E, 0x367A5A, function() {
                  var tId = Number(this._name.substr(8));
                  if(_root.logisticsWorkerAmount[_root.pilihKota][tId] == undefined) _root.logisticsWorkerAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsWorkerAmount[_root.pilihKota][tId] += 5;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_wp20_" + dIdx, cDepth++, 355, rowY, 45, 20, "+20", 0x1E3B2E, 0x367A5A, function() {
                  var tId = Number(this._name.substr(9));
                  if(_root.logisticsWorkerAmount[_root.pilihKota][tId] == undefined) _root.logisticsWorkerAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsWorkerAmount[_root.pilihKota][tId] += 20;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_wp50_" + dIdx, cDepth++, 405, rowY, 45, 20, "+50", 0x1E3B2E, 0x367A5A, function() {
                  var tId = Number(this._name.substr(9));
                  if(_root.logisticsWorkerAmount[_root.pilihKota][tId] == undefined) _root.logisticsWorkerAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsWorkerAmount[_root.pilihKota][tId] += 50;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_wp100_" + dIdx, cDepth++, 455, rowY, 50, 20, "+100", 0x1E3B2E, 0x367A5A, function() {
                  var tId = Number(this._name.substr(10));
                  if(_root.logisticsWorkerAmount[_root.pilihKota][tId] == undefined) _root.logisticsWorkerAmount[_root.pilihKota][tId] = 0;
                  _root.logisticsWorkerAmount[_root.pilihKota][tId] += 100;
                  _root.renderLogisticsUI();
               });
               p.createBtn("btn_wclr_" + dIdx, cDepth++, 515, rowY, 50, 20, "Clear", 0x4A2424, 0x984848, function() {
                  var tId = Number(this._name.substr(9));
                  _root.logisticsWorkerAmount[_root.pilihKota][tId] = 0;
                  _root.renderLogisticsUI();
               });
               
               rowY += 23;
               if(rowY > 350) break;
            }
            dIdx++;
         }
         
         if(!hasTargets) {
            p.createTextField("no_target_tf", cDepth++, 25, 180, 500, 30);
            var ntFmt = new TextFormat();
            ntFmt.font = "Arial";
            ntFmt.size = 12;
            ntFmt.color = 0xAAAAAA;
            p.no_target_tf.setNewTextFormat(ntFmt);
            p.no_target_tf.text = "Bạn chưa có thành phố trực thuộc nào khác. Hãy mở rộng lãnh thổ để điều động di dân!";
         }
         
         p.lineStyle(1, 0x334466, 100);
         p.moveTo(15, 368); p.lineTo(585, 368);
         
         p.createTextField("summary_tf", cDepth++, 20, 374, 450, 42);
         var sumFmt = new TextFormat();
         sumFmt.font = "Arial";
         sumFmt.size = 11;
         sumFmt.color = 0xDDDDDD;
         p.summary_tf.setNewTextFormat(sumFmt);
         p.summary_tf.text = "DI DÂN MỖI NGÀY: Điều động " + totalWorkersMoving + " người/ngày từ " + _root.namaKota[curC] + "\nDân di cư đến nơi có thể nhập ngũ thành lính hoặc lao động trong các công trình.";
      }
      
      // Bottom DONE button
      p.createBtn("btn_done", cDepth++, 490, 376, 90, 30, "XONG", 0x1E5B2E, 0x44AA55, function() {
         _root.openLogisticsManager();
      });
   };
   
   _root.renderLogisticsUI();
};

function klikActions()
{
   stopDrag();
   removeMovieClip(object);
   sedangDrag = false;
   tipeWar = "serang";
   xpause = true;
   bisaTombol(false);
   actions = attachMovie("actions_mc","actions_mc",dalamActions);
   actions.gotoAndStop(1);
   actions._x = 340;
   actions._y = 240;
   actions.move_btn.onRelease = klikMove;
   actions.war_btn.onRelease = klikWarMap;
   actions.export_btn.onRelease = klikExport;
   actions.import_btn.onRelease = klikImport;
   actions.close_btn.onRelease = function()
   {
      bisaTombol(true);
      removeMovieClip(actions);
      xpause = false;
   };
}
function kurangWar()
{
   i = 1;
   while(i <= 10)
   {
      if(wsoldier[i] == 1)
      {
         _root.soldierKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wsoldier[i] == 2)
      {
         _root.horseKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wsoldier[i] == 3)
      {
         _root.catapultKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wsoldier[i] == 4)
      {
         _root.witchKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wsoldier[i] == 5)
      {
         _root.elephantKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wsoldier[i] == 6)
      {
         _root.xsuperKota[_root.pilihKota] -= wbatalion[i];
      }
      if(wjenis[i] == 1)
      {
         _root.swordKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 2)
      {
         _root.xarrowKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 3)
      {
         _root.spearKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 4)
      {
         _root.fireKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 5)
      {
         _root.coalKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 6)
      {
         _root.iceballKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 7)
      {
         _root.fireballKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 8)
      {
         _root.poisonKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 9)
      {
         _root.hurricaneKota[_root.pilihKota] -= wbatalion[i];
      }
      else if(wjenis[i] == 10)
      {
         _root.earthquakeKota[_root.pilihKota] -= wbatalion[i];
      }
      i++;
   }
}
function klikNext()
{
   actions.winfo = "";
   bisaPasukan = 1;
   i = 1;
   while(i <= 10)
   {
      if(actions["soldier" + i] < 0)
      {
         bisaPasukan = 2;
      }
      i++;
   }
   if(actions.brought == 0)
   {
      bisaPasukan = 3;
   }
   i = 1;
   while(i <= 10)
   {
      if(actions["weapon" + i] < 0)
      {
         bisaPasukan = 4;
      }
      i++;
   }
   if(bisaPasukan == 1)
   {
      wbatalion = new Array();
      wjenis = new Array();
      wsoldier = new Array();
      i = 1;
      while(i <= 10)
      {
         if(actions["jumlah" + i] <= 0 || isNaN(actions["jumlah" + i]))
         {
            actions["jumlah" + i] = 0;
         }
         wbatalion[i] = actions["jumlah" + i];
         wjenis[i] = actions["tipe" + i]._currentframe;
         wsoldier[i] = actions["bata" + i]._currentframe;
         i++;
      }
      if(tipeWar == "serang")
      {
         actions.gotoAndStop(6);
         actions.winfo = "";
         daftarNama = new Array("","Money","Foods","Irons","Logs");
         i = 1;
         while(i <= 4)
         {
            actions["brought" + i] = 0;
            actions["nama" + i] = daftarNama[i];
            if(daftarNama[i] == "Money")
            {
               actions["owned" + i] = _root.moneyKota[_root.pilihKota];
            }
            else if(daftarNama[i] == "Foods")
            {
               actions["owned" + i] = _root.foodKota[_root.pilihKota];
            }
            else if(daftarNama[i] == "Irons")
            {
               actions["owned" + i] = _root.ironKota[_root.pilihKota];
            }
            else if(daftarNama[i] == "Logs")
            {
               actions["owned" + i] = _root.woodKota[_root.pilihKota];
            }
            actions["max" + i].onRelease = klikMax3;
            actions["setengah" + i].onRelease = klikSetengah3;
            actions["seperempat" + i].onRelease = klikSeperempat3;
            i++;
         }
         actions.war2_btn.onRelease = function()
         {
            bisaWar = true;
            i = 1;
            while(i <= 4)
            {
               if(actions["brought" + i] <= 0 || isNaN(actions["brought" + i]))
               {
                  actions["brought" + i] = 0;
               }
               if(actions["brought" + i] > actions["owned" + i])
               {
                  bisaWar = false;
               }
               i++;
            }
            if(bisaWar == true)
            {
               i = 1;
               while(i <= 4)
               {
                  _root["bawaBarang" + i] = actions["brought" + i];
                  i++;
               }
               i = 1;
               while(i <= 4)
               {
                  if(i == 1)
                  {
                     moneyKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
                  }
                  else if(i == 2)
                  {
                     foodKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
                  }
                  else if(i == 3)
                  {
                     ironKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
                  }
                  else if(i == 4)
                  {
                     woodKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
                  }
                  i++;
               }
               kurangWar();
               clearSemua();
               gotoAndStop(130);
            }
            else
            {
               backSalah();
               actions.winfo = "Không thể mang theo: vượt quá khối lượng chở hàng!";
            }
         };
         actions.back_btn.onRelease = function()
         {
            klikWar();
         };
      }
      else
      {
         i = 1;
         while(i <= 4)
         {
            _root["bawaBarang" + i] = 0;
            i++;
         }
         kurangWar();
         clearSemua();
         gotoAndStop(130);
      }
   }
   else if(bisaPasukan == 2)
   {
      backSalah();
      actions.winfo = "Không thể xuất trận: không có đủ binh lính!";
   }
   else if(bisaPasukan == 3)
   {
      backSalah();
      actions.winfo = "Không thể xuất trận: hãy bố trí quân đội lên chiến trường!";
   }
   else if(bisaPasukan == 4)
   {
      backSalah();
      actions.winfo = "Không thể xuất trận: không có đủ vũ khí!";
   }
}
function klikWarMap()
{
   removeMovieClip(actions);
   klikMap("war");
   dunia.select_mc._visible = true;
   dunia.select_mc.gotoAndStop(1);
   dunia.select_mc.ok_btn.onRelease = function()
   {
      i = 1;
      while(i <= linkWilayah[pilihKota].length)
      {
         if(punyaWilayah[linkWilayah[pilihKota][i]] != jenisKerajaan)
         {
            dunia["daerah" + linkWilayah[pilihKota][i]].gotoAndStop(2);
            dunia["daerah" + linkWilayah[pilihKota][i]].onRollOver = function()
            {
               this.gotoAndStop(5);
            };
            dunia["daerah" + linkWilayah[pilihKota][i]].onRollOut = function()
            {
               this.gotoAndStop(2);
            };
            dunia["daerah" + linkWilayah[pilihKota][i]].onRelease = function()
            {
               myStr = new String(this);
               if(myStr.length == 24)
               {
                  indi = Number(myStr.substr(myStr.length - 1,1));
               }
               else
               {
                  indi = Number(myStr.substr(myStr.length - 2,2));
               }
               kotaDiserang = indi;
               if(punyaWilayah[kotaDiserang] == 0)
               {
                  jenisMenyerang = 1;
               }
               else
               {
                  jenisMenyerang = 2;
               }
               actions = attachMovie("actions_mc","actions_mc",dalamActions);
               actions.gotoAndStop(1);
               actions._x = 340;
               actions._y = 240;
               klikWar();
               removeMovieClip(dunia);
            };
         }
         i++;
      }
      dunia.select_mc._visible = false;
   };
}
function klikWar()
{
   cekJmlMusuh();
   posWeapon = new Array();
   posBata = new Array();
   totalWeapon = 12;
   totalBata = 6;
   if(tipeWar == "serang")
   {
      actions.gotoAndStop(5);
      actions.next_btn.onRelease = klikNext;
   }
   else
   {
      actions.gotoAndStop(2);
      actions.war_btn.onRelease = klikNext;
   }
   actions.close_btn.onRelease = function()
   {
      if(tipeWar == "serang")
      {
         bisaTombol(true);
         actions.gotoAndStop(1);
         xpause = false;
         klikActions();
      }
      else
      {
         cekDiserang();
      }
   };
   actions.winfo = "";
   actions.soldiers = _root.soldierKota[_root.pilihKota];
   actions.brought = 0;
   i = 1;
   while(i <= totalWeapon)
   {
      if(i == 1)
      {
         actions["xweapon" + i] = Number(_root.swordKota[_root.pilihKota]);
      }
      else if(i == 2)
      {
         actions["xweapon" + i] = Number(_root.xarrowKota[_root.pilihKota]);
      }
      else if(i == 3)
      {
         actions["xweapon" + i] = Number(_root.spearKota[_root.pilihKota]);
      }
      else if(i == 4)
      {
         actions["xweapon" + i] = Number(_root.fireKota[_root.pilihKota]);
      }
      else if(i == 5)
      {
         actions["xweapon" + i] = Number(_root.coalKota[_root.pilihKota]);
      }
      else if(i == 6)
      {
         actions["xweapon" + i] = Number(_root.iceballKota[_root.pilihKota]);
      }
      else if(i == 7)
      {
         actions["xweapon" + i] = Number(_root.fireballKota[_root.pilihKota]);
      }
      else if(i == 8)
      {
         actions["xweapon" + i] = Number(_root.poisonKota[_root.pilihKota]);
      }
      else if(i == 9)
      {
         actions["xweapon" + i] = Number(_root.hurricaneKota[_root.pilihKota]);
      }
      else if(i == 10)
      {
         actions["xweapon" + i] = Number(_root.earthquakeKota[_root.pilihKota]);
      }
      else if(i == 11)
      {
         actions["xweapon" + i] = Number(_root.xsuperKota[_root.pilihKota]);
      }
      i++;
   }
   i = 1;
   while(i <= totalBata)
   {
      if(i == 1)
      {
         actions["xsoldier" + i] = Number(_root.soldierKota[_root.pilihKota]);
      }
      else if(i == 2)
      {
         actions["xsoldier" + i] = Number(_root.horseKota[_root.pilihKota]);
      }
      else if(i == 3)
      {
         actions["xsoldier" + i] = Number(_root.catapultKota[_root.pilihKota]);
      }
      else if(i == 4)
      {
         actions["xsoldier" + i] = Number(_root.witchKota[_root.pilihKota]);
      }
      else if(i == 5)
      {
         actions["xsoldier" + i] = Number(_root.elephantKota[_root.pilihKota]);
      }
      else if(i == 6)
      {
         actions["xsoldier" + i] = Number(_root.xsuperKota[_root.pilihKota]);
      }
      i++;
   }
   actions.pasukan1 = Number(_root.soldierKota[_root.pilihKota]);
   actions.pasukan2 = Number(_root.horseKota[_root.pilihKota]);
   actions.pasukan3 = Number(_root.catapultKota[_root.pilihKota]);
   actions.pasukan4 = Number(_root.witchKota[_root.pilihKota]);
   actions.pasukan5 = Number(_root.elephantKota[_root.pilihKota]);
   actions.pasukan6 = Number(_root.xsuperKota[_root.pilihKota]);
   actions.xpasukan1 = actions.pasukan1;
   actions.xpasukan2 = actions.pasukan2;
   actions.xpasukan3 = actions.pasukan3;
   actions.xpasukan4 = actions.pasukan4;
   actions.xpasukan5 = actions.pasukan5;
   actions.xpasukan6 = actions.pasukan6;
   pilihPasukan = 1;
   batasKiri = new Array();
   batasKanan = new Array();
   i = 1;
   while(i <= 6)
   {
      j = 1;
      while(j <= 6)
      {
         if(actions["pasukan" + i] > actions["pasukan" + j])
         {
            if(actions["pasukan" + i] > actions["pasukan" + pilihPasukan])
            {
               pilihPasukan = i;
            }
         }
         j++;
      }
      i++;
   }
   i = 1;
   while(i <= 10)
   {
      posWeapon[i] = 1;
      posBata[i] = pilihPasukan;
      actions["jumlah" + i] = 0;
      actions["xjumlah" + i].onChanged = ubahJumlah2;
      actions["tipe" + i].gotoAndStop(posWeapon[i]);
      actions["bata" + i].gotoAndStop(posBata[i]);
      actions["tipe" + i].kiri_mc.onRelease = klikKiri;
      actions["tipe" + i].kanan_mc.onRelease = klikKanan;
      actions["bata" + i].kiri_mc.onRelease = klikKiri2;
      actions["bata" + i].kanan_mc.onRelease = klikKanan2;
      actions["max" + i].onRelease = klikMax2;
      actions["setengah" + i].onRelease = klikSetengah2;
      actions["seperempat" + i].onRelease = klikSeperempat2;
      xsenjata(i);
      i++;
   }
   cekWeapon();
   xxi = 1;
   while(xxi <= 10)
   {
      cekSoldier(xxi);
      xxi++;
   }
}
function xsenjata(xindi, windi)
{
   i = xindi;
   if(actions["bata" + i]._currentframe == 3)
   {
      batasKiri[i] = 2;
      batasKanan[i] = 5;
      if(windi != 1)
      {
         actions["tipe" + i].gotoAndStop(2);
         posWeapon[i] = 2;
      }
   }
   else if(actions["bata" + i]._currentframe == 4)
   {
      batasKiri[i] = 6;
      batasKanan[i] = 10;
      if(windi != 1)
      {
         actions["tipe" + i].gotoAndStop(6);
         posWeapon[i] = 6;
      }
   }
   else if(actions["bata" + i]._currentframe == 6)
   {
      batasKiri[i] = 11;
      batasKanan[i] = 11;
      if(windi != 1)
      {
         actions["tipe" + i].gotoAndStop(11);
         posWeapon[i] = 11;
      }
   }
   else
   {
      batasKiri[i] = 1;
      batasKanan[i] = 4;
      if(windi != 1)
      {
         actions["tipe" + i].gotoAndStop(1);
         posWeapon[i] = 1;
      }
   }
   actions["tipe" + i].kiri_mc.onRelease = klikKiri;
   actions["tipe" + i].kanan_mc.onRelease = klikKanan;
}
function klikMax6()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 22)
   {
      actions["brought" + indi] = Math.floor(_root.hurricaneKota[_root.pilihKota]);
   }
   else if(indi == 23)
   {
      actions["brought" + indi] = Math.floor(_root.earthquakeKota[_root.pilihKota]);
   }
}
function klikSetengah6()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 22)
   {
      actions["brought" + indi] = Math.floor(_root.hurricaneKota[_root.pilihKota] / 2);
   }
   else if(indi == 23)
   {
      actions["brought" + indi] = Math.floor(_root.earthquakeKota[_root.pilihKota] / 2);
   }
}
function klikSeperempat6()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 22)
   {
      actions["brought" + indi] = Math.floor(_root.hurricaneKota[_root.pilihKota] / 4);
   }
   else if(indi == 23)
   {
      actions["brought" + indi] = Math.floor(_root.earthquakeKota[_root.pilihKota] / 4);
   }
}
function klikMax5()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 15)
   {
      actions["brought" + indi] = Math.floor(_root.elephantKota[_root.pilihKota]);
   }
   else if(indi == 16)
   {
      actions["brought" + indi] = Math.floor(_root.fireKota[_root.pilihKota]);
   }
   else if(indi == 17)
   {
      actions["brought" + indi] = Math.floor(_root.steelKota[_root.pilihKota]);
   }
   else if(indi == 18)
   {
      actions["brought" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota]);
   }
   else if(indi == 19)
   {
      actions["brought" + indi] = Math.floor(_root.iceballKota[_root.pilihKota]);
   }
   else if(indi == 20)
   {
      actions["brought" + indi] = Math.floor(_root.fireballKota[_root.pilihKota]);
   }
   else if(indi == 21)
   {
      actions["brought" + indi] = Math.floor(_root.poisonKota[_root.pilihKota]);
   }
}
function klikSetengah5()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 15)
   {
      actions["brought" + indi] = Math.floor(_root.elephantKota[_root.pilihKota] / 2);
   }
   else if(indi == 16)
   {
      actions["brought" + indi] = Math.floor(_root.fireKota[_root.pilihKota] / 2);
   }
   else if(indi == 17)
   {
      actions["brought" + indi] = Math.floor(_root.steelKota[_root.pilihKota] / 2);
   }
   else if(indi == 18)
   {
      actions["brought" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 2);
   }
   else if(indi == 19)
   {
      actions["brought" + indi] = Math.floor(_root.iceballKota[_root.pilihKota] / 2);
   }
   else if(indi == 20)
   {
      actions["brought" + indi] = Math.floor(_root.fireballKota[_root.pilihKota] / 2);
   }
   else if(indi == 21)
   {
      actions["brought" + indi] = Math.floor(_root.poisonKota[_root.pilihKota] / 2);
   }
}
function klikSeperempat5()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 15)
   {
      actions["brought" + indi] = Math.floor(_root.elephantKota[_root.pilihKota] / 4);
   }
   else if(indi == 16)
   {
      actions["brought" + indi] = Math.floor(_root.fireKota[_root.pilihKota] / 4);
   }
   else if(indi == 17)
   {
      actions["brought" + indi] = Math.floor(_root.steelKota[_root.pilihKota] / 4);
   }
   else if(indi == 18)
   {
      actions["brought" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 4);
   }
   else if(indi == 19)
   {
      actions["brought" + indi] = Math.floor(_root.iceballKota[_root.pilihKota] / 4);
   }
   else if(indi == 20)
   {
      actions["brought" + indi] = Math.floor(_root.fireballKota[_root.pilihKota] / 4);
   }
   else if(indi == 21)
   {
      actions["brought" + indi] = Math.floor(_root.poisonKota[_root.pilihKota] / 4);
   }
}
function klikMax4()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 8)
   {
      actions["brought" + indi] = Math.floor(_root.diamondKota[_root.pilihKota]);
   }
   else if(indi == 9)
   {
      actions["brought" + indi] = Math.floor(_root.coalKota[_root.pilihKota]);
   }
   else if(indi == 10)
   {
      actions["brought" + indi] = Math.floor(_root.oilKota[_root.pilihKota]);
   }
   else if(indi == 11)
   {
      actions["brought" + indi] = Math.floor(_root.horseKota[_root.pilihKota]);
   }
   else if(indi == 12)
   {
      actions["brought" + indi] = Math.floor(_root.spearKota[_root.pilihKota]);
   }
   else if(indi == 13)
   {
      actions["brought" + indi] = Math.floor(_root.catapultKota[_root.pilihKota]);
   }
   else if(indi == 14)
   {
      actions["brought" + indi] = Math.floor(_root.witchKota[_root.pilihKota]);
   }
}
function klikSetengah4()
{
   myStr = new String(this);
   if(myStr.length == 28)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 8)
   {
      actions["brought" + indi] = Math.floor(_root.diamondKota[_root.pilihKota] / 2);
   }
   else if(indi == 9)
   {
      actions["brought" + indi] = Math.floor(_root.coalKota[_root.pilihKota] / 2);
   }
   else if(indi == 10)
   {
      actions["brought" + indi] = Math.floor(_root.oilKota[_root.pilihKota] / 2);
   }
   else if(indi == 11)
   {
      actions["brought" + indi] = Math.floor(_root.horseKota[_root.pilihKota] / 2);
   }
   else if(indi == 12)
   {
      actions["brought" + indi] = Math.floor(_root.spearKota[_root.pilihKota] / 2);
   }
   else if(indi == 13)
   {
      actions["brought" + indi] = Math.floor(_root.catapultKota[_root.pilihKota] / 2);
   }
   else if(indi == 14)
   {
      actions["brought" + indi] = Math.floor(_root.witchKota[_root.pilihKota] / 2);
   }
}
function klikSeperempat4()
{
   myStr = new String(this);
   if(myStr.length == 30)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(indi == 8)
   {
      actions["brought" + indi] = Math.floor(_root.diamondKota[_root.pilihKota] / 4);
   }
   else if(indi == 9)
   {
      actions["brought" + indi] = Math.floor(_root.coalKota[_root.pilihKota] / 4);
   }
   else if(indi == 10)
   {
      actions["brought" + indi] = Math.floor(_root.oilKota[_root.pilihKota] / 4);
   }
   else if(indi == 11)
   {
      actions["brought" + indi] = Math.floor(_root.horseKota[_root.pilihKota] / 4);
   }
   else if(indi == 12)
   {
      actions["brought" + indi] = Math.floor(_root.spearKota[_root.pilihKota] / 4);
   }
   else if(indi == 13)
   {
      actions["brought" + indi] = Math.floor(_root.catapultKota[_root.pilihKota] / 4);
   }
   else if(indi == 14)
   {
      actions["brought" + indi] = Math.floor(_root.witchKota[_root.pilihKota] / 4);
   }
}
function klikMax3()
{
   myStr = new String(this);
   indi = Number(myStr.substr(myStr.length - 1,1));
   if(indi == 1)
   {
      actions["brought" + indi] = Math.floor(_root.moneyKota[_root.pilihKota]);
   }
   else if(indi == 2)
   {
      actions["brought" + indi] = Math.floor(_root.foodKota[_root.pilihKota]);
   }
   else if(indi == 3)
   {
      actions["brought" + indi] = Math.floor(_root.ironKota[_root.pilihKota]);
   }
   else if(indi == 4)
   {
      actions["brought" + indi] = Math.floor(_root.woodKota[_root.pilihKota]);
   }
   else if(indi == 5)
   {
      actions["brought" + indi] = Math.floor(_root.swordKota[_root.pilihKota]);
   }
   else if(indi == 6)
   {
      actions["brought" + indi] = Math.floor(_root.xarrowKota[_root.pilihKota]);
   }
   else if(indi == 7)
   {
      actions["brought" + indi] = Math.floor(_root.soldierKota[_root.pilihKota]);
   }
}
function klikSetengah3()
{
   myStr = new String(this);
   indi = Number(myStr.substr(myStr.length - 1,1));
   if(indi == 1)
   {
      actions["brought" + indi] = Math.floor(_root.moneyKota[_root.pilihKota] / 2);
   }
   else if(indi == 2)
   {
      actions["brought" + indi] = Math.floor(_root.foodKota[_root.pilihKota] / 2);
   }
   else if(indi == 3)
   {
      actions["brought" + indi] = Math.floor(_root.ironKota[_root.pilihKota] / 2);
   }
   else if(indi == 4)
   {
      actions["brought" + indi] = Math.floor(_root.woodKota[_root.pilihKota] / 2);
   }
   else if(indi == 5)
   {
      actions["brought" + indi] = Math.floor(_root.swordKota[_root.pilihKota] / 2);
   }
   else if(indi == 6)
   {
      actions["brought" + indi] = Math.floor(_root.xarrowKota[_root.pilihKota] / 2);
   }
   else if(indi == 7)
   {
      actions["brought" + indi] = Math.floor(_root.soldierKota[_root.pilihKota] / 2);
   }
}
function klikSeperempat3()
{
   myStr = new String(this);
   indi = Number(myStr.substr(myStr.length - 1,1));
   if(indi == 1)
   {
      actions["brought" + indi] = Math.floor(_root.moneyKota[_root.pilihKota] / 4);
   }
   else if(indi == 2)
   {
      actions["brought" + indi] = Math.floor(_root.foodKota[_root.pilihKota] / 4);
   }
   else if(indi == 3)
   {
      actions["brought" + indi] = Math.floor(_root.ironKota[_root.pilihKota] / 4);
   }
   else if(indi == 4)
   {
      actions["brought" + indi] = Math.floor(_root.woodKota[_root.pilihKota] / 4);
   }
   else if(indi == 5)
   {
      actions["brought" + indi] = Math.floor(_root.swordKota[_root.pilihKota] / 4);
   }
   else if(indi == 6)
   {
      actions["brought" + indi] = Math.floor(_root.xarrowKota[_root.pilihKota] / 4);
   }
   else if(indi == 7)
   {
      actions["brought" + indi] = Math.floor(_root.soldierKota[_root.pilihKota] / 4);
   }
}
function klikMax2()
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(_root.swordKota[_root.pilihKota] + _root.xarrowKota[_root.pilihKota] + _root.spearKota[_root.pilihKota] + _root.fireKota[_root.pilihKota] + _root.coalKota[_root.pilihKota] + _root.fireballKota[_root.pilihKota] + _root.iceballKota[_root.pilihKota] + _root.poisonKota[_root.pilihKota] + _root.hurricaneKota[_root.pilihKota] + _root.earthquakeKota[_root.pilihKota] <= _root.soldierKota[_root.pilihKota] + _root.horseKota[_root.pilihKota] + _root.catapultKota[_root.pilihKota] + _root.elephantKota[_root.pilihKota] + _root.witchKota[_root.pilihKota] + _root.xsuperKota[_root.pilihKota])
   {
      if(posWeapon[indi] == 1)
      {
         actions["xweapon" + indi] = Math.floor(_root.swordKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 2)
      {
         actions["xweapon" + indi] = Math.floor(_root.xarrowKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 3)
      {
         actions["xweapon" + indi] = Math.floor(_root.spearKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 4)
      {
         actions["xweapon" + indi] = Math.floor(_root.fireKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 5)
      {
         actions["xweapon" + indi] = Math.floor(_root.coalKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 6)
      {
         actions["xweapon" + indi] = Math.floor(_root.iceballKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 7)
      {
         actions["xweapon" + indi] = Math.floor(_root.fireballKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 8)
      {
         actions["xweapon" + indi] = Math.floor(_root.poisonKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 9)
      {
         actions["xweapon" + indi] = Math.floor(_root.hurricaneKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 10)
      {
         actions["xweapon" + indi] = Math.floor(_root.earthquakeKota[_root.pilihKota] / 4);
      }
      else if(posWeapon[indi] == 11)
      {
         actions["xweapon" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 4);
      }
   }
   else if(posBata[indi] == 1)
   {
      actions["xweapon" + indi] = Math.floor(_root.soldierKota[_root.pilihKota] / 4);
   }
   else if(posBata[indi] == 2)
   {
      actions["xweapon" + indi] = Math.floor(_root.horseKota[_root.pilihKota] / 4);
   }
   else if(posBata[indi] == 3)
   {
      actions["xweapon" + indi] = Math.floor(_root.catapultKota[_root.pilihKota] / 4);
   }
   else if(posBata[indi] == 4)
   {
      actions["xweapon" + indi] = Math.floor(_root.witchKota[_root.pilihKota] / 4);
   }
   else if(posBata[indi] == 5)
   {
      actions["xweapon" + indi] = Math.floor(_root.elephantKota[_root.pilihKota] / 4);
   }
   else if(posBata[indi] == 6)
   {
      actions["xweapon" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 4);
   }
   if(actions["xweapon" + indi] > 0)
   {
      actions["jumlah" + indi] = actions["xweapon" + indi];
   }
   ubahJumlah(indi,1);
}
function klikSetengah2()
{
   myStr = new String(this);
   if(myStr.length == 28)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   if(_root.swordKota[_root.pilihKota] + _root.xarrowKota[_root.pilihKota] + _root.spearKota[_root.pilihKota] + _root.fireKota[_root.pilihKota] + _root.coalKota[_root.pilihKota] + _root.fireballKota[_root.pilihKota] + _root.iceballKota[_root.pilihKota] + _root.poisonKota[_root.pilihKota] + _root.hurricaneKota[_root.pilihKota] + _root.earthquakeKota[_root.pilihKota] <= _root.soldierKota[_root.pilihKota] + _root.horseKota[_root.pilihKota] + _root.catapultKota[_root.pilihKota] + _root.elephantKota[_root.pilihKota] + _root.witchKota[_root.pilihKota] + _root.xsuperKota[_root.pilihKota])
   {
      if(posWeapon[indi] == 1)
      {
         actions["xweapon" + indi] = Math.floor(_root.swordKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 2)
      {
         actions["xweapon" + indi] = Math.floor(_root.xarrowKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 3)
      {
         actions["xweapon" + indi] = Math.floor(_root.spearKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 4)
      {
         actions["xweapon" + indi] = Math.floor(_root.fireKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 5)
      {
         actions["xweapon" + indi] = Math.floor(_root.coalKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 6)
      {
         actions["xweapon" + indi] = Math.floor(_root.iceballKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 7)
      {
         actions["xweapon" + indi] = Math.floor(_root.fireballKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 8)
      {
         actions["xweapon" + indi] = Math.floor(_root.poisonKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 9)
      {
         actions["xweapon" + indi] = Math.floor(_root.hurricaneKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 10)
      {
         actions["xweapon" + indi] = Math.floor(_root.earthquakeKota[_root.pilihKota] / 5);
      }
      else if(posWeapon[indi] == 11)
      {
         actions["xweapon" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 5);
      }
   }
   else if(posBata[indi] == 1)
   {
      actions["xweapon" + indi] = Math.floor(_root.soldierKota[_root.pilihKota] / 5);
   }
   else if(posBata[indi] == 2)
   {
      actions["xweapon" + indi] = Math.floor(_root.horseKota[_root.pilihKota] / 5);
   }
   else if(posBata[indi] == 3)
   {
      actions["xweapon" + indi] = Math.floor(_root.catapultKota[_root.pilihKota] / 5);
   }
   else if(posBata[indi] == 4)
   {
      actions["xweapon" + indi] = Math.floor(_root.witchKota[_root.pilihKota] / 5);
   }
   else if(posBata[indi] == 5)
   {
      actions["xweapon" + indi] = Math.floor(_root.elephantKota[_root.pilihKota] / 5);
   }
   else if(posBata[indi] == 6)
   {
      actions["xweapon" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 5);
   }
   if(actions["xweapon" + indi] > 0)
   {
      actions["jumlah" + indi] = actions["xweapon" + indi];
   }
   ubahJumlah(indi,1);
}
function klikSeperempat2()
{
   myStr = new String(this);
   if(myStr.length == 30)
   {
      indi = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi = myStr.substr(myStr.length - 2,2);
   }
   if(_root.swordKota[_root.pilihKota] + _root.xarrowKota[_root.pilihKota] + _root.spearKota[_root.pilihKota] + _root.fireKota[_root.pilihKota] + _root.coalKota[_root.pilihKota] + _root.fireballKota[_root.pilihKota] + _root.iceballKota[_root.pilihKota] + _root.poisonKota[_root.pilihKota] + _root.hurricaneKota[_root.pilihKota] + _root.earthquakeKota[_root.pilihKota] <= _root.soldierKota[_root.pilihKota] + _root.horseKota[_root.pilihKota] + _root.catapultKota[_root.pilihKota] + _root.elephantKota[_root.pilihKota] + _root.witchKota[_root.pilihKota] + _root.xsuperKota[_root.pilihKota])
   {
      if(posWeapon[indi] == 1)
      {
         actions["xweapon" + indi] = Math.floor(_root.swordKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 2)
      {
         actions["xweapon" + indi] = Math.floor(_root.xarrowKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 3)
      {
         actions["xweapon" + indi] = Math.floor(_root.spearKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 4)
      {
         actions["xweapon" + indi] = Math.floor(_root.fireKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 5)
      {
         actions["xweapon" + indi] = Math.floor(_root.coalKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 6)
      {
         actions["xweapon" + indi] = Math.floor(_root.iceballKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 7)
      {
         actions["xweapon" + indi] = Math.floor(_root.fireballKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 8)
      {
         actions["xweapon" + indi] = Math.floor(_root.poisonKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 9)
      {
         actions["xweapon" + indi] = Math.floor(_root.hurricaneKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 10)
      {
         actions["xweapon" + indi] = Math.floor(_root.earthquakeKota[_root.pilihKota] / 10);
      }
      else if(posWeapon[indi] == 11)
      {
         actions["xweapon" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 10);
      }
   }
   else if(posBata[indi] == 1)
   {
      actions["xweapon" + indi] = Math.floor(_root.soldierKota[_root.pilihKota] / 10);
   }
   else if(posBata[indi] == 2)
   {
      actions["xweapon" + indi] = Math.floor(_root.horseKota[_root.pilihKota] / 10);
   }
   else if(posBata[indi] == 3)
   {
      actions["xweapon" + indi] = Math.floor(_root.catapultKota[_root.pilihKota] / 10);
   }
   else if(posBata[indi] == 4)
   {
      actions["xweapon" + indi] = Math.floor(_root.witchKota[_root.pilihKota] / 10);
   }
   else if(posBata[indi] == 5)
   {
      actions["xweapon" + indi] = Math.floor(_root.elephantKota[_root.pilihKota] / 10);
   }
   else if(posBata[indi] == 6)
   {
      actions["xweapon" + indi] = Math.floor(_root.xsuperKota[_root.pilihKota] / 10);
   }
   if(actions["xweapon" + indi] > 0)
   {
      actions["jumlah" + indi] = actions["xweapon" + indi];
   }
   ubahJumlah(indi,1);
}
function ubahJumlah(xindi, windi)
{
   myStr = new String(this);
   if(myStr.length == 23)
   {
      indi = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi = myStr.substr(myStr.length - 2,2);
   }
   cekRemain();
   cekWeapon();
   cekSoldier(xindi,windi);
}
function ubahJumlah2(xindi, windi)
{
   myStr = new String(this);
   if(myStr.length == 27)
   {
      indi = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      indi = Number(myStr.substr(myStr.length - 2,2));
   }
   cekRemain();
   cekWeapon();
   cekSoldier(indi,1);
}
function cekRemain()
{
   totalSemua1 = _root.soldierKota[_root.pilihKota];
   totalSemua2 = _root.horseKota[_root.pilihKota];
   totalSemua3 = _root.catapultKota[_root.pilihKota];
   totalSemua4 = _root.witchKota[_root.pilihKota];
   totalSemua5 = _root.elephantKota[_root.pilihKota];
   totalSemua6 = _root.xsuperKota[_root.pilihKota];
   zi = 1;
   while(zi <= 10)
   {
      if(posBata[zi] == 1)
      {
         if(actions["jumlah" + zi] <= 0 || isNaN(actions["jumlah" + zi]) || actions["jumlah" + zi] == undefined)
         {
            actions["jumlah" + zi] = 0;
         }
         _root.totalSemua1 -= actions["jumlah" + zi];
      }
      else if(posBata[zi] == 2)
      {
         if(actions["jumlah" + zi] <= 0 || isNaN(actions["jumlah" + zi]) || actions["jumlah" + zi] == undefined)
         {
            actions["jumlah" + zi] = 0;
         }
         _root.totalSemua2 -= actions["jumlah" + zi];
      }
      else if(posBata[zi] == 3)
      {
         if(actions["jumlah" + zi] <= 0 || isNaN(actions["jumlah" + zi]) || actions["jumlah" + zi] == undefined)
         {
            actions["jumlah" + zi] = 0;
         }
         _root.totalSemua3 -= actions["jumlah" + zi];
      }
      else if(posBata[zi] == 4)
      {
         if(actions["jumlah" + zi] <= 0 || isNaN(actions["jumlah" + zi]) || actions["jumlah" + zi] == undefined)
         {
            actions["jumlah" + zi] = 0;
         }
         _root.totalSemua4 -= actions["jumlah" + zi];
      }
      else if(posBata[zi] == 5)
      {
         if(actions["jumlah" + zi] <= 0 || isNaN(actions["jumlah" + zi]) || actions["jumlah" + zi] == undefined)
         {
            actions["jumlah" + zi] = 0;
         }
         _root.totalSemua5 -= actions["jumlah" + zi];
      }
      else if(posBata[zi] == 6)
      {
         if(actions["jumlah" + zi] <= 0 || isNaN(actions["jumlah" + zi]) || actions["jumlah" + zi] == undefined)
         {
            actions["jumlah" + zi] = 0;
         }
         _root.totalSemua6 -= actions["jumlah" + zi];
      }
      zi++;
   }
   actions.xpasukan1 = _root.totalSemua1;
   actions.xpasukan2 = _root.totalSemua2;
   actions.xpasukan3 = _root.totalSemua3;
   actions.xpasukan4 = _root.totalSemua4;
   actions.xpasukan5 = _root.totalSemua5;
   actions.xpasukan6 = _root.totalSemua6;
}
function cekWeapon()
{
   xbrought = 0;
   i = 1;
   while(i <= totalWeapon)
   {
      if(i == 1)
      {
         actions["xweapon" + i] = Number(_root.swordKota[_root.pilihKota]);
      }
      else if(i == 2)
      {
         actions["xweapon" + i] = Number(_root.xarrowKota[_root.pilihKota]);
      }
      else if(i == 3)
      {
         actions["xweapon" + i] = Number(_root.spearKota[_root.pilihKota]);
      }
      else if(i == 4)
      {
         actions["xweapon" + i] = Number(_root.fireKota[_root.pilihKota]);
      }
      else if(i == 5)
      {
         actions["xweapon" + i] = Number(_root.coalKota[_root.pilihKota]);
      }
      else if(i == 6)
      {
         actions["xweapon" + i] = Number(_root.iceballKota[_root.pilihKota]);
      }
      else if(i == 7)
      {
         actions["xweapon" + i] = Number(_root.fireballKota[_root.pilihKota]);
      }
      else if(i == 8)
      {
         actions["xweapon" + i] = Number(_root.poisonKota[_root.pilihKota]);
      }
      else if(i == 9)
      {
         actions["xweapon" + i] = Number(_root.hurricaneKota[_root.pilihKota]);
      }
      else if(i == 10)
      {
         actions["xweapon" + i] = Number(_root.earthquakeKota[_root.pilihKota]);
      }
      else if(i == 11)
      {
         actions["xweapon" + i] = Number(_root.xsuperKota[_root.pilihKota]);
      }
      i++;
   }
   i = 1;
   while(i <= 10)
   {
      if(!isNaN(actions["jumlah" + i]))
      {
         xbrought += Number(actions["jumlah" + i]);
      }
      if(posWeapon[i] == 1)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 2)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 3)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 4)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 5)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 6)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 7)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 8)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 9)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 10)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      else if(posWeapon[i] == 11)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xweapon" + posWeapon[i]] -= actions["jumlah" + i];
         }
      }
      i++;
   }
   actions.brought = xbrought;
   if(actions.brought <= 0 || isNaN(actions.brought))
   {
      actions.brought = 0;
   }
   i = 1;
   while(i <= 10)
   {
      if(posWeapon[i] == 1)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 2)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 3)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 4)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 5)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 6)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 7)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 8)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 9)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 10)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      else if(posWeapon[i] == 11)
      {
         actions["weapon" + i] = actions["xweapon" + posWeapon[i]];
      }
      if(isNaN(actions["weapon" + i]))
      {
         actions["weapon" + i] = 0;
      }
      i++;
   }
}
function cekSoldier(xindi, windi)
{
   xsenjata(xindi,windi);
   xbrought = 0;
   i = 1;
   while(i <= totalBata)
   {
      if(i == 1)
      {
         actions["xsoldier" + i] = Number(_root.soldierKota[_root.pilihKota]);
      }
      else if(i == 2)
      {
         actions["xsoldier" + i] = Number(_root.horseKota[_root.pilihKota]);
      }
      else if(i == 3)
      {
         actions["xsoldier" + i] = Number(_root.catapultKota[_root.pilihKota]);
      }
      else if(i == 4)
      {
         actions["xsoldier" + i] = Number(_root.witchKota[_root.pilihKota]);
      }
      else if(i == 5)
      {
         actions["xsoldier" + i] = Number(_root.elephantKota[_root.pilihKota]);
      }
      else if(i == 6)
      {
         actions["xsoldier" + i] = Number(_root.xsuperKota[_root.pilihKota]);
      }
      i++;
   }
   i = 1;
   while(i <= 10)
   {
      if(!isNaN(actions["jumlah" + i]))
      {
         xbrought += Number(actions["jumlah" + i]);
      }
      if(posBata[i] == 1)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xsoldier" + posBata[i]] -= actions["jumlah" + i];
         }
      }
      else if(posBata[i] == 2)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xsoldier" + posBata[i]] -= actions["jumlah" + i];
         }
      }
      else if(posBata[i] == 3)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xsoldier" + posBata[i]] -= actions["jumlah" + i];
         }
      }
      else if(posBata[i] == 4)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xsoldier" + posBata[i]] -= actions["jumlah" + i];
         }
      }
      else if(posBata[i] == 5)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xsoldier" + posBata[i]] -= actions["jumlah" + i];
         }
      }
      else if(posBata[i] == 6)
      {
         if(!isNaN(actions["jumlah" + i]))
         {
            actions["xsoldier" + posBata[i]] -= actions["jumlah" + i];
         }
      }
      i++;
   }
   actions.brought = xbrought;
   if(actions.brought <= 0 || isNaN(actions.brought))
   {
      actions.brought = 0;
   }
   i = 1;
   while(i <= 10)
   {
      if(posBata[i] == 1)
      {
         actions["soldier" + i] = actions["xsoldier" + posBata[i]];
      }
      else if(posBata[i] == 2)
      {
         actions["soldier" + i] = actions["xsoldier" + posBata[i]];
      }
      else if(posBata[i] == 3)
      {
         actions["soldier" + i] = actions["xsoldier" + posBata[i]];
      }
      else if(posBata[i] == 4)
      {
         actions["soldier" + i] = actions["xsoldier" + posBata[i]];
      }
      else if(posBata[i] == 5)
      {
         actions["soldier" + i] = actions["xsoldier" + posBata[i]];
      }
      else if(posBata[i] == 6)
      {
         actions["soldier" + i] = actions["xsoldier" + posBata[i]];
      }
      if(isNaN(actions["soldier" + i]))
      {
         actions["soldier" + i] = 0;
      }
      i++;
   }
   cekWeapon();
}
function klikKiri()
{
   myStr = new String(this._parent);
   if(myStr.length == 24)
   {
      indi = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi = myStr.substr(myStr.length - 2,2);
   }
   posWeapon[indi]--;
   if(posWeapon[indi] < batasKiri[indi])
   {
      posWeapon[indi] = batasKanan[indi];
   }
   actions["tipe" + indi].gotoAndStop(posWeapon[indi]);
   cekWeapon();
}
function klikKanan()
{
   myStr = new String(this._parent);
   if(myStr.length == 24)
   {
      indi = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi = myStr.substr(myStr.length - 2,2);
   }
   posWeapon[indi]++;
   if(posWeapon[indi] > batasKanan[indi])
   {
      posWeapon[indi] = batasKiri[indi];
   }
   actions["tipe" + indi].gotoAndStop(posWeapon[indi]);
   cekWeapon();
}
function klikKiri2()
{
   myStr = new String(this._parent);
   if(myStr.length == 24)
   {
      indi = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi = myStr.substr(myStr.length - 2,2);
   }
   posBata[indi]--;
   if(posBata[indi] < 1)
   {
      posBata[indi] = totalBata;
   }
   actions["bata" + indi].gotoAndStop(posBata[indi]);
   cekRemain();
   cekSoldier(indi);
}
function klikKanan2()
{
   myStr = new String(this._parent);
   if(myStr.length == 24)
   {
      indi = myStr.substr(myStr.length - 1,1);
   }
   else
   {
      indi = myStr.substr(myStr.length - 2,2);
   }
   posBata[indi]++;
   if(posBata[indi] > totalBata)
   {
      posBata[indi] = 1;
   }
   actions["bata" + indi].gotoAndStop(posBata[indi]);
   cekRemain();
   cekSoldier(indi);
}
function klikMove2()
{
   actions.winfo = "";
   bisaTombol(false);
   if(halamanMove == 1)
   {
      daftarNama = new Array("","Money","Foods","Irons","Logs","Swords","Arrows","Soldiers","Pearl","Coal","Oil","Horse","Spear","Catapult","Witch","Elephants","Fire Arrows","Steels","Super","Ice Ball","Fire Ball","Poison","Hurricane","Earthquake");
      i = 1;
      while(i <= 7)
      {
         actions["nama" + i] = daftarNama[i];
         if(daftarNama[i] == "Money")
         {
            actions["owned" + i] = _root.moneyKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Foods")
         {
            actions["owned" + i] = _root.foodKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Irons")
         {
            actions["owned" + i] = _root.ironKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Logs")
         {
            actions["owned" + i] = _root.woodKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Swords")
         {
            actions["owned" + i] = _root.swordKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Arrows")
         {
            actions["owned" + i] = _root.xarrowKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Soldiers")
         {
            actions["owned" + i] = _root.soldierKota[_root.pilihKota];
         }
         actions["max" + i].onRelease = klikMax3;
         actions["setengah" + i].onRelease = klikSetengah3;
         actions["seperempat" + i].onRelease = klikSeperempat3;
         i++;
      }
   }
   else if(halamanMove == 2)
   {
      daftarNama = new Array("","Money","Foods","Irons","Logs","Swords","Arrows","Soldiers","Pearl","Coal","Oil","Horse","Spear","Catapult","Witch","Elephants","Fire Arrows","Steels","Super","Ice Ball","Fire Ball","Poison","Hurricane","Earthquake");
      i = 8;
      while(i <= 14)
      {
         actions["nama" + i] = daftarNama[i];
         if(daftarNama[i] == "Pearl")
         {
            actions["owned" + i] = _root.diamondKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Coal")
         {
            actions["owned" + i] = _root.coalKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Oil")
         {
            actions["owned" + i] = _root.oilKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Horse")
         {
            actions["owned" + i] = _root.horseKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Spear")
         {
            actions["owned" + i] = _root.spearKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Catapult")
         {
            actions["owned" + i] = _root.catapultKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Witch")
         {
            actions["owned" + i] = _root.witchKota[_root.pilihKota];
         }
         actions["max" + i].onRelease = klikMax4;
         actions["setengah" + i].onRelease = klikSetengah4;
         actions["seperempat" + i].onRelease = klikSeperempat4;
         i++;
      }
   }
   else if(halamanMove == 3)
   {
      daftarNama = new Array("","Money","Foods","Irons","Logs","Swords","Arrows","Soldiers","Pearl","Coal","Oil","Horse","Spear","Catapult","Witch","Elephants","Fire Arrows","Steel","Super","Ice Ball","Fire Ball","Poison","Hurricane","Earthquake");
      i = 15;
      while(i <= 21)
      {
         actions["nama" + i] = daftarNama[i];
         if(daftarNama[i] == "Elephants")
         {
            actions["owned" + i] = _root.elephantKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Fire Arrows")
         {
            actions["owned" + i] = _root.fireKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Steel")
         {
            actions["owned" + i] = _root.steelKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Super")
         {
            actions["owned" + i] = _root.xsuperKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Ice Ball")
         {
            actions["owned" + i] = _root.iceballKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Fire Ball")
         {
            actions["owned" + i] = _root.fireballKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Poison")
         {
            actions["owned" + i] = _root.poisonKota[_root.pilihKota];
         }
         actions["max" + i].onRelease = klikMax5;
         actions["setengah" + i].onRelease = klikSetengah5;
         actions["seperempat" + i].onRelease = klikSeperempat5;
         i++;
      }
   }
   else if(halamanMove == 4)
   {
      daftarNama = new Array("","Money","Foods","Irons","Logs","Swords","Arrows","Soldiers","Pearl","Coal","Oil","Horse","Spear","Catapult","Witch","Elephants","Fire Arrows","Steel","Super","Ice Ball","Fire Ball","Poison","Hurricane","Earthquake");
      i = 22;
      while(i <= 23)
      {
         actions["nama" + i] = daftarNama[i];
         if(daftarNama[i] == "Hurricane")
         {
            actions["owned" + i] = _root.hurricaneKota[_root.pilihKota];
         }
         else if(daftarNama[i] == "Earthquake")
         {
            actions["owned" + i] = _root.earthquakeKota[_root.pilihKota];
         }
         actions["max" + i].onRelease = klikMax6;
         actions["setengah" + i].onRelease = klikSetengah6;
         actions["seperempat" + i].onRelease = klikSeperempat6;
         i++;
      }
   }
   actions.move_btn.onRelease = function()
   {
      bisaMove = true;
      i = 1;
      while(i <= 24)
      {
         if(actions["brought" + i] <= 0 || isNaN(actions["brought" + i]))
         {
            actions["brought" + i] = 0;
         }
         if(actions["brought" + i] > actions["owned" + i])
         {
            bisaMove = false;
         }
         i++;
      }
      if(bisaMove == true)
      {
         i = 1;
         while(i <= 24)
         {
            _root["bawaBarang" + i] = actions["brought" + i];
            i++;
         }
         i = 1;
         while(i <= 24)
         {
            if(i == 1)
            {
               moneyKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 2)
            {
               foodKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 3)
            {
               ironKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 4)
            {
               woodKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 5)
            {
               swordKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 6)
            {
               xarrowKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 7)
            {
               soldierKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 8)
            {
               diamondKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 9)
            {
               coalKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 10)
            {
               oilKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 11)
            {
               horseKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 12)
            {
               spearKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 13)
            {
               catapultKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 14)
            {
               witchKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 15)
            {
               elephantKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 16)
            {
               fireKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 17)
            {
               steelKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 18)
            {
               xsuperKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 19)
            {
               iceballKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 20)
            {
               fireballKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 21)
            {
               poisonKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 22)
            {
               hurricaneKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            else if(i == 23)
            {
               earthquakeKota[xpilihKota] -= Number(_root["bawaBarang" + i]);
            }
            if(i == 1)
            {
               moneyKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 2)
            {
               foodKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 3)
            {
               ironKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 4)
            {
               woodKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 5)
            {
               swordKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 6)
            {
               xarrowKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 7)
            {
               soldierKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 8)
            {
               diamondKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 9)
            {
               coalKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 10)
            {
               oilKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 11)
            {
               horseKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 12)
            {
               spearKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 13)
            {
               catapultKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 14)
            {
               witchKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 15)
            {
               elephantKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 16)
            {
               fireKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 17)
            {
               steelKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 18)
            {
               xsuperKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 19)
            {
               iceballKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 20)
            {
               fireballKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 21)
            {
               poisonKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 22)
            {
               hurricaneKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 23)
            {
               earthquakeKota[kotaDituju] += Number(_root["bawaBarang" + i]);
            }
            i++;
         }
         workerKota[xpilihKota] += Number(_root.bawaBarang7);
         workerKota[kotaDituju] -= Number(_root.bawaBarang7);
         workerKota[xpilihKota] += Number(_root.bawaBarang11);
         workerKota[kotaDituju] -= Number(_root.bawaBarang11);
         workerKota[xpilihKota] += Number(_root.bawaBarang13);
         workerKota[kotaDituju] -= Number(_root.bawaBarang13);
         workerKota[xpilihKota] += Number(_root.bawaBarang14);
         workerKota[kotaDituju] -= Number(_root.bawaBarang14);
         workerKota[xpilihKota] += Number(_root.bawaBarang15);
         workerKota[kotaDituju] -= Number(_root.bawaBarang15);
         workerKota[xpilihKota] += Number(_root.bawaBarang18);
         workerKota[kotaDituju] -= Number(_root.bawaBarang18);
         bisaTombol2(true);
         removeMovieClip(dunia);
         bisaTombol(true);
         removeMovieClip(actions);
         xpause = false;
      }
      else
      {
         backSalah();
         actions.winfo = "Không thể di chuyển: vượt quá lượng hàng cho phép!";
      }
   };
   actions.back_btn.onRelease = function()
   {
      bisaTombol2(true);
      removeMovieClip(dunia);
      bisaTombol(true);
      removeMovieClip(actions);
      xpause = false;
   };
}
function cekIstana()
{
   if(jenisKerajaan == 1)
   {
      posSatu = xpilihKota;
   }
   else if(jenisKerajaan == 2)
   {
      posDua = xpilihKota;
   }
   if(jenisMusuh == 1)
   {
      if(punyaWilayah[posSatu] != jenisMusuh)
      {
         i = 1;
         while(i <= 12)
         {
            if(punyaWilayah[i] == jenisMusuh)
            {
               posSatu = i;
            }
            i++;
         }
      }
   }
   else if(jenisMusuh == 2)
   {
      if(punyaWilayah[posDua] != jenisMusuh)
      {
         i = 1;
         while(i <= 12)
         {
            if(punyaWilayah[i] == jenisMusuh)
            {
               posDua = i;
            }
            i++;
         }
      }
   }
   adaMusuh = false;
   i = 1;
   while(i <= 12)
   {
      if(punyaWilayah[i] == jenisMusuh)
      {
         adaMusuh = true;
      }
      i++;
   }
   if(adaMusuh == false)
   {
      if(jenisMusuh == 1)
      {
         posSatu = 99;
      }
      else if(jenisMusuh == 2)
      {
         posDua = 99;
      }
   }
   i = 1;
   while(i <= 12)
   {
      dunia["istana" + i].gotoAndStop(3);
      if(posSatu == i)
      {
         dunia["istana" + i].gotoAndStop(1);
      }
      else if(posDua == i)
      {
         dunia["istana" + i].gotoAndStop(2);
      }
      i++;
   }
}
function klikMove(xindi)
{
   bisaTombol2(false);
   dunia = attachMovie("dunia_mc","dunia_mc",dalamDunia);
   dunia._x = 340;
   dunia._y = 240;
   dunia.select = "";
   dunia.empire1._visible = false;
   dunia.empire2._visible = false;
   dunia.select_mc._visible = true;
   dunia.select_mc.gotoAndStop(2);
   i = 1;
   while(i <= 12)
   {
      if(punyaWilayah[i] == 1)
      {
         dunia["daerah" + i].gotoAndStop(4);
      }
      else if(punyaWilayah[i] == 2)
      {
         dunia["daerah" + i].gotoAndStop(3);
      }
      else if(punyaWilayah[i] == 0)
      {
         dunia["daerah" + i].gotoAndStop(1);
      }
      if(punyaWilayah[i] == jenisKerajaan)
      {
         var _gdpV = _root.gdpKota[i];
         if(_gdpV == undefined) _gdpV = 0;
         var _gdpS = (_gdpV >= 0 ? "+$" : "-$") + Math.abs(_gdpV);
         dunia.createTextField("gdp_lbl_" + i, 8500 + i, dunia["daerah" + i]._x - 24, dunia["daerah" + i]._y - 8, 65, 18);
         var _gtf = dunia["gdp_lbl_" + i];
         _gtf.selectable = false;
         var _gtfFmt = new TextFormat();
         _gtfFmt.font = "Arial";
         _gtfFmt.size = 11;
         _gtfFmt.bold = true;
         _gtfFmt.color = (_gdpV >= 0 ? 0x22EE22 : 0xFF4444);
         _gtf.setNewTextFormat(_gtfFmt);
         _gtf.text = _gdpS;
      }
      i++;
   }
   cekIstana();
   dunia.select_mc.ok_btn.onRelease = function()
   {
      i = 1;
      while(i <= linkWilayah[pilihKota].length - 1)
      {
         if(punyaWilayah[linkWilayah[pilihKota][i]] == jenisKerajaan)
         {
            dunia["daerah" + linkWilayah[pilihKota][i]].gotoAndStop(2);
            dunia["daerah" + linkWilayah[pilihKota][i]].onRollOver = function()
            {
               this.gotoAndStop(5);
            };
            dunia["daerah" + linkWilayah[pilihKota][i]].onRollOut = function()
            {
               this.gotoAndStop(2);
            };
            dunia["daerah" + linkWilayah[pilihKota][i]].onRelease = function()
            {
               myStr = new String(this);
               if(myStr.length == 24)
               {
                  indi = Number(myStr.substr(myStr.length - 1,1));
               }
               else
               {
                  indi = Number(myStr.substr(myStr.length - 2,2));
               }
               kotaDituju = indi;
               if(xindi == "diserang")
               {
                  i = 1;
                  while(i <= 24)
                  {
                     randKurang = random(3) + 2;
                     if(i == 1)
                     {
                        moneyKota[kotaDituju] += Math.floor(moneyKota[pilihKota] / randKurang);
                     }
                     else if(i == 2)
                     {
                        foodKota[kotaDituju] += Math.floor(foodKota[pilihKota] / randKurang);
                     }
                     else if(i == 3)
                     {
                        ironKota[kotaDituju] += Math.floor(ironKota[pilihKota] / randKurang);
                     }
                     else if(i == 4)
                     {
                        woodKota[kotaDituju] += Math.floor(woodKota[pilihKota] / randKurang);
                     }
                     else if(i == 5)
                     {
                        swordKota[kotaDituju] += Math.floor(swordKota[pilihKota] / randKurang);
                     }
                     else if(i == 6)
                     {
                        xarrowKota[kotaDituju] += Math.floor(xarrowKota[pilihKota] / randKurang);
                     }
                     else if(i == 7)
                     {
                        soldierKota[kotaDituju] += Math.floor(soldierKota[pilihKota] / randKurang);
                     }
                     else if(i == 8)
                     {
                        diamondKota[kotaDituju] += Math.floor(diamondKota[pilihKota] / randKurang);
                     }
                     else if(i == 9)
                     {
                        coalKota[kotaDituju] += Math.floor(coalKota[pilihKota] / randKurang);
                     }
                     else if(i == 10)
                     {
                        oilKota[kotaDituju] += Math.floor(oilKota[pilihKota] / randKurang);
                     }
                     else if(i == 11)
                     {
                        horseKota[kotaDituju] += Math.floor(horseKota[pilihKota] / randKurang);
                     }
                     else if(i == 12)
                     {
                        spearKota[kotaDituju] += Math.floor(spearKota[pilihKota] / randKurang);
                     }
                     else if(i == 13)
                     {
                        catapultKota[kotaDituju] += Math.floor(catapultKota[pilihKota] / randKurang);
                     }
                     else if(i == 14)
                     {
                        witchKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 15)
                     {
                        elephantKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 16)
                     {
                        fireKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 17)
                     {
                        steelKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 18)
                     {
                        xsuperKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 19)
                     {
                        iceballKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 20)
                     {
                        fireballKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 21)
                     {
                        poisonKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 22)
                     {
                        hurricaneKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     else if(i == 23)
                     {
                        earthquakeKota[kotaDituju] += Math.floor(witchKota[pilihKota] / randKurang);
                     }
                     i++;
                  }
                  sudahKalah = false;
                  removeMovieClip(actions);
                  removeMovieClip(dunia);
                  resetWilayah(pilihKota,tipeMenyerang);
                  masihPunya = false;
                  i = 1;
                  while(i <= 12)
                  {
                     if(punyaWilayah[i] == jenisKerajaan)
                     {
                        kotaSekarang = i;
                        i = 13;
                        masihPunya = true;
                     }
                     i++;
                  }
                  if(masihPunya == true)
                  {
                     xpilihKota = kotaSekarang;
                     cekPilihKota(xpilihKota);
                  }
                  else
                  {
                     cekGameOver();
                  }
                  if(sudahKalah == false)
                  {
                     initSemua();
                  }
               }
               else
               {
                  actions = attachMovie("actions_mc","actions_mc",dalamActions);
                  actions.gotoAndStop(12);
                  actions._x = 340;
                  actions._y = 240;
                  halamanMove = 1;
                  actions.kiri_mc.onRelease = klikKeKiri;
                  actions.kanan_mc.onRelease = klikKeKanan;
                  i = 1;
                  while(i <= 24)
                  {
                     actions["brought" + i] = 0;
                     i++;
                  }
                  klikMove2();
                  removeMovieClip(dunia);
               }
            };
         }
         i++;
      }
      dunia.select_mc._visible = false;
   };
   dunia.close_btn.onRelease = function()
   {
      if(xindi == "diserang")
      {
         cekDiserang(aindi);
      }
      else
      {
         bisaTombol2(true);
         removeMovieClip(dunia);
         bisaTombol(true);
         removeMovieClip(actions);
         xpause = false;
      }
   };
}
function klikKeKiri()
{
   if(actions._currentframe == 13)
   {
      halamanMove = 1;
      actions.gotoAndStop(12);
      klikMove2();
   }
   else if(actions._currentframe == 14)
   {
      halamanMove = 2;
      actions.gotoAndStop(13);
      klikMove2();
   }
   else if(actions._currentframe == 15)
   {
      halamanMove = 3;
      actions.gotoAndStop(14);
      klikMove2();
   }
}
function klikKeKanan()
{
   if(actions._currentframe == 12)
   {
      halamanMove = 2;
      actions.gotoAndStop(13);
      klikMove2();
   }
   else if(actions._currentframe == 13)
   {
      halamanMove = 3;
      actions.gotoAndStop(14);
      klikMove2();
   }
   else if(actions._currentframe == 14)
   {
      halamanMove = 4;
      actions.gotoAndStop(15);
      klikMove2();
   }
}
function klikDetails()
{
   i = 1;
   while(i <= 12)
   {
      dunia["daerah" + i].enabled = false;
      i++;
   }
   myStr = new String(this);
   zindi = Number(myStr.substr(myStr.length - 1,1));
   actions = attachMovie("actions_mc","actions_mc",dalamActions2);
   actions.gotoAndStop(11);
   actions._x = 340;
   actions._y = 240;
   actions.empire = namaEmpire[zindi];
   i = 1;
   while(i <= 24)
   {
      actions["owned" + i] = 0;
      i++;
   }
   i = 1;
   while(i <= bykKota)
   {
      if(punyaWilayah[i] == zindi)
      {
         actions.owned1 += moneyKota[i];
         actions.owned2 += foodKota[i];
         actions.owned3 += ironKota[i];
         actions.owned4 += woodKota[i];
         actions.owned5 += swordKota[i];
         actions.owned6 += xarrowKota[i];
         actions.owned7 += soldierKota[i];
         actions.owned8 += workerKota[i];
         actions.owned9 += diamondKota[i];
         actions.owned10 += coalKota[i];
         actions.owned11 += oilKota[i];
         actions.owned12 += spearKota[i];
         actions.owned13 += horseKota[i];
         actions.owned14 += catapultKota[i];
         actions.owned15 += witchKota[i];
         actions.owned16 += elephantKota[i];
         actions.owned17 += fireKota[i];
         actions.owned18 += steelKota[i];
         actions.owned19 += xsuperKota[i];
         actions.owned20 += iceballKota[i];
         actions.owned21 += fireballKota[i];
         actions.owned22 += poisonKota[i];
         actions.owned23 += hurricaneKota[i];
         actions.owned24 += earthquakeKota[i];
      }
      i++;
   }
   zcitizen = 0;
   i = 1;
   while(i <= bykKota)
   {
      j = 1;
      while(j <= bykArea)
      {
         k = 1;
         while(k <= bykProperti)
         {
            if(jenisBangunan[i][j][k] == 2)
            {
               if(punyaWilayah[i] == zindi)
               {
                  zcitizen += 50 * upgradeProperti[i][j][k];
               }
            }
            k++;
         }
         j++;
      }
      i++;
   }
   actions.citizen = zcitizen;
   zcity = 0;
   i = 1;
   while(i <= bykKota)
   {
      if(punyaWilayah[i] == zindi)
      {
         zcity++;
      }
      i++;
   }
   actions.city = zcity;
   bykOrang = zcitizen + actions.owned8;
   if(bykOrang == 0)
   {
      bykOrang = 1;
   }
   actions.economy = Math.floor((actions.owned1 + actions.owned2 + actions.owned3 + actions.owned4 + actions.owned9 + actions.owned10 + actions.owned11 + actions.owned18) / bykOrang);
   actions.military = Math.floor((actions.owned5 + actions.owned6 + actions.owned7 + actions.owned12 + actions.owned13 + actions.owned14 + actions.owned15 + actions.owned16 + actions.owned17 + actions.owned19) / bykOrang);
   if(actions.economy <= 0)
   {
      actions.economy = 0;
   }
   if(actions.military <= 0)
   {
      actions.military = 0;
   }
   i = 1;
   while(i <= 24)
   {
      actions["stat" + i].onRollOver = overStat2;
      actions["stat" + i].onRollOut = outStat2;
      i++;
   }
   actions.close_btn.onRelease = function()
   {
      i = 1;
      while(i <= 12)
      {
         dunia["daerah" + i].enabled = true;
         i++;
      }
      removeMovieClip(actions);
   };
}
function klikMap(wwindi)
{
   stopDrag();
   removeMovieClip(object);
   sedangDrag = false;
   tipeWar = "serang";
   xpause = true;
   bisaTombol(false);
   dunia = attachMovie("dunia_mc","dunia_mc",dalamDunia);
   dunia._x = 340;
   dunia._y = 240;
   dunia.select = "Click to see the detail of:";
   if(jenisKerajaan == 1)
   {
      dunia.empire1._visible = true;
      dunia.empire2._visible = false;
   }
   else if(jenisKerajaan == 2)
   {
      dunia.empire1._visible = false;
      dunia.empire2._visible = true;
   }
   dunia.empire1.onRelease = klikDetails;
   dunia.empire2.onRelease = klikDetails;
   dunia.select_mc._visible = false;
   cekIstana();
   i = 1;
   while(i <= 12)
   {
      if(punyaWilayah[i] == 1)
      {
         dunia["daerah" + i].gotoAndStop(4);
      }
      else if(punyaWilayah[i] == 2)
      {
         dunia["daerah" + i].gotoAndStop(3);
      }
      else if(punyaWilayah[i] == 0)
      {
         dunia["daerah" + i].gotoAndStop(1);
      }
      if(punyaWilayah[i] == jenisKerajaan && wwindi != "war")
      {
         dunia["daerah" + i].onRollOver = function()
         {
            if(sedangDrag == false)
            {
               _root.overMana = 6;
               _root.myStr = new String(this);
               if(_root.myStr.length == 24)
               {
                  _root.windi = Number(_root.myStr.substr(_root.myStr.length - 1,1));
               }
               else if(_root.myStr.length == 25)
               {
                  _root.windi = Number(_root.myStr.substr(_root.myStr.length - 2,2));
               }
               _root.pilihButton = _root.windi;
               _root.jenisSentuh = "peta";
               _root.sentuhMsgBox = true;
            }
            else
            {
               _root.sentuhMsgBox = false;
            }
            this.gotoAndStop(2);
         };
         dunia["daerah" + i].onRollOut = function()
         {
            _root.sentuhMsgBox = false;
            myStr = new String(this);
            if(myStr.length == 24)
            {
               cekKota = Number(myStr.substr(myStr.length - 1,1));
            }
            else if(myStr.length == 25)
            {
               cekKota = Number(myStr.substr(myStr.length - 2,2));
            }
            if(punyaWilayah[cekKota] == 1)
            {
               this.gotoAndStop(4);
            }
            else if(punyaWilayah[cekKota] == 2)
            {
               this.gotoAndStop(3);
            }
         };
         dunia["daerah" + i].onRelease = function()
         {
            myStr = new String(this);
            if(myStr.length == 24)
            {
               cekKota = Number(myStr.substr(myStr.length - 1,1));
            }
            else if(myStr.length == 25)
            {
               cekKota = Number(myStr.substr(myStr.length - 2,2));
            }
            clearSemua();
            xpilihKota = cekKota;
            cekPilihKota(xpilihKota);
            initSemua();
         };
      }
      else if(punyaWilayah[i] == jenisMusuh && wwindi != "war")
      {
         dunia["daerah" + i].onRollOver = function()
         {
            if(sedangDrag == false)
            {
               _root.overMana = 7;
               _root.myStr = new String(this);
               if(_root.myStr.length == 24)
               {
                  _root.windi = Number(_root.myStr.substr(_root.myStr.length - 1,1));
               }
               else if(_root.myStr.length == 25)
               {
                  _root.windi = Number(_root.myStr.substr(_root.myStr.length - 2,2));
               }
               _root.pilihButton = _root.windi;
               _root.jenisSentuh = "peta";
               _root.sentuhMsgBox = true;
            }
            else
            {
               _root.sentuhMsgBox = false;
            }
            this.gotoAndStop(2);
         };
         dunia["daerah" + i].onRollOut = function()
         {
            _root.sentuhMsgBox = false;
            myStr = new String(this);
            if(myStr.length == 24)
            {
               cekKota = Number(myStr.substr(myStr.length - 1,1));
            }
            else if(myStr.length == 25)
            {
               cekKota = Number(myStr.substr(myStr.length - 2,2));
            }
            if(punyaWilayah[cekKota] == 1)
            {
               this.gotoAndStop(4);
            }
            else if(punyaWilayah[cekKota] == 2)
            {
               this.gotoAndStop(3);
            }
         };
      }
      i++;
   }
   // ================= NÚT LOGISTICS & DI DÂN PHONG CÁCH LA MÃ CỔ TRÊN BẢN ĐỒ =================
   if(dunia.logistics_btn == undefined)
   {
      var lbtn = dunia.createEmptyMovieClip("logistics_btn", 15000);
      lbtn._x = 95;
      lbtn._y = -215;
      
      // Hàm vẽ khung nút phong cách La Mã cổ đại
      lbtn.drawStyle = function(isOver) {
         this.clear();
         var bgCol = isOver ? 0x48301B : 0x2A1A0D;
         var borderCol = isOver ? 0xFFE082 : 0xC8963E;
         var lightBorder = isOver ? 0xFFF5C0 : 0xE5BD6B;
         var shadowBorder = isOver ? 0x241508 : 0x140B04;
         
         // Lớp nền chính
         this.beginFill(bgCol, 95);
         this.lineStyle(1.5, borderCol, 100);
         this.moveTo(0, 0);
         this.lineTo(165, 0);
         this.lineTo(165, 30);
         this.lineTo(0, 30);
         this.lineTo(0, 0);
         this.endFill();
         
         // Đường viền sáng 3D trên & trái
         this.lineStyle(1, lightBorder, 80);
         this.moveTo(1, 29);
         this.lineTo(1, 1);
         this.lineTo(164, 1);
         
         // Đường viền đổ bóng 3D dưới & phải
         this.lineStyle(1, shadowBorder, 90);
         this.moveTo(164, 1);
         this.lineTo(164, 29);
         this.lineTo(1, 29);
         
         // Vẽ Logo đoàn xe thồ La Mã cổ
         this.lineStyle(1.5, isOver ? 0xFFE599 : 0xDBA848, 100);
         // Bánh xe ngoài
         this.drawCircle = function(cx, cy, r) {
            this.moveTo(cx + r, cy);
            this.curveTo(cx + r, cy + r * 0.414, cx + r * 0.707, cy + r * 0.707);
            this.curveTo(cx + r * 0.414, cy + r, cx, cy + r);
            this.curveTo(cx - r * 0.414, cy + r, cx - r * 0.707, cy + r * 0.707);
            this.curveTo(cx - r, cy + r * 0.414, cx - r, cy);
            this.curveTo(cx - r, cy - r * 0.414, cx - r * 0.707, cy - r * 0.707);
            this.curveTo(cx - r * 0.414, cy - r, cx, cy - r);
            this.curveTo(cx + r * 0.414, cy - r, cx + r * 0.707, cy - r * 0.707);
            this.curveTo(cx + r, cy - r * 0.414, cx + r, cy);
         };
         this.drawCircle(14, 15, 7);
         // Nan hoa xe
         this.moveTo(14, 8); this.lineTo(14, 22);
         this.moveTo(7, 15); this.lineTo(21, 15);
         // Thùng xe hàng
         this.lineStyle(1.5, isOver ? 0xFFD54F : 0xC48E33, 100);
         this.moveTo(14, 11); this.lineTo(26, 11); this.lineTo(24, 19); this.lineTo(14, 19);
      };
      
      lbtn.drawStyle(false);
      
      // Nhãn chữ tiếng Việt có dấu sắc nét
      lbtn.createTextField("txt", 2, 28, 4, 134, 24);
      var fmt = new TextFormat();
      fmt.font = "Arial";
      fmt.size = 11;
      fmt.bold = true;
      fmt.align = "center";
      fmt.color = 0xF5D378;
      lbtn.txt.selectable = false;
      lbtn.txt.setNewTextFormat(fmt);
      lbtn.txt.text = "VẬN TẢI & DI DÂN";
      
      // Tương tác chuột
      lbtn.onRollOver = function() {
         this.drawStyle(true);
         this.txt.textColor = 0xFFFFFF;
      };
      lbtn.onRollOut = function() {
         this.drawStyle(false);
         this.txt.textColor = 0xF5D378;
      };
      lbtn.onPress = function() {
         this._y += 1;
      };
      lbtn.onRelease = function() {
         this._y -= 1;
         _root.openLogisticsManager();
      };
   }

   dunia.close_btn.onRelease = function()
   {
      bisaTombol2(true);
      removeMovieClip(dunia);
      bisaTombol(true);
      removeMovieClip(actions);
      xpause = false;
   };
}
function klikExport()
{
   actions.gotoAndStop(3);
   daftarNama = new Array("","Foods","Irons","Logs","Pearls","Coals","Oils","Steels");
   var daftarNamaVN = new Array("","Lương thực","Sắt","Gỗ","Ngọc trai","Than đá","Dầu","Thép");
   i = 1;
   while(i <= 7)
   {
      actions["nama" + i] = daftarNamaVN[i];
      if(daftarNama[i] == "Foods")
      {
         actions["owned" + i] = _root.foodKota[_root.pilihKota];
         actions["xprice" + i] = String(randomFood);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Irons")
      {
         actions["owned" + i] = _root.ironKota[_root.pilihKota];
         actions["xprice" + i] = String(randomIron);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Logs")
      {
         actions["owned" + i] = _root.woodKota[_root.pilihKota];
         actions["xprice" + i] = String(randomLog);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Pearls")
      {
         actions["owned" + i] = _root.diamondKota[_root.pilihKota];
         actions["xprice" + i] = String(randomPearl);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Coals")
      {
         actions["owned" + i] = _root.coalKota[_root.pilihKota];
         actions["xprice" + i] = String(randomCoal);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Oils")
      {
         actions["owned" + i] = _root.oilKota[_root.pilihKota];
         actions["xprice" + i] = String(randomOil);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Steels")
      {
         actions["owned" + i] = _root.steelKota[_root.pilihKota];
         actions["xprice" + i] = String(randomSteel);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      actions["export" + i] = 0;
      actions["xexport" + i].onChanged = cekHarga;
      actions["max" + i].onRelease = function()
      {
         myStr = new String(this);
         indi = myStr.substr(myStr.length - 1,1);
         actions["export" + indi] = actions["owned" + indi];
         cekHarga();
      };
      actions["setengah" + i].onRelease = function()
      {
         myStr = new String(this);
         indi = myStr.substr(myStr.length - 1,1);
         actions["export" + indi] = Math.floor(actions["owned" + indi] / 2);
         cekHarga();
      };
      actions["seperempat" + i].onRelease = function()
      {
         myStr = new String(this);
         indi = myStr.substr(myStr.length - 1,1);
         actions["export" + indi] = Math.floor(actions["owned" + indi] / 4);
         cekHarga();
      };
      i++;
   }
   actions.info = "";
   actions.before = "$" + _root.moneyKota[_root.pilihKota];
   actions.after = "$" + _root.moneyKota[_root.pilihKota];
   actions.xafter = _root.moneyKota[_root.pilihKota];
   actions.export_btn.onRelease = function()
   {
      bisaEksport = true;
      i = 1;
      while(i <= 7)
      {
         if(daftarNama[i] == "Foods")
         {
            if(Number(actions["export" + i]) > Number(_root.foodKota[_root.pilihKota]))
            {
               if(Number(_root.foodKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         if(daftarNama[i] == "Irons")
         {
            if(Number(actions["export" + i]) > Number(_root.ironKota[_root.pilihKota]))
            {
               if(Number(_root.ironKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         if(daftarNama[i] == "Logs")
         {
            if(Number(actions["export" + i]) > Number(_root.woodKota[_root.pilihKota]))
            {
               if(Number(_root.woodKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         if(daftarNama[i] == "Pearls")
         {
            if(Number(actions["export" + i]) > Number(_root.diamondKota[_root.pilihKota]))
            {
               if(Number(_root.diamondKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         if(daftarNama[i] == "Coals")
         {
            if(Number(actions["export" + i]) > Number(_root.coalKota[_root.pilihKota]))
            {
               if(Number(_root.coalKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         if(daftarNama[i] == "Oils")
         {
            if(Number(actions["export" + i]) > Number(_root.oilKota[_root.pilihKota]))
            {
               if(Number(_root.oilKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         if(daftarNama[i] == "Steels")
         {
            if(Number(actions["export" + i]) > Number(_root.steelKota[_root.pilihKota]))
            {
               if(Number(_root.steelKota[_root.pilihKota]) >= 0)
               {
                  bisaEksport = false;
               }
            }
         }
         i++;
      }
      if(bisaEksport == true)
      {
         awalSemua();
         i = 1;
         while(i <= 7)
         {
            actions["nama" + i] = daftarNama[i];
            if(actions["export" + i] <= 0 || actions["export" + i] == "" || actions["export" + i] == " " || actions["export" + i] == "  " || actions["export" + i] == "   " || actions["export" + i] == "    " || actions["export" + i] == undefined || isNaN(actions["export" + i]))
            {
               actions["export" + i] = 0;
            }
            if(daftarNama[i] == "Foods")
            {
               _root.foodKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            else if(daftarNama[i] == "Irons")
            {
               _root.ironKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            else if(daftarNama[i] == "Logs")
            {
               _root.woodKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            else if(daftarNama[i] == "Pearls")
            {
               _root.diamondKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            else if(daftarNama[i] == "Coals")
            {
               _root.coalKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            else if(daftarNama[i] == "Oils")
            {
               _root.oilKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            else if(daftarNama[i] == "Steels")
            {
               _root.steelKota[_root.pilihKota] -= Number(actions["export" + i]);
            }
            i++;
         }
         _root.moneyKota[_root.pilihKota] = Number(actions.xafter);
         bisaTombol(true);
         removeMovieClip(actions);
         xpause = false;
         akhirSemua();
      }
      else
      {
         backSalah();
         actions.info = "Không thể xuất khẩu: số lượng xuất vượt quá kho dự trữ!";
      }
   };
   actions.close_btn.onRelease = function()
   {
      klikActions();
   };
}
function cekHarga()
{
   actions.hargaJual = 0;
   i = 1;
   while(i <= 7)
   {
      if(actions["export" + i] <= 0 || actions["export" + i] == "" || actions["export" + i] == " " || actions["export" + i] == "  " || actions["export" + i] == "   " || actions["export" + i] == "    " || actions["export" + i] == undefined || isNaN(actions["export" + i]))
      {
         actions.hargaJual += 0;
      }
      else
      {
         myStr = new String(actions["export" + i]);
         h = 0;
         while(h <= myStr.length)
         {
            if(myStr.substr(h,1) == "0")
            {
               actions["export" + i] = myStr.substr(h + 1,myStr.length);
            }
            else
            {
               h = myStr.length;
            }
            h++;
         }
         actions.hargaJual += Number(actions["xprice" + i]) * Number(actions["export" + i]);
      }
      i++;
   }
   if(tingkatSulit == 3)
   {
      actions.hargaJual = Math.floor(actions.hargaJual * 0.8);
   }
   else if(tingkatSulit == 4)
   {
      actions.hargaJual = Math.floor(actions.hargaJual * 0.5);
   }
   actions.xafter = String(Number(actions.hargaJual) + Number(_root.moneyKota[_root.pilihKota]));
   actions.after = "$" + actions.xafter;
}
function klikImport()
{
   if(tingkatSulit == 4)
   {
      cekInfo(2000,"Độ khó Cực Khó: Nghiêm cấm hoàn toàn hoạt động nhập khẩu từ bên ngoài!");
      return;
   }
   actions.gotoAndStop(4);
   daftarNama = new Array("","Foods","Irons","Logs","Pearls","Coals","Oils","Steels");
   var daftarNamaVN = new Array("","Lương thực","Sắt","Gỗ","Ngọc trai","Than đá","Dầu","Thép");
   i = 1;
   while(i <= 7)
   {
      actions["nama" + i] = daftarNamaVN[i];
      if(daftarNama[i] == "Foods")
      {
         actions["owned" + i] = _root.foodKota[_root.pilihKota];
         actions["xprice" + i] = String(randomFood * 2);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Irons")
      {
         actions["owned" + i] = _root.ironKota[_root.pilihKota];
         actions["xprice" + i] = String(randomIron * 2);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Logs")
      {
         actions["owned" + i] = _root.woodKota[_root.pilihKota];
         actions["xprice" + i] = String(randomLog * 2);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Pearls")
      {
         actions["owned" + i] = _root.diamondKota[_root.pilihKota];
         actions["xprice" + i] = String(randomPearl * 3);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Coals")
      {
         actions["owned" + i] = _root.coalKota[_root.pilihKota];
         actions["xprice" + i] = String(randomCoal * 3);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Oils")
      {
         actions["owned" + i] = _root.oilKota[_root.pilihKota];
         actions["xprice" + i] = String(randomOil * 3);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      else if(daftarNama[i] == "Steels")
      {
         actions["owned" + i] = _root.steelKota[_root.pilihKota];
         actions["xprice" + i] = String(randomSteel * 3);
         actions["price" + i] = "$" + actions["xprice" + i];
      }
      actions["import" + i] = 0;
      actions["ximport" + i].onChanged = cekHarga2;
      actions["max" + i].onRelease = function()
      {
         myStr = new String(this);
         indi = Number(myStr.substr(myStr.length - 1,1));
         actions["import" + indi] = Math.floor(Number(_root.moneyKota[_root.pilihKota]) / Number(actions["xprice" + indi]));
         cekHarga2();
      };
      actions["setengah" + i].onRelease = function()
      {
         myStr = new String(this);
         indi = myStr.substr(myStr.length - 1,1);
         actions["import" + indi] = Math.floor(Number(_root.moneyKota[_root.pilihKota]) / Number(actions["xprice" + indi] * 2));
         cekHarga2();
      };
      actions["seperempat" + i].onRelease = function()
      {
         myStr = new String(this);
         indi = myStr.substr(myStr.length - 1,1);
         actions["import" + indi] = Math.floor(Number(_root.moneyKota[_root.pilihKota]) / Number(actions["xprice" + indi] * 4));
         cekHarga2();
      };
      i++;
   }
   actions.info = "";
   actions.before = "$" + _root.moneyKota[_root.pilihKota];
   actions.after = "$" + _root.moneyKota[_root.pilihKota];
   actions.xafter = _root.moneyKota[_root.pilihKota];
   actions.import_btn.onRelease = function()
   {
      bisaImport = true;
      if(actions.xafter < 0)
      {
         bisaImport = false;
      }
      if(bisaImport == true)
      {
         awalSemua();
         i = 1;
         while(i <= 7)
         {
            actions["nama" + i] = daftarNama[i];
            if(actions["import" + i] <= 0 || actions["import" + i] == "" || actions["import" + i] == " " || actions["import" + i] == "  " || actions["import" + i] == "   " || actions["import" + i] == "    " || actions["import" + i] == undefined || isNaN(actions["import" + i]))
            {
               actions["import" + i] = 0;
            }
            if(daftarNama[i] == "Foods")
            {
               _root.foodKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            else if(daftarNama[i] == "Irons")
            {
               _root.ironKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            else if(daftarNama[i] == "Logs")
            {
               _root.woodKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            else if(daftarNama[i] == "Pearls")
            {
               _root.diamondKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            else if(daftarNama[i] == "Coals")
            {
               _root.coalKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            else if(daftarNama[i] == "Oils")
            {
               _root.oilKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            else if(daftarNama[i] == "Steels")
            {
               _root.steelKota[_root.pilihKota] += Number(actions["import" + i]);
            }
            i++;
         }
         _root.moneyKota[_root.pilihKota] = Number(actions.xafter);
         bisaTombol(true);
         removeMovieClip(actions);
         xpause = false;
         akhirSemua();
      }
      else
      {
         backSalah();
         actions.info = "Không thể nhập khẩu: bạn không có đủ tiền vàng!";
      }
   };
   actions.close_btn.onRelease = function()
   {
      klikActions();
   };
}
function cekHarga2()
{
   actions.hargaJual = 0;
   i = 1;
   while(i <= 7)
   {
      if(actions["import" + i] <= 0 || actions["import" + i] == "" || actions["import" + i] == " " || actions["import" + i] == "  " || actions["import" + i] == "   " || actions["import" + i] == "    " || actions["import" + i] == undefined || isNaN(actions["import" + i]))
      {
         actions.hargaJual += 0;
      }
      else
      {
         myStr = new String(actions["import" + i]);
         h = 0;
         while(h <= myStr.length)
         {
            if(myStr.substr(h,1) == "0")
            {
               actions["import" + i] = myStr.substr(h + 1,myStr.length);
            }
            else
            {
               h = myStr.length;
            }
            h++;
         }
         actions.hargaJual += Number(actions["xprice" + i]) * Number(actions["import" + i]);
      }
      i++;
   }
   actions.xafter = String(Number(_root.moneyKota[_root.pilihKota]) - Number(actions.hargaJual));
   actions.after = "$" + actions.xafter;
}
function overButton()
{
   if(sedangDrag == false)
   {
      overMana = 1;
      myStr = new String(this);
      if(myStr.length == 22)
      {
         windi = Number(myStr.substr(myStr.length - 1,1));
      }
      else
      {
         windi = Number(myStr.substr(myStr.length - 2,2));
      }
      pilihButton = windi;
      jenisSentuh = "button";
      sentuhMsgBox = true;
   }
   else
   {
      sentuhMsgBox = false;
   }
}
function outButton()
{
   sentuhMsgBox = false;
}
function overButton2()
{
   if(sedangDrag == false)
   {
      overMana = 2;
      windi = xbangunan;
      pilihButton = windi;
      jenisSentuh = "button";
      sentuhMsgBox = true;
   }
   else
   {
      sentuhMsgBox = false;
   }
}
function outButton3()
{
   sentuhMsgBox = false;
}
function overButton3()
{
   if(sedangDrag == false)
   {
      overMana = 3;
      myStr = new String(this);
      if(myStr.length == 22)
      {
         pilihArea = Number(myStr.substr(myStr.length - 1,1));
      }
      else
      {
         pilihArea = Number(myStr.substr(myStr.length - 2,2));
      }
      lihatMana = upgradeProperti[pilihKota][pilihMap][pilihArea];
      pilihButton = this._currentframe - 1;
      jenisSentuh = "button";
      sentuhMsgBox = true;
   }
   else
   {
      sentuhMsgBox = false;
   }
}
function outButton2()
{
   sentuhMsgBox = false;
}
function klikButton()
{
   sentuhMsgBox = false;
   outButton();
   myStr = new String(this);
   if(myStr.length == 22)
   {
      xbangunan = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      xbangunan = Number(myStr.substr(myStr.length - 2,2));
   }
   if(sedangDrag == false)
   {
      pilihBangun = xbangunan + 1;
      if(pilihBangun == 2)
      {
         object = attachMovie("houses_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 3)
      {
         object = attachMovie("farm_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 4)
      {
         object = attachMovie("market_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 5)
      {
         object = attachMovie("log_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 6)
      {
         object = attachMovie("tambang_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 7)
      {
         object = attachMovie("pedang_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 8)
      {
         object = attachMovie("panah_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 9)
      {
         object = attachMovie("barak_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 10)
      {
         object = attachMovie("fish_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 11)
      {
         object = attachMovie("gold_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 12)
      {
         object = attachMovie("tombak_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 13)
      {
         object = attachMovie("pearl_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 14)
      {
         object = attachMovie("horse_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 15)
      {
         object = attachMovie("cow_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 16)
      {
         object = attachMovie("shrimp_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 17)
      {
         object = attachMovie("elephant_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 18)
      {
         object = attachMovie("coal_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 19)
      {
         object = attachMovie("oil_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 20)
      {
         object = attachMovie("catapult_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 21)
      {
         object = attachMovie("witch_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 22)
      {
         object = attachMovie("steel_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 23)
      {
         object = attachMovie("fire_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 24)
      {
         object = attachMovie("jewel_mc","object_mc",dalamDrag);
      }
      else if(pilihBangun == 25)
      {
         object = attachMovie("super_mc","object_mc",dalamDrag);
      }
      object._x = -500;
      object._y = -500;
      sedangDrag = true;
      object._xscale = object._yscale = 50;
      startDrag(object,1);
   }
   else
   {
      stopDrag();
      removeMovieClip(object);
      sedangDrag = false;
   }
}
function cekArea(indi, indi2)
{
   i = 1;
   while(i <= bykArea)
   {
      indi["area" + i].gotoAndStop(jenisBangunan[pilihKota][pilihMap][i]);
      indi["area" + i].xupgrade.gotoAndStop(upgradeProperti[pilihKota][pilihMap][i]);
      j = 1;
      while(j <= 4)
      {
         map["map" + j].xpeta_mc["area" + i].gotoAndStop(jenisBangunan[pilihKota][j][i]);
         map["map" + j].xpeta_mc["area" + i].xupgrade.gotoAndStop(upgradeProperti[pilihKota][j][i]);
         j++;
      }
      indi["area" + i].onPress = klikArea;
      indi["area" + i].onRollOver = overButton3;
      indi["area" + i].onRollOut = outButton3;
      i++;
   }
}
function cekArea2()
{
   i = 1;
   while(i <= bykArea)
   {
      j = 1;
      while(j <= 4)
      {
         map["map" + j].xpeta_mc["area" + i].gotoAndStop(jenisBangunan[pilihKota][j][i]);
         map["map" + j].xpeta_mc["area" + i].xupgrade.gotoAndStop(upgradeProperti[pilihKota][j][i]);
         j++;
      }
      i++;
   }
}
function bisaTombol(indi)
{
   ai = 1;
   while(ai <= bykArea)
   {
      peta["area" + ai].enabled = indi;
      ai++;
   }
   ai = 1;
   while(ai <= bykBangunan)
   {
      map["button" + ai].enabled = indi;
      map["stat" + ai].enabled = indi;
      ai++;
   }
   ai = 1;
   while(ai <= bykArea)
   {
      map["map" + ai].enabled = indi;
      ai++;
   }
   map.map_btn.enabled = indi;
   map.actions_btn.enabled = indi;
   map.options_btn.enabled = indi;
}
function bisaTombol2(indi)
{
   actions.war_btn.enabled = indi;
   actions.export_btn.enabled = indi;
   actions.import_btn.enabled = indi;
   actions.close_btn.enabled = indi;
   actions.map_btn.enabled = indi;
}
function klikArea()
{
   sentuhMsgBox = false;
   myStr = new String(this);
   if(myStr.length == 22)
   {
      pilihArea = Number(myStr.substr(myStr.length - 1,1));
   }
   else
   {
      pilihArea = Number(myStr.substr(myStr.length - 2,2));
   }
   if(sedangDrag == false)
   {
      if(this._currentframe == 2)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("houses","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.persons = 50 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 25 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] -= 50 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 100 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 3)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("farm","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 200 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 75 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 4)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("market","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = "$" + String(100 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.foods = 50 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 20 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 5)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("carpenter","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 20 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(10 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 6)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("mine","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 25 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(20 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 7)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("sword","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(15 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.logs = 2 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.iron = 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 8)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("arrow","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(15 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.logs = 4 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.iron = 2 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 9)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("barracks","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 2 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(30 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 10)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("fish","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 100 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 11)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("gold","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 200 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(15 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 12)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("spear","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(15 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.iron = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 200 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 13)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("pearl","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 4 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 300 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 14)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("horse","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 2 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 30 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(20 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 15)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("cow","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 300 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 150 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 16)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("shrimp","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 300 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 200 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 17)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("elephant","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 40 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(30 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 15 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 300 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 18)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("coal","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 3 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 15 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(20 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 19)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("oil","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 100 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 25 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(40 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 15 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 400 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 20)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("catapult","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 25 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(50 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.logs = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.iron = 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.coal = 30 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 25 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 450 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 21)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("witch","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 2 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 50 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(75 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
         semua.spell.gotoAndStop(spellBuat[pilihKota][pilihMap][pilihArea]);
         semua.spell.kanan_mc.onRelease = function()
         {
            if(semua.spell._currentframe < 5)
            {
               spellBuat[pilihKota][pilihMap][pilihArea]++;
               semua.spell.gotoAndStop(spellBuat[pilihKota][pilihMap][pilihArea]);
            }
         };
         semua.spell.kiri_mc.onRelease = function()
         {
            if(semua.spell._currentframe > 1)
            {
               spellBuat[pilihKota][pilihMap][pilihArea]--;
               semua.spell.gotoAndStop(spellBuat[pilihKota][pilihMap][pilihArea]);
            }
         };
      }
      else if(this._currentframe == 22)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("steel","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 30 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(45 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 23)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("fire","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 10 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(25 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.logs = 4 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.iron = 2 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.oil = 200 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 125 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 24)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("jewel","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 2000 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.pearl = 20 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 5 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 250 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      else if(this._currentframe == 25)
      {
         bisaTombol(false);
         xpause = true;
         semua = attachMovie("super","semua",dalamSemua);
         semua.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.produce = 1 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.foods = 30 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.money = "$" + String(60 * upgradeProperti[pilihKota][pilihMap][pilihArea]);
         semua.steel = 25 * upgradeProperti[pilihKota][pilihMap][pilihArea];
         semua.close_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
         };
         semua.sell_btn.onRelease = function()
         {
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            awalSemua();
            workerKota[pilihKota] += 30 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            moneyKota[pilihKota] += 500 * upgradeProperti[pilihKota][pilihMap][pilihArea];
            akhirSemua();
            jenisBangunan[pilihKota][pilihMap][pilihArea] = 1;
            peta["area" + pilihArea].gotoAndStop(1);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(1);
            upgradeProperti[pilihKota][pilihMap][pilihArea] = 1;
         };
      }
      xbangunan = this._currentframe - 1;
      pilihBangun = this._currentframe;
      if(upgradeProperti[pilihKota][pilihMap][pilihArea] > 1)
      {
         semua.upgrade_btn._visible = false;
      }
      else
      {
         semua.upgrade_btn._visible = true;
      }
      semua.upgrade_btn.onRollOver = overButton2;
      semua.upgrade_btn.onRollOut = outButton2;
      semua.upgrade_btn.onRelease = function()
      {
         sentuhMsgBox = false;
         z = 1;
         while(z <= 5)
         {
            _root["tambahan" + z] = "";
            z++;
         }
         bisaMoney = true;
         bisaFood = true;
         bisaIron = true;
         bisaWood = true;
         bisaWorker = true;
         bisaBangun = true;
         if(kebutuhanMoney[xbangunan] > moneyKota[pilihKota])
         {
            bisaMoney = false;
            tambahan1 = "Tiền vàng ";
         }
         if(kebutuhanFood[xbangunan] > foodKota[pilihKota])
         {
            bisaFood = false;
            tambahan2 = "Lương thực ";
         }
         if(kebutuhanIron[xbangunan] > ironKota[pilihKota])
         {
            bisaIron = false;
            tambahan3 = "Sắt ";
         }
         if(kebutuhanWood[xbangunan] > woodKota[pilihKota])
         {
            bisaWood = false;
            tambahan4 = "Gỗ ";
         }
         if(kebutuhanWorker[xbangunan] > workerKota[pilihKota])
         {
            if(pilihBangun != 2)
            {
               bisaWorker = false;
               tambahan5 = "Dân lao động ";
            }
         }
         if(bisaMoney == false || bisaFood == false || bisaIron == false || bisaWood == false || bisaWorker == false)
         {
            bisaBangun = false;
         }
         if(bisaBangun == true)
         {
            backBangun();
            upgradeProperti[pilihKota][pilihMap][pilihArea]++;
            jenisBangunan[pilihKota][pilihMap][pilihArea] = pilihBangun;
            peta["area" + pilihArea].gotoAndStop(pilihBangun);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(pilihBangun);
            peta["area" + pilihArea].xupgrade.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].xupgrade.gotoAndStop(upgradeProperti[pilihKota][pilihMap][pilihArea]);
            awalSemua();
            moneyKota[pilihKota] -= Number(kebutuhanMoney[xbangunan]);
            foodKota[pilihKota] -= Number(kebutuhanFood[xbangunan]);
            ironKota[pilihKota] -= Number(kebutuhanIron[xbangunan]);
            woodKota[pilihKota] -= Number(kebutuhanWood[xbangunan]);
            workerKota[pilihKota] -= Number(kebutuhanWorker[xbangunan]);
            akhirSemua();
            bisaTombol(true);
            removeMovieClip(semua);
            xpause = false;
            cekAnim();
         }
         else
         {
            tambahanKata = "";
            adaKurang = 0;
            tambahI = 1;
            i = 1;
            while(i <= 5)
            {
               if(_root["tambahan" + i] != "")
               {
                  tambahanKata += String(tambahI + ". " + _root["tambahan" + i]);
                  adaKurang++;
                  tambahI++;
               }
               i++;
            }
            if(adaKurang == 1)
            {
               i = 1;
               while(i <= 5)
               {
                  if(_root["tambahan" + i] != "")
                  {
                     tambahanKata = _root["tambahan" + i];
                  }
                  i++;
               }
            }
            backSalah();
            cekInfo2(750,"Không thể nâng cấp, còn thiếu: " + tambahanKata);
            pilihBangun = 1;
         }
      };
   }
   else if(this._currentframe == 1)
   {
      z = 1;
      while(z <= 5)
      {
         _root["tambahan" + z] = "";
         z++;
      }
      bisaMoney = true;
      bisaFood = true;
      bisaIron = true;
      bisaWood = true;
      bisaWorker = true;
      bisaBangun = true;
      if(kebutuhanMoney[xbangunan] > moneyKota[pilihKota])
      {
         bisaMoney = false;
         tambahan1 = "Tiền vàng ";
      }
      if(kebutuhanFood[xbangunan] > foodKota[pilihKota])
      {
         bisaFood = false;
         tambahan2 = "Lương thực ";
      }
      if(kebutuhanIron[xbangunan] > ironKota[pilihKota])
      {
         bisaIron = false;
         tambahan3 = "Sắt ";
      }
      if(kebutuhanWood[xbangunan] > woodKota[pilihKota])
      {
         bisaWood = false;
         tambahan4 = "Gỗ ";
      }
      if(kebutuhanWorker[xbangunan] > workerKota[pilihKota])
      {
         if(pilihBangun != 2)
         {
            bisaWorker = false;
            tambahan5 = "Dân lao động ";
         }
      }
      if(bisaMoney == false || bisaFood == false || bisaIron == false || bisaWood == false || bisaWorker == false)
      {
         bisaBangun = false;
      }
      if(bisaBangun == true)
      {
         if(bisaSungai[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 3)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Ruộng lúa bắt buộc phải ở gần nguồn nước!");
         }
         else if(bisaSungai[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 13)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Hồ ngọc trai bắt buộc phải ở gần nguồn nước!");
         }
         else if(bisaSungai[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 16)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Ao tôm bắt buộc phải ở gần nguồn nước!");
         }
         else if(bisaHutan[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 18)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Mỏ than bắt buộc phải ở gần rừng cây!");
         }
         else if(bisaSungai[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 10)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Hồ cá bắt buộc phải ở gần nguồn nước!");
         }
         else if(bisaHutan[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 5)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Xưởng gỗ bắt buộc phải ở gần rừng cây!");
         }
         else if(bisaGunung[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 6)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Mỏ sắt bắt buộc phải ở gần vách núi!");
         }
         else if(bisaGunung[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 11)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Mỏ vàng bắt buộc phải ở gần vách núi!");
         }
         else if(bisaGunung[pilihKota][pilihMap][pilihArea] == 0 && pilihBangun == 22)
         {
            backSalah();
            cekInfo(750,"Không thể xây: Mỏ thép bắt buộc phải ở gần vách núi!");
         }
         else
         {
            backBangun();
            if(pilihBangun == 14)
            {
               waktuBuat[pilihKota][pilihMap][pilihArea] = 0;
            }
            else if(pilihBangun == 17)
            {
               waktuBuat[pilihKota][pilihMap][pilihArea] = 0;
            }
            else if(pilihBangun == 20)
            {
               waktuBuat[pilihKota][pilihMap][pilihArea] = 0;
            }
            else if(pilihBangun == 21)
            {
               waktuBuat[pilihKota][pilihMap][pilihArea] = 0;
            }
            else if(pilihBangun == 25)
            {
               waktuBuat[pilihKota][pilihMap][pilihArea] = 0;
            }
            jenisBangunan[pilihKota][pilihMap][pilihArea] = pilihBangun;
            this.gotoAndStop(pilihBangun);
            map["map" + pilihMap].xpeta_mc["area" + pilihArea].gotoAndStop(pilihBangun);
            awalSemua();
            moneyKota[pilihKota] -= Number(kebutuhanMoney[xbangunan]);
            foodKota[pilihKota] -= Number(kebutuhanFood[xbangunan]);
            ironKota[pilihKota] -= Number(kebutuhanIron[xbangunan]);
            woodKota[pilihKota] -= Number(kebutuhanWood[xbangunan]);
            workerKota[pilihKota] -= Number(kebutuhanWorker[xbangunan]);
            akhirSemua();
            cekAnim();
         }
      }
      else
      {
         tambahanKata = "";
         adaKurang = 0;
         tambahI = 1;
         i = 1;
         while(i <= 5)
         {
            if(_root["tambahan" + i] != "")
            {
               tambahanKata += String(tambahI + ". " + _root["tambahan" + i]);
               adaKurang++;
               tambahI++;
            }
            i++;
         }
         if(adaKurang == 1)
         {
            i = 1;
            while(i <= 5)
            {
               if(_root["tambahan" + i] != "")
               {
                  tambahanKata = _root["tambahan" + i];
               }
               i++;
            }
         }
         backSalah();
         cekInfo(750,"Không thể xây dựng, còn thiếu: " + tambahanKata);
         pilihBangun = 1;
      }
      stopDrag();
      removeMovieClip(object);
      sedangDrag = false;
   }
}
function clearSemua()
{
   clearInterval(dayDelay);
   i = 0;
   while(i <= panjang)
   {
      j = 0;
      while(j <= lebar)
      {
         ubahDalam("j","i","dalam");
         namaBaru = "rumput_mc" + dalam;
         removeMovieClip(_root[namaBaru]);
         j++;
      }
      i++;
   }
   removeMovieClip(xpeta_mc);
   removeMovieClip(msgBox_mc);
   removeMovieClip(info_mc);
   removeMovieClip(info_mc2);
   removeMovieClip(map_mc);
   removeMovieClip(actions_mc);
   removeMovieClip(dunia_mc);
   removeMovieClip(object_mc);
   removeMovieClip(semua);
   removeMovieClip(options_mc);
   removeMovieClip(tutor);
}
function ubahDalam(j, i, dalam)
{
   if(_root[j] < 10 && _root[i] < 10)
   {
      _root[dalam] = "0" + String(_root[j]) + "0" + String(_root[i]);
   }
   else if(_root[j] < 10 && _root[i] >= 10)
   {
      _root[dalam] = "0" + String(_root[j]) + String(_root[i]);
   }
   else if(_root[j] >= 10 && _root[i] < 10)
   {
      _root[dalam] = String(_root[j]) + "0" + String(_root[i]);
   }
   else
   {
      _root[dalam] = String(_root[j]) + String(_root[i]);
   }
}
stop();
if(sudahTutor == false)
{
   petamaKali = false;
}
if(_root.speedGame == 1)
{
   _root.delayHari = 9000;
}
else if(_root.speedGame == 2)
{
   _root.delayHari = 4000;
}
else if(_root.speedGame == 3)
{
   _root.delayHari = 2000;
}
else if(_root.speedGame == 4)
{
   _root.delayHari = 1000;
}
else if(_root.speedGame == 5)
{
   _root.delayHari = 500;
}
clearSemua2();
backMusic();
sudahKalah = false;
if(petamaKali == false)
{
   petamaKali = true;
}
else
{
   if(tipeWar == "serang")
   {
      if(perangMenang == true)
      {
         xpilihKota = kotaDiserang;
         cekPilihKota(xpilihKota);
         punyaWilayah[kotaDiserang] = jenisKerajaan;
         _root.citySurvivingTroops[kotaDiserang] = 0;
         i = 1;
         while(i <= 4)
         {
            if(i == 1)
            {
               moneyKota[xpilihKota] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 2)
            {
               foodKota[xpilihKota] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 3)
            {
               ironKota[xpilihKota] += Number(_root["bawaBarang" + i]);
            }
            else if(i == 4)
            {
               woodKota[xpilihKota] += Number(_root["bawaBarang" + i]);
            }
            i++;
         }
      }
   }
   else if(tipeWar == "bertahan")
   {
      xpilihKota = xkotaDiserang;
      if(perangMenang == false)
      {
         resetWilayah(xkotaDiserang,tipeMenyerang);
         masihPunya = false;
         i = 1;
         while(i <= 12)
         {
            if(punyaWilayah[i] == jenisKerajaan)
            {
               kotaSekarang = i;
               i = 13;
               masihPunya = true;
            }
            i++;
         }
         if(masihPunya == true)
         {
            xpilihKota = kotaSekarang;
            cekPilihKota(xpilihKota);
         }
         else
         {
            cekGameOver();
         }
      }
   }
   bykWill = 0;
   i = 1;
   while(i <= bykKota)
   {
      if(punyaWilayah[i] == jenisKerajaan)
      {
         bykWill++;
      }
      i++;
   }
   if(bykWill >= 12)
   {
      cekVictory();
   }
}
if(sudahKalah == false)
{
   initSemua();
}
if(sudahTutor == false)
{
   sudahTutor = true;
   buatTutor();
}
_root.onEnterFrame = function()
{
   if(xpause == false)
   {
      xcekInfo();
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
      if(Key.isDown(76) || Key.isDown(115)) {
         if(_root.keyLDown != true) {
            _root.keyLDown = true;
            _root.openLogisticsManager();
         }
      } else {
         _root.keyLDown = false;
      }
   }
};

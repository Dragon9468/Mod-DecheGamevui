const fs = require('fs');
const path = require('path');

console.log('--- Applying Full Game Mechanics Mod (with Worker Migration) ---');

const f129Path = path.join(__dirname, 'decompiled_scripts', 'scripts', 'frame_129', 'DoAction.as');
const f130Path = path.join(__dirname, 'decompiled_scripts', 'scripts', 'frame_130', 'DoAction.as');
const f131Path = path.join(__dirname, 'decompiled_scripts', 'scripts', 'frame_131', 'DoAction.as');

let f129 = fs.readFileSync(f129Path, 'utf8');
let f130 = fs.readFileSync(f130Path, 'utf8');

function replaceOrFail(code, search, replace, name) {
   if (!code.includes(search)) {
      throw new Error(`Replacement "${name}" FAILED: search pattern not found!`);
   }
   console.log(`[OK] Replaced: ${name}`);
   return code.replace(search, replace);
}

// =========================================================================
// PART 1: FRAME 129 MODIFICATIONS
// =========================================================================

// 1.1 Khởi tạo các mảng dữ liệu Mod (Surviving Troops, Logistics, Regional GDP, Neutral Garrison, Worker Migration)
const globalInitCode = `
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
`;

f129 = replaceOrFail(
   f129,
   'function initSemua()\r\n{',
   'function initSemua()\r\n{' + globalInitCode,
   'Global init in initSemua'
);

// 1.2 Độ khó Khó & Cực khó: Debuff nông trại bò (-50% thực: 300 -> 150).
// VƯỜN LÚA (jenisBangunan == 3) VẪN GIỮ NGUYÊN 100% (200 THỰC) VÌ GẮN LIỀN VỚI NƯỚC (LÚA NƯỚC)!
f129 = replaceOrFail(
   f129,
   `               else if(jenisBangunan[i][j][k] == 15)\r
               {\r
                  foodKota[i] += 300 * upgradeProperti[i][j][k];\r
               }`,
   `               else if(jenisBangunan[i][j][k] == 15)\r
               {\r
                  var fAmt15 = 300;\r
                  if(tingkatSulit >= 3 && punyaWilayah[i] == jenisKerajaan)\r
                  {\r
                     fAmt15 = 150;\r
                  }\r
                  foodKota[i] += fAmt15 * upgradeProperti[i][j][k];\r
               }`,
   'Cow Farm food -50% debuff on Hard/Impossible'
);

// 1.3 Độ khó Khó & Cực khó: Chợ bị giảm 50% tiền (100 -> 50)
f129 = replaceOrFail(
   f129,
   `               if(jenisBangunan[i][j][k] == 4)\r
               {\r
                  foodKota[i] -= 50 * upgradeProperti[i][j][k];\r
                  if(foodKota[i] > 0)\r
                  {\r
                     moneyKota[i] += 100 * upgradeProperti[i][j][k];\r
                  }\r
               }`,
   `               if(jenisBangunan[i][j][k] == 4)\r
               {\r
                  foodKota[i] -= 50 * upgradeProperti[i][j][k];\r
                  if(foodKota[i] > 0)\r
                  {\r
                     var mktIncome = 100;\r
                     if(tingkatSulit >= 3 && punyaWilayah[i] == jenisKerajaan)\r
                     {\r
                        mktIncome = 50;\r
                     }\r
                     moneyKota[i] += mktIncome * upgradeProperti[i][j][k];\r
                  }\r
               }`,
   'Market tax -50% debuff on Hard/Impossible'
);

// 1.4 Độ khó Cực khó: Nhà ở tiêu hao thêm 100% lương thực (gấp đôi: 25 -> 50)
f129 = replaceOrFail(
   f129,
   `               else if(jenisBangunan[i][j][k] == 2)\r
               {\r
                  foodKota[i] -= 25 * upgradeProperti[i][j][k];`,
   `               else if(jenisBangunan[i][j][k] == 2)\r
               {\r
                  var houseCons = 25;\r
                  if(tingkatSulit == 4 && punyaWilayah[i] == jenisKerajaan)\r
                  {\r
                     houseCons = 50;\r
                  }\r
                  foodKota[i] -= houseCons * upgradeProperti[i][j][k];`,
   'Residence food 2x consumption on Impossible'
);

// 1.5 Vùng trung lập không tấn công chủ động (bỏ qua lawanNyerang)
f129 = replaceOrFail(
   f129,
   `      if(day == lawanNyerang)\r
      {\r
         if(lawanNyerang2 == lawanNyerang)\r
         {\r
            lawanNyerang2 += random(25) + 25;\r
         }\r
         if(tingkatSulit == 1)\r
         {\r
            lawanNyerang += random(80) + 80;\r
         }\r
         else if(tingkatSulit == 2)\r
         {\r
            lawanNyerang += random(70) + 70;\r
         }\r
         else if(tingkatSulit == 3)\r
         {\r
            lawanNyerang += random(60) + 60;\r
         }\r
         else if(tingkatSulit == 4)\r
         {\r
            lawanNyerang += random(50) + 50;\r
         }\r
         if(lawanNyerang2 == lawanNyerang)\r
         {\r
            lawanNyerang2 += random(25) + 25;\r
         }`,
   `      if(day == lawanNyerang)\r
      {\r
         // MOD: Vung trung lap khong tu tan cong chu dong!\r
         lawanNyerang += 100;`,
   'Neutral barbarian passive defense'
);

// 1.6 Phe máy mở rộng chậm ở độ khó Dễ (lawanNyerang2 tăng thêm delay)
f129 = replaceOrFail(
   f129,
   `         if(tingkatSulit == 1)\r
         {\r
            lawanNyerang2 += random(70) + 70;\r
         }`,
   `         if(tingkatSulit == 1)\r
         {\r
            lawanNyerang2 += random(90) + 90;\r
         }`,
   'AI slower expansion on Easy'
);

// 1.7 Độ khó Dễ & Trung bình trong cekJmlMusuh()
f129 = replaceOrFail(
   f129,
   `   if(tingkatSulit == 1)\r
   {\r
      zjmlMusuh = Math.floor(75 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);\r
   }\r
   else if(tingkatSulit == 2)\r
   {\r
      zjmlMusuh = Math.floor(150 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);\r
   }`,
   `   if(tingkatSulit == 1)\r
   {\r
      if(jenisMenyerang == 1)\r
      {\r
         // De: Vung trung lap suc manh cung, khong tang theo ngay\r
         zjmlMusuh = Math.floor(75 * (zcity2 * persenMusuh));\r
      }\r
      else\r
      {\r
         zjmlMusuh = Math.floor(75 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);\r
      }\r
   }\r
   else if(tingkatSulit == 2)\r
   {\r
      zjmlMusuh = Math.floor(150 * (zcity2 * persenMusuh)) + Math.floor(day / 100 * 25);\r
      if(jenisMenyerang == 1)\r
      {\r
         // Trung binh: Vung trung lap tich luy quan, tang tien suc manh theo ngay\r
         var nAcc = _root.neutralAccumulatedGarrison[kotaDiserang];\r
         if(nAcc == undefined) nAcc = 0;\r
         zjmlMusuh += nAcc + Math.floor(day * 0.4);\r
      }\r
   }`,
   'Neutral power scaling in cekJmlMusuh'
);

// Kế thừa quân số địch còn sống trong cekJmlMusuh()
f129 = replaceOrFail(
   f129,
   `   else if(jenisMenyerang == 2)\r
   {\r
      zjmlMusuh = Math.floor(zjmlMusuh / 7.5);\r
   }\r
}`,
   `   else if(jenisMenyerang == 2)\r
   {\r
      zjmlMusuh = Math.floor(zjmlMusuh / 7.5);\r
   }\r
   if(tipeWar == "serang" && _root.citySurvivingTroops[kotaDiserang] != undefined && _root.citySurvivingTroops[kotaDiserang] > 0)\r
   {\r
      zjmlMusuh = Math.max(1, Math.floor(_root.citySurvivingTroops[kotaDiserang] / 10));\r
   }\r
}`,
   'Surviving enemy troops in cekJmlMusuh'
);

// 1.8 Khi đánh thắng và chiếm thành: Reset surviving troops của thành đó
f129 = replaceOrFail(
   f129,
   `         punyaWilayah[kotaDiserang] = jenisKerajaan;\r
         i = 1;`,
   `         punyaWilayah[kotaDiserang] = jenisKerajaan;\r
         _root.citySurvivingTroops[kotaDiserang] = 0;\r
         i = 1;`,
   'Reset surviving troops on city conquered'
);

// 1.9 Xuất khẩu debuff: Khó giảm 20% tiền, Cực khó giảm 50% tiền
f129 = replaceOrFail(
   f129,
   `   actions.xafter = String(Number(actions.hargaJual) + Number(_root.moneyKota[_root.pilihKota]));\r
   actions.after = "$" + actions.xafter;`,
   `   if(tingkatSulit == 3)\r
   {\r
      actions.hargaJual = Math.floor(actions.hargaJual * 0.8);\r
   }\r
   else if(tingkatSulit == 4)\r
   {\r
      actions.hargaJual = Math.floor(actions.hargaJual * 0.5);\r
   }\r
   actions.xafter = String(Number(actions.hargaJual) + Number(_root.moneyKota[_root.pilihKota]));\r
   actions.after = "$" + actions.xafter;`,
   'Export price penalty on Hard/Impossible'
);

// 1.10 Nhập khẩu: Cực khó không thể nhập khẩu
f129 = replaceOrFail(
   f129,
   `function klikImport()\r
{`,
   `function klikImport()\r
{\r
   if(tingkatSulit == 4)\r
   {\r
      cekInfo(2000,"Impossible difficulty: Foreign imports are completely prohibited!");\r
      return;\r
   }`,
   'Import forbidden on Impossible'
);

// 1.11 Daily Logistics Engine (Commodities) + Worker/Population Migration Engine + Net GDP inside dayItung()
const logisticsDailyEngine = `
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
`;

f129 = replaceOrFail(
   f129,
   '      akhirSemua();\r\n      if(day == lawanNyerang)',
   logisticsDailyEngine + '\r\n      akhirSemua();\r\n      if(day == lawanNyerang)',
   'Logistics and Worker engine in dayItung'
);

// 1.12 Cập nhật tiêu đề thành phố và Tooltip bản đồ hiển thị GDP
f129 = replaceOrFail(
   f129,
   '   map.city = namaKota[pilihKota];',
   `   var _curG = _root.gdpKota[pilihKota];
   if(_curG == undefined) _curG = 0;
   var _curGStr = (_curG >= 0 ? "+$" : "-$") + Math.abs(_curG);
   map.city = namaKota[pilihKota] + " [GDP: " + _curGStr + "]";`,
   'Map city title with GDP'
);

f129 = replaceOrFail(
   f129,
   `         if(overMana == 6)\r
         {\r
            this.judul = namaKota[pilihButton];\r
            this.isi = "(Press here to go to this city)";`,
   `         if(overMana == 6)\r
         {\r
            var _gVal = _root.gdpKota[pilihButton];\r
            if(_gVal == undefined) _gVal = 0;
            var _gSign = (_gVal >= 0 ? "+$" : "-$") + Math.abs(_gVal);\r
            this.judul = namaKota[pilihButton] + " [Trade GDP: " + _gSign + "]";\r
            this.isi = "Daily Exports: $" + _root.exportGdpKota[pilihButton] + " | Imports: $" + _root.importGdpKota[pilihButton] + "\\n(Click to travel | Press 'L' for Logistics routes)";`,
   'Map hover tooltip with GDP'
);

// 1.13 Hiển thị GDP tag trên World Map (dunia_mc)
f129 = replaceOrFail(
   f129,
   `      if(punyaWilayah[i] == 1)\r
      {\r
         dunia["daerah" + i].gotoAndStop(4);\r
      }\r
      else if(punyaWilayah[i] == 2)\r
      {\r
         dunia["daerah" + i].gotoAndStop(3);\r
      }\r
      else if(punyaWilayah[i] == 0)\r
      {\r
         dunia["daerah" + i].gotoAndStop(1);\r
      }`,
   `      if(punyaWilayah[i] == 1)\r
      {\r
         dunia["daerah" + i].gotoAndStop(4);\r
      }\r
      else if(punyaWilayah[i] == 2)\r
      {\r
         dunia["daerah" + i].gotoAndStop(3);\r
      }\r
      else if(punyaWilayah[i] == 0)\r
      {\r
         dunia["daerah" + i].gotoAndStop(1);\r
      }\r
      if(punyaWilayah[i] == jenisKerajaan)\r
      {\r
         var _gdpV = _root.gdpKota[i];\r
         if(_gdpV == undefined) _gdpV = 0;\r
         var _gdpS = (_gdpV >= 0 ? "+$" : "-$") + Math.abs(_gdpV);\r
         dunia.createTextField("gdp_lbl_" + i, 8500 + i, dunia["daerah" + i]._x - 24, dunia["daerah" + i]._y - 8, 65, 18);\r
         var _gtf = dunia["gdp_lbl_" + i];\r
         _gtf.selectable = false;\r
         var _gtfFmt = new TextFormat();\r
         _gtfFmt.font = "Arial";\r
         _gtfFmt.size = 11;\r
         _gtfFmt.bold = true;\r
         _gtfFmt.color = (_gdpV >= 0 ? 0x22EE22 : 0xFF4444);\r
         _gtf.setNewTextFormat(_gtfFmt);\r
         _gtf.text = _gdpS;\r
      }`,
   'World map GDP text label'
);

// 1.14 Tạo giao diện Logistics Manager (Hỗ trợ 2 Tab: Tài nguyên & Điều phối Dân số)
const logisticsManagerCode = `
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
      p.title_tf.text = "REGIONAL LOGISTICS & POPULATION NETWORK";
      
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
      p.city_info.text = "Origin City: " + _root.namaKota[curC] + " (Workers: " + _root.workerKota[curC] + ")";
      
      // Navigation buttons to cycle origin city
      p.createBtn("btn_prev_city", 4, 380, 32, 95, 22, "< Prev City", 0x223355, 0x5588CC, function() {
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
      p.createBtn("btn_next_city", 5, 485, 32, 95, 22, "Next City >", 0x223355, 0x5588CC, function() {
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
      
      p.createBtn("tab_goods", 6, 15, 60, 280, 26, "[1] COMMODITY LOGISTICS (1 Good/Region)", tab1Bg, tab1Border, function() {
         _root.logisticsTab = 1;
         _root.renderLogisticsUI();
      });
      p.createBtn("tab_workers", 7, 305, 60, 280, 26, "[2] WORKER / POPULATION MIGRATION", tab2Bg, tab2Border, function() {
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
         p.sec1_tf.text = "CHOSEN EXPORT RESOURCE (1 commodity per region):";
         
         var resNames = new Array("None", "Food", "Iron", "Wood", "Pearl", "Coal", "Oil", "Steel", "Money");
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
         p.sec2_tf.text = "DESTINATION REGIONS (Daily automatic deliveries):";
         
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
               p["amt_lbl_" + dIdx].text = sendAmt + " /day";
               
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
               p.createBtn("btn_clr_" + dIdx, cDepth++, 480, rowY, 55, 20, "Clear", 0x4A2424, 0x984848, function() {
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
            p.no_target_tf.text = "You do not own any other cities yet. Conquer neighboring territories to establish trade!";
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
         p.summary_tf.text = "DAILY TRADE: Sending " + totalDailySending + " " + resNames[curRes] + "/day | Export: $" + curExp + " | Import: $" + curImp + "\\nNET REGIONAL TRADE GDP: " + (curGdpVal >= 0 ? "+$" : "-$") + Math.abs(curGdpVal) + " /day";
      }
      // =====================================================================
      // TAB 2: WORKER / POPULATION MIGRATION
      // =====================================================================
      else
      {
         p.createTextField("wsec_tf", 8, 15, 96, 570, 20);
         p.wsec_tf.setNewTextFormat(sFmt);
         p.wsec_tf.text = "POPULATION MIGRATION (Independent from goods limit - reinforce frontline/low-land cities):";
         
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
               p["wdst_lbl_" + dIdx].text = dIdx + ". " + _root.namaKota[dIdx] + " (Workers: " + _root.workerKota[dIdx] + ")";
               
               p.createTextField("wamt_lbl_" + dIdx, cDepth++, 205, rowY + 2, 100, 20);
               var aFmt = new TextFormat();
               aFmt.font = "Arial";
               aFmt.size = 11;
               aFmt.bold = true;
               aFmt.color = (wAmt > 0 ? 0x55FF99 : 0x888888);
               p["wamt_lbl_" + dIdx].setNewTextFormat(aFmt);
               p["wamt_lbl_" + dIdx].text = wAmt + " citizens/day";
               
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
            p.no_target_tf.text = "You do not own any other cities yet. Conquer neighboring territories to migrate population!";
         }
         
         p.lineStyle(1, 0x334466, 100);
         p.moveTo(15, 368); p.lineTo(585, 368);
         
         p.createTextField("summary_tf", cDepth++, 20, 374, 450, 42);
         var sumFmt = new TextFormat();
         sumFmt.font = "Arial";
         sumFmt.size = 11;
         sumFmt.color = 0xDDDDDD;
         p.summary_tf.setNewTextFormat(sumFmt);
         p.summary_tf.text = "DAILY MIGRATION: Sending " + totalWorkersMoving + " citizens/day from " + _root.namaKota[curC] + "\\nCitizens can be recruited into troops or work in buildings in recipient cities.";
      }
      
      // Bottom DONE button
      p.createBtn("btn_done", cDepth++, 490, 376, 90, 30, "DONE", 0x1E5B2E, 0x44AA55, function() {
         _root.openLogisticsManager();
      });
   };
   
   _root.renderLogisticsUI();
};
`;

f129 = replaceOrFail(
   f129,
   'function klikActions()\r\n{',
   logisticsManagerCode + '\r\nfunction klikActions()\r\n{',
   'Logistics Manager UI code'
);

// Bổ sung hotkey 'L' (76) và 'F4' (115) vào onEnterFrame
f129 = replaceOrFail(
   f129,
   `      if(Key.isDown(114)) {\r\n         _root.delayHari = 300;\r\n         clearInterval(_root.dayDelay);\r\n         _root.dayDelay = setInterval(_root.dayItung, _root.delayHari);\r\n      }`,
   `      if(Key.isDown(114)) {\r\n         _root.delayHari = 300;\r\n         clearInterval(_root.dayDelay);\r\n         _root.dayDelay = setInterval(_root.dayItung, _root.delayHari);\r\n      }\r\n      if(Key.isDown(76) || Key.isDown(115)) {\r\n         if(_root.keyLDown != true) {\r\n            _root.keyLDown = true;\r\n            _root.openLogisticsManager();\r\n         }\r\n      } else {\r\n         _root.keyLDown = false;\r\n      }`,
   'Hotkey L and F4 for Logistics Manager'
);


// =========================================================================
// PART 2: FRAME 130 & 131 MODIFICATIONS (ENEMY WAR ATTRITION ON LOSS)
// =========================================================================

// 2.1 Spawning quân địch: Nếu có surviving troops từ trận trước thì dùng quân còn lại
f130 = replaceOrFail(
   f130,
   '   soldier2.nyawa = zjmlMusuh + Math.floor(random(zjmlMusuh / 2));',
   `   if(_root.citySurvivingTroops[_root.kotaDiserang] != undefined && _root.citySurvivingTroops[_root.kotaDiserang] > 0 && _root.tipeWar == "serang")
   {
      soldier2.nyawa = Math.max(1, Math.floor(_root.citySurvivingTroops[_root.kotaDiserang] / 10));
   }
   else
   {
      soldier2.nyawa = zjmlMusuh + Math.floor(random(zjmlMusuh / 2));
   }`,
   'Enemy battalion spawn with surviving troops in frame_130'
);

// 2.2 Sửa bug tính tổng quân địch còn sống và trừ hao lực lượng địch khi ta đánh thua
f130 = replaceOrFail(
   f130,
   `   xxjmlSisa2 = 0;\r
   i = 1;\r
   while(i <= 10)\r
   {\r
      if(_root["soldier2_mc" + i].nyawa <= 0 || isNaN(_root["soldier2_mc" + i].nyawa) || _root["soldier2_mc" + i].nyawa == undefined)\r
      {\r
         xxjmlSisa2 = 0;\r
      }\r
      else\r
      {\r
         xxjmlSisa2 = _root["soldier2_mc" + i].nyawa;\r
      }\r
      xxjmlSisa2 += Math.floor(_root["soldier2_mc" + i].nyawa);\r
      i++;\r
   }\r
   end.musuh = Math.floor(xxjmlPasukan2 - xxjmlSisa2);`,
   `   var _totalEnemyAlive = 0;\r
   i = 1;\r
   while(i <= 10)\r
   {\r
      var _eNyawa = _root["soldier2_mc" + i].nyawa;\r
      if(_eNyawa != undefined && !isNaN(_eNyawa) && _eNyawa > 0)\r
      {\r
         _totalEnemyAlive += Math.floor(_eNyawa);\r
      }\r
      i++;\r
   }\r
   var _actualEnemyLosses = Math.max(0, Math.floor(xxjmlPasukan2 - _totalEnemyAlive));\r
   end.musuh = _actualEnemyLosses;\r
   \r
   if(indi == "menang")\r
   {\r
      _root.citySurvivingTroops[_root.kotaDiserang] = 0;\r
   }\r
   else if(indi == "kalah")\r
   {\r
      if(_root.tipeWar == "serang")\r
      {\r
         _root.citySurvivingTroops[_root.kotaDiserang] = Math.max(1, _totalEnemyAlive);\r
      }\r
   }`,
   'Enemy war attrition calculation on loss in frame_130'
);

// Ghi lại file đã chỉnh sửa
fs.writeFileSync(f129Path, f129, 'utf8');
fs.writeFileSync(f130Path, f130, 'utf8');
fs.writeFileSync(f131Path, f130, 'utf8');

console.log('Successfully written updated frame_129, frame_130, and frame_131!');
console.log('New frame_129 length:', f129.length);
console.log('New frame_130 length:', f130.length);

function initData()
{
   msgBox_mc._visible = false;
   msgBox_mc.bar._visible = false;
   quit_btn.enabled = true;
   wi = 0;
   while(wi <= 9)
   {
      xloadData(wi);
      if(cnamaData == undefined)
      {
         cnamaData = "Empty";
      }
      _root["data" + wi].data = cnamaData;
      _root["data" + wi].onRollOver = overData;
      _root["data" + wi].onRollOut = outData;
      _root["data" + wi].onRelease = klikData;
      wi++;
   }
}
function overData()
{
   over();
   kata = new String(this);
   indi = Number(kata.substr(kata.length - 1,1));
   xloadData(indi);
   cekData();
   if(vday == "-")
   {
      this.gotoAndStop(2);
   }
   else
   {
      this.gotoAndStop(3);
   }
}
function cekData()
{
   if(cday == undefined)
   {
      vday = "-";
   }
   else
   {
      vday = cday;
   }
   if(cjenisKerajaan == undefined)
   {
      vjenisKerajaan = "-";
   }
   else if(cjenisKerajaan == 1)
   {
      vjenisKerajaan = "Zargas";
   }
   else
   {
      vjenisKerajaan = "Artavera";
   }
   if(ctingkatSulit == undefined)
   {
      vtingkatSulit = "-";
   }
   else if(ctingkatSulit == 1)
   {
      vtingkatSulit = "Dễ";
   }
   else if(ctingkatSulit == 2)
   {
      vtingkatSulit = "Trung bình";
   }
   else if(ctingkatSulit == 3)
   {
      vtingkatSulit = "Khó";
   }
   else if(ctingkatSulit == 4)
   {
      vtingkatSulit = "Cực khó";
   }
   if(cxpilihKota == undefined)
   {
      vxpilihKota = "-";
   }
   else
   {
      vxpilihKota = namaKota[cxpilihKota];
   }
   if(cxpilihMap == undefined)
   {
      vxpilihMap = "-";
   }
   else
   {
      vxpilihMap = cxpilihMap;
   }
   if(cspeedGame == undefined)
   {
      vspeedGame = "-";
   }
   else if(cspeedGame == 1)
   {
      vspeedGame = "CHẬM";
   }
   else if(cspeedGame == 2)
   {
      vspeedGame = "BÌNH THƯỜNG";
   }
   else if(cspeedGame == 3)
   {
      vspeedGame = "NHANH";
   }
}
function outData()
{
   this.gotoAndStop(1);
   vday = "-";
   vjenisKerajaan = "-";
   vtingkatSulit = "-";
   vxpilihKota = "-";
   vxpilihMap = "-";
   vspeedGame = "-";
}
function outData2()
{
   vday = "-";
   vjenisKerajaan = "-";
   vtingkatSulit = "-";
   vxpilihKota = "-";
   vxpilihMap = "-";
   vspeedGame = "-";
}
function klikData()
{
   klik();
   kata = new String(this);
   zindi = Number(kata.substr(kata.length - 1,1));
   if(xjenisData == "save")
   {
      wi = 0;
      while(wi <= 9)
      {
         delete _root["data" + wi].onRollOver;
         delete _root["data" + wi].onRollOut;
         delete _root["data" + wi].onRelease;
         wi++;
      }
      quit_btn.enabled = false;
      msgBox_mc._visible = true;
      msgBox_mc.gotoAndStop(1);
      msgBox_mc.dataName = _root["data" + zindi].data;
      msgBox_mc.ok_btn._visible = true;
      msgBox_mc.cancel_btn._visible = true;
      msgBox_mc.bar._visible = false;
      Selection.setFocus(msgBox_mc.nama);
      msgBox_mc.cancel_btn.onRollOver = msgBox_mc.ok_btn.onRollOver = function()
      {
         over();
      };
      msgBox_mc.cancel_btn.onRelease = function()
      {
         klik();
         initData();
      };
      msgBox_mc.ok_btn.onRelease = function()
      {
         klik();
         msgBox_mc.ok_btn._visible = false;
         msgBox_mc.cancel_btn._visible = false;
         msgBox_mc.bar._visible = true;
         msgBox_mc.bar.tipe = "Đang lưu..";
         namaData = msgBox_mc.dataName;
         simpanData(zindi);
      };
   }
   else if(xjenisData == "load")
   {
      if(this._currentframe == 3)
      {
         wi = 0;
         while(wi <= 9)
         {
            delete _root["data" + wi].onRollOver;
            delete _root["data" + wi].onRollOut;
            delete _root["data" + wi].onRelease;
            wi++;
         }
         quit_btn.enabled = false;
         msgBox_mc._visible = true;
         msgBox_mc.gotoAndStop(2);
         msgBox_mc.ok_btn._visible = false;
         msgBox_mc.cancel_btn._visible = false;
         msgBox_mc.bar._visible = true;
         msgBox_mc.bar.tipe = "Đang tải..";
         initBangun();
         simpanBangun();
         ygDiSave();
         loadData(zindi);
      }
   }
   this.gotoAndStop(1);
}
stop();
namaKota = new Array("","Arigal","Bibaluz","Carex","Deresium","Eradite","Fargaz","Gigelium","Haze","Istanada","Jerax","Konselium","Liures");
outData2();
initData();
if(xjenisData == "save")
{
   saveload.gotoAndStop(2);
   jenis_mc.gotoAndStop(1);
   quit_btn.enabled = true;
   quit_btn.onRollOver = function()
   {
      over();
   };
   quit_btn.onRelease = function()
   {
      klik();
      if(posMain == "awal")
      {
         gotoAndStop("menu");
      }
      else
      {
         gotoAndStop(129);
      }
   };
}
else if(xjenisData == "load")
{
   saveload.gotoAndStop(1);
   jenis_mc.gotoAndStop(2);
   quit_btn.enabled = true;
   quit_btn.onRollOver = function()
   {
      over();
   };
   quit_btn.onRelease = function()
   {
      klik();
      if(posMain == "awal")
      {
         gotoAndStop("menu");
      }
      else
      {
         gotoAndStop(129);
      }
   };
}

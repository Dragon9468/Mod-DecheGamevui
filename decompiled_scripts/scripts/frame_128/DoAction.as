function cekLanjut()
{
   delete daerah1.onRelease;
   delete daerah1.onRollOver;
   delete daerah1.onRollOut;
   delete daerah9.onRelease;
   delete daerah9.onRollOver;
   delete daerah9.onRollOut;
   select_mc._visible = true;
   select_mc.gotoAndStop(2);
   select_mc.xleft = 50;
   i = 1;
   while(i <= 4)
   {
      select_mc["level" + i] = 10;
      select_mc["kiri" + i].onRelease = xklikKiri;
      select_mc["kanan" + i].onRelease = xklikKanan;
      i++;
   }
   select_mc.ok_btn.onRelease = function()
   {
      i = 1;
      while(i <= 4)
      {
         _root["jenisBonus" + i] = Number(select_mc["level" + i]);
         i++;
      }
      select_mc.gotoAndStop(3);
      select_mc.easy_btn.onRelease = function()
      {
         mulaiSaja();
         tingkatSulit = 1;
      };
      select_mc.normal_btn.onRelease = function()
      {
         mulaiSaja();
         tingkatSulit = 2;
      };
      select_mc.hard_btn.onRelease = function()
      {
         mulaiSaja();
         tingkatSulit = 3;
      };
      select_mc.impossible_btn.onRelease = function()
      {
         mulaiSaja();
         tingkatSulit = 4;
      };
   };
   select_mc.random_btn.onRelease = function()
   {
      select_mc.xleft = 50;
      i = 1;
      while(i <= 4)
      {
         select_mc["level" + i] = 10;
         i++;
      }
      i = 1;
      while(i <= 50)
      {
         rand = random(4) + 1;
         select_mc["level" + rand]++;
         select_mc.xleft--;
         i++;
      }
   };
}
function mulaiSaja()
{
   initBangun();
   simpanBangun();
   ygDiSave();
   gotoAndStop(129);
}
function xklikKiri()
{
   myStr = new String(this);
   indi = Number(myStr.substr(myStr.length - 1,1));
   if(select_mc["level" + indi] <= 5)
   {
      select_mc["level" + indi] = 5;
   }
   else
   {
      select_mc["level" + indi]--;
      select_mc.xleft = select_mc.xleft + 1;
   }
}
function xklikKanan()
{
   myStr = new String(this);
   indi = Number(myStr.substr(myStr.length - 1,1));
   if(select_mc.xleft <= 0)
   {
      select_mc.xleft = 0;
   }
   else
   {
      select_mc["level" + indi]++;
      select_mc.xleft--;
   }
}
stop();
indo = "Select your empire:";
back_btn.onRelease = function()
{
   gotoAndStop("menu");
};
istana1.gotoAndStop(1);
istana9.gotoAndStop(2);
select_mc._visible = true;
select_mc.gotoAndStop(1);
select_mc.ok_btn.onRelease = function()
{
   select_mc._visible = false;
   daerah1.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   daerah1.onRollOut = function()
   {
      this.gotoAndStop(1);
   };
   daerah1.onRelease = function()
   {
      indo = "Your selected empire";
      jenisKerajaan = 1;
      jenisMusuh = 2;
      xpilihKota = 1;
      xpilihMap = 1;
      this.gotoAndStop(2);
      empire1._visible = false;
      cekLanjut();
   };
   daerah9.onRollOver = function()
   {
      this.gotoAndStop(2);
   };
   daerah9.onRollOut = function()
   {
      this.gotoAndStop(1);
   };
   daerah9.onRelease = function()
   {
      indo = "Your selected empire";
      jenisKerajaan = 2;
      jenisMusuh = 1;
      xpilihKota = 9;
      xpilihMap = 2;
      this.gotoAndStop(2);
      empire2._visible = false;
      cekLanjut();
   };
};

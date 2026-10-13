function cekSpeedQuality()
{
   i = 1;
   while(i <= 5)
   {
      this["speed" + i].angka = i;
      this["quality" + i].angka = i;
      this["speed" + i].gotoAndStop(1);
      this["quality" + i].gotoAndStop(1);
      this["speed" + i].onRelease = klikSpeed;
      this["quality" + i].onRelease = klikQuality;
      i++;
   }
   this["speed" + _root.speedGame].gotoAndStop(2);
   this["quality" + _root.qualityGame].gotoAndStop(2);
}
function klikSpeed()
{
   indi = new String(this);
   _root.speedGame = Number(indi.substr(indi.length - 1,1));
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
   cekSpeedQuality();
}
function klikQuality()
{
   indi = new String(this);
   _root.qualityGame = Number(indi.substr(indi.length - 1,1));
   if(_root.qualityGame == 1)
   {
      _quality = "HIGH";
   }
   else if(_root.qualityGame == 2)
   {
      _quality = "MEDIUM";
   }
   else if(_root.qualityGame == 3)
   {
      _quality = "LOW";
   }
   cekSpeedQuality();
}
stop();
bar1_mc.bar_mc._x = Math.ceil(_root.volum1 / 0.43478260869565216 - 115);
bar1_mc.bar_mc.onEnterFrame = function()
{
   _root.volum1 = int(0.43478260869565216 * (this._x + 115));
   _root.myMusic.setVolume(_root.volum1);
   bar1_mc.persen1 = _root.volum1 + " %";
};
bar1_mc.indi_mc.onPress = function()
{
   klik();
   startDrag(bar1_mc.bar_mc,1,-115,0,115,0);
};
bar1_mc.bar_mc.onRollOver = function()
{
   over();
};
bar1_mc.indi_mc.onRelease = bar1_mc.indi_mc.onReleaseOutside = function()
{
   over();
   stopDrag();
};
bar2_mc.bar_mc._x = Math.ceil(_root.volum2 / 0.43478260869565216 - 115);
bar2_mc.bar_mc.onEnterFrame = function()
{
   _root.volum2 = int(0.43478260869565216 * (this._x + 115));
   _root.volum3 = int(0.43478260869565216 * (this._x + 115));
   _root.mySound.setVolume(_root.volum2);
   _root.mySound2.setVolume(_root.volum3);
   bar2_mc.persen2 = _root.volum2 + " %";
};
bar2_mc.indi_mc.onPress = function()
{
   klik();
   startDrag(bar2_mc.bar_mc,1,-115,0,115,0);
};
bar2_mc.bar_mc.onRollOver = function()
{
   over();
};
bar2_mc.indi_mc.onRelease = bar2_mc.indi_mc.onReleaseOutside = function()
{
   over();
   stopDrag();
};
cekSpeedQuality();

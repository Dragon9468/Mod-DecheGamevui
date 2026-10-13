stop();
Stage.showMenu = false;
fscommand("fullscreen",false);
fscommand("allowscale",false);
fscommand("showmenu",false);
loader.onEnterFrame = function()
{
   this._xscale = _root.getBytesLoaded() / _root.getBytesTotal() * 100;
   if(this._xscale == 100)
   {
      delete loader.onEnterFrame;
      gotoAndStop("completed");
   }
};

stop();
_root.onMouseDown = function()
{
   delete _root.onMouseDown;
   gotoAndStop("menu");
};

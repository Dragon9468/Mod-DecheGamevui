stop();
back_btn.onRelease = function()
{
   _root.gotoAndStop(_root._currentframe - 1);
};
close_btn.onRelease = function()
{
   gotoAndStop("menu");
};
next_btn.onRelease = function()
{
   _root.gotoAndStop(_root._currentframe + 1);
};

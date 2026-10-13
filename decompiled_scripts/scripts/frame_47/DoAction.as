stop();
new_btn.onRollOver = load_btn.onRollOver = back_btn.onRollOver = help_btn.onRollOver = credits_btn.onRollOver = options_btn.onRollOver = demo_btn.onRollOver = more_btn.onRollOver = gaming_btn.onRollOver = function()
{
   over();
};
new_btn.onRelease = function()
{
   klik();
   gotoAndStop(128);
};
load_btn.onRelease = function()
{
   klik();
   xjenisData = "load";
   posMain = "awal";
   gotoAndStop("load");
};
back_btn.onRelease = function()
{
   klik();
   gotoAndStop("utama");
};
help_btn.onRelease = function()
{
   klik();
   gotoAndStop("help");
};
credits_btn.onRelease = function()
{
   klik();
   gotoAndStop("credits");
};
options_btn.onRelease = function()
{
   klik();
   gotoAndStop("options");
};
demo_btn.onRelease = function()
{
   klik();
   gotoAndStop(131);
};
more_btn.onRelease = function()
{
   klik();
   getUrl("http://www.maxgames.com", "_blank");
};

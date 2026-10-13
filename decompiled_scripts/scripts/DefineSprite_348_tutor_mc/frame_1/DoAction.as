stop();
next_btn.onRelease = function()
{
   _root.tutor.gotoAndStop(_root.tutor._currentframe + 1);
};
back_btn.onRelease = function()
{
   _root.tutor.gotoAndStop(_root.tutor._currentframe - 1);
};
skip_btn.onRelease = function()
{
   _root.skipTutor();
};

;Moves the active window from one monitor to the other. Similar to JumpWin.exe, but that stopped working for me for some reason.
;Based on Thalon's code at http://www.autohotkey.com/forum/topic19440.html  [Jon Aquino 2008-09-17]
+#x::    ;Default hotkey is Ctrl+Alt+Q
activeWindow := WinActive("A")
if activeWindow = 0
{
    return
}
WinGet, minMax, MinMax, ahk_id %activeWindow%
if minMax = 1
{
    WinRestore, ahk_id %activeWindow%
}
SwapMon(activeWindow)
if minMax = 1
{
    WinMaximize, ahk_id %activeWindow%
}
WinActivate ahk_id %activeWindow%   ;Needed - otherwise another window may overlap it
return

SwapMon(WinID) ; Swaps window with and ID of WinID onto the other monitor
{
  SysGet, Mon1, Monitor, 1
  SysGet, Mon2, Monitor, 2
  WinGetPos, WinX, WinY, WinWidth, , ahk_id %WinID%

  WinCenter := WinX + (WinWidth / 2) ; Determines which monitor this is on by the position of the center pixel.
  if (WinCenter > Mon1Left and WinCenter < Mon1Right) {
    WinX := Mon2Left + (WinX - Mon1Left)
  } else if (WinCenter > Mon2Left and WinCenter < Mon2Right) {
    WinX := Mon1Left + (WinX - Mon2Left)
  }

  WinMove, ahk_id %WinID%, , %WinX%, %WinY%
  return
}
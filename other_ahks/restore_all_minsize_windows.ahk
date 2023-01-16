+#r::
WinGet, WinArray, List
Loop, %WinArray%
{
  WinID := WinArray%A_Index%
  WinGet, IsMin, MinMax, ahk_id %WinID%
  if (IsMin = -1) {
    WinRestore, ahk_id %WinID%
  }
}
return

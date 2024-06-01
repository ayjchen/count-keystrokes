#Persistent
#SingleInstance, Force

; Initialize key count object
keyCounts := {}

; Define file path
filePath := "key_counts.txt"

; Load existing key counts from the file
if (FileExist(filePath)) {
    Loop, Read, %filePath%
    {
        StringSplit, parts, A_LoopReadLine, `: , *`,
        key := parts1
        count := parts2
        StringTrimLeft, count, count, 1  ; Trim extra whitespace
        keyCounts[key] := count
    }
}

; Set timer to save key counts to file every 60 seconds
SetTimer, SaveKeyCountsToFile, 60000


; Count every keystroke (TKL keys activated)
~*a::
~*b::
~*c::
~*d::
~*e::
~*f::
~*g::
~*h::
~*i::
~*j::
~*k::
~*l::
~*m::
~*n::
~*o::
~*p::
~*q::
~*r::
~*s::
~*t::
~*u::
~*v::
~*w::
~*x::
~*y::
~*z::
~*1::
~*2::
~*3::
~*4::
~*5::
~*6::
~*7::
~*8::
~*9::
~*0::
~*-::
~*=::
~*[::
~*]::
~*\::
~*;::
~*'::
~*,::
~*.::
~*/::
~*`::
~*Space::
~*Enter::
~*Backspace::
~*Tab::
~*CapsLock::
~*LShift::
~*RShift::
~*LCtrl::
~*RCtrl::
~*LAlt::
~*RAlt::
~*Escape::
~*Up::
~*Down::
~*Left::
~*Right::
~*F1::
~*F2::
~*F3::
~*F4::
~*F5::
~*F6::
~*F7::
~*F8::
~*F9::
~*F10::
~*F11::
~*F12::
~*LWin::
~*RWin::
~*AppsKey::
~*PrintScreen::
~*ScrollLock::
~*Pause::
~*Insert::
~*Delete::
~*Home::
~*End::
~*PgUp::
~*PgDn::
; ~*Numpad0::
; ~*Numpad1::
; ~*Numpad2::
; ~*Numpad3::
; ~*Numpad4::
; ~*Numpad5::
; ~*Numpad6::
; ~*Numpad7::
; ~*Numpad8::
; ~*Numpad9::
; ~*NumpadDot::
; ~*NumpadDiv::
; ~*NumpadMult::
; ~*NumpadSub::
; ~*NumpadAdd::
; ~*NumpadEnter::
; ~*NumpadIns::
; ~*NumpadEnd::
; ~*NumpadDown::
; ~*NumpadPgDn::
; ~*NumpadLeft::
; ~*NumpadClear::
; ~*NumpadRight::
; ~*NumpadHome::
; ~*NumpadUp::
; ~*NumpadPgUp::
; ~*NumpadDel::
; ~*NumpadDiv::
; ~*NumpadMult::
; ~*NumpadSub::
; ~*NumpadAdd::
; ~*NumpadEnter::
; ~*NumpadIns::
; ~*NumpadEnd::
; ~*NumpadDown::
; ~*NumpadPgDn::
; ~*NumpadLeft::
; ~*NumpadClear::
; ~*NumpadRight::
; ~*NumpadHome::
; ~*NumpadUp::
; ~*NumpadPgUp::
; ~*NumpadDel::
; ~*NumpadDot::
; ~*LButton::
; ~*RButton::
; ~*MButton::
; ~*XButton1::
; ~*XButton2::
; ~*WheelUp::
; ~*WheelDown::
; ~*WheelLeft::
; ~*WheelRight::
{
    ; Get the name of the key
    keyName := A_ThisHotkey
    StringTrimLeft, keyName, keyName, 2  ; Remove the key prefix (~*) from the key name

    ; Increment the count for this key
    if (!keyCounts.HasKey(keyName)) {
        keyCounts[keyName] := 0
    }
    keyCounts[keyName]++

    return
}

SaveKeyCountsToFile:
{
    ; Create file for writing
    file := FileOpen(filePath, "w")
    if (!file) {
        MsgBox, Error opening file for writing!
        return
    }

    ; Write key counts to file
    for key, count in keyCounts {
        file.WriteLine(key ": " count)
    }

    ; Close file
    file.Close()

    return
}


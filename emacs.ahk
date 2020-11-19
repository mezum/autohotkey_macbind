; MIT License
; Copyright (c) Kosaki Mezumona
#InstallKeybdHook
#UseHook
SetKeyDelay 0

IsIgnoredWindow() {
	if (WinActive("ahk_exe Code.exe"))
		return True
	if (WinActive("ahk_exe blender.exe"))
		return True
	return False
}

global is_marker_placed:=False

SetMark() {
	is_marker_placed:=!is_marker_placed
}
EraseMark() {
	is_marker_placed:=False
}

global is_keyx_enabled:=False

EnableKeyX() {
	is_keyx_enabled:=True
}

DisableKeyX() {
	is_keyx_enabled:=False
}

IsKeyXEnabled() {
	return is_keyx_enabled
}

Preprocess() {
	if (is_marker_placed) {
		Send {Shift down}
	}
	else {
		Send {Shift up}
	}
}

Postprocess() {
	Send {Shift up}
}

^vk20::
	if (IsIgnoredWindow()) {
		Send ^{vk20}
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	SetMark()
	return

^x::
	if (IsIgnoredWindow()) {
		Send ^x
		return
	}
	if (!IsKeyXEnabled()) {
		EnableKeyX()
	}
	else {
		DisableKeyX()
	}
	EraseMark()
	Preprocess()
	Postprocess()
	return

^f::
	if (IsIgnoredWindow()) {
		Send ^f
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {Right}
	Postprocess()
	return

^b::
	if (IsIgnoredWindow()) {
		Send ^b
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {Left}
	Postprocess()
	return

^n::
	if (IsIgnoredWindow()) {
		Send ^n
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {Down}
	Postprocess()
	return

^p::
	if (IsIgnoredWindow()) {
		Send ^p
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {Up}
	Postprocess()
	return

^v::
	if (IsIgnoredWindow()) {
		Send ^v
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {PgDn}
	Postprocess()
	return

!v::
	if (IsIgnoredWindow()) {
		Send !v
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {PgUp}
	Postprocess()
	return

+!vkbc::
	if (IsIgnoredWindow()) {
		Send +!{vkbc}
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {Home}
	Postprocess()
	return

+!vkbe::
	if (IsIgnoredWindow()) {
		Send +!{vkbe}
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {End}
	Postprocess()
	return

^a::
	if (IsIgnoredWindow()) {
		Send ^a
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {Home}
	Postprocess()
	return

^e::
	if (IsIgnoredWindow()) {
		Send ^e
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send {End}
	Postprocess()
	return

^d::
	if (IsIgnoredWindow()) {
		Send ^d
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	EraseMark()
	Preprocess()
	Send {Del}
	Postprocess()
	return

^h::
	if (IsIgnoredWindow()) {
		Send ^h
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	EraseMark()
	Preprocess()
	Send {BS}
	Postprocess()
	return

^m::
	if (IsIgnoredWindow()) {
		Send ^m
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	EraseMark()
	Preprocess()
	Send {Enter}
	Postprocess()
	return

^w::
	if (IsIgnoredWindow()) {
		Send ^w
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send ^x
	Postprocess()
	EraseMark()
	return

!w::
	if (IsIgnoredWindow()) {
		Send !w
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send ^c
	Postprocess()
	EraseMark()
	return

^y::
	if (IsIgnoredWindow()) {
		Send ^y
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	Preprocess()
	Send ^v
	Postprocess()
	EraseMark()
	return

^k::
	if (IsIgnoredWindow()) {
		Send ^k
		return
	}
	if (IsKeyXEnabled()) {
		DisableKeyX()
		return
	}
	EraseMark()
	Preprocess()
	Send {ShiftDown}{End}{ShiftUp}^x
	Sleep 17
	Send ^x
	Postprocess()
	return

u::
	if (IsIgnoredWindow()) {
		Send u
		return
	}
	if (IsKeyXEnabled()) {
		Send {Shift up}
		Send ^z
		DisableKeyX()
		return
	}
	Send u
	return

k::
	if (IsIgnoredWindow()) {
		Send k
		return
	}
	if (IsKeyXEnabled()) {
		Send {Shift up}
		Send ^w
		DisableKeyX()
		return
	}
	Send k
	return

s::
	if (IsIgnoredWindow()) {
		Send s
		return
	}
	if (IsKeyXEnabled()) {
		Send {Shift up}
		Send ^s
		DisableKeyX()
		return
	}
	Send s
	return

^g::
	if (IsIgnoredWindow()) {
		Send ^g
		return
	}
	EraseMark()
	DisableKeyX()
	Preprocess()
	Send {Esc}
	Postprocess()
	return

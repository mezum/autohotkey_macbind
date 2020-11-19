; MIT License
; Copyright (c) Kosaki Mezumona
#InstallKeybdHook
#UseHook
SetKeyDelay 0

IsEmacsWindow() {
	if (WinActive("ahk_exe Code.exe"))
		return true
	return false
}

IsChromeLikeTabWindow() {
	if (WinActive("ahk_exe chrome.exe"))
		return true
	if (WinActive("ahk_exe SourceTree.exe"))
		return true
	return false
}

IsExplorerWindow() {
	if (WinActive("ahk_class CabinetWClass"))
		return true
	return false
}

IsTaskSwitcherWindow() {
	if (WinActive("ahk_class Windows.UI.Core.CoreWindow"))
		return true
	return false
}

; Select / Deselect
#vk41::
	if (IsEmacsWindow()) {
		Send #{vk41}
		return
	}
	Send !a
	return

+#vk41::
	if (IsEmacsWindow()) {
		Send +#{vk41}
		return
	}
	Send +^a
	return

#vk44::
	if (IsEmacsWindow()) {
		Send #{vk44}
		return
	}
	Send ^d
	return

; Open / (in explorer) Execute
#vk4f::
	if (IsEmacsWindow()) {
		Send ^x
		Send ^f
		return
	}
	if (IsExplorerWindow()) {
		Send {Enter}
		return
	}
	Send ^o
	return

; (in explorer) Rename
Enter::
	if (IsExplorerWindow()) {
		Send {F2}
		return
	}
	Send {Enter}
	return

; (in explorer) Move to trashbox
#vk08::
	if (IsExplorerWindow()) {
		Send {Del}
		return
	}
	Send #{vk08}
	return

; Move tab
+#vkdb::
	if (IsEmacsWindow()) {
		Send ^x
		Send {Left}
		return
	}
	if (IsChromeLikeTabWindow()) {
		Send +^{Tab}
		return
	}
	Send !{Left}
	return

+#vkdd::
	if (IsEmacsWindow()) {
		Send ^x
		Send {Right}
		return
	}
	if (IsChromeLikeTabWindow()) {
		Send ^{Tab}
		return
	}
	Send !{Right}
	return

; Close tab
#vk57::
	if (IsEmacsWindow()) {
		Send ^x
		Send k
		return
	}
	Send ^w

; Close / Quit
;#vk51::
;	Send !F4
;	return

; Save
#vk53::
	if (IsEmacsWindow()) {
		Send ^x
		Send ^s
		return
	}
	Send ^s
	return

+#vk53::
	if (IsEmacsWindow()) {
		Send ^x
		Send ^w
		return
	}
	Send +^s
	return

!#vk53::
	if (IsEmacsWindow()) {
		Send !#{vk53}
		return
	}
	Send !^s
	return

+!#vk53::
	if (IsEmacsWindow()) {
		Send +!#{vk53}
		return
	}
	Send +!^s
	return

; Copy / Cut / Paste
#vk43::
	if (IsEmacsWindow()) {
		Send !w
		return
	}
	Send ^c
	return

#vk58::
	if (IsEmacsWindow()) {
		Send ^w
		return
	}
	Send ^x
	return

#vk56::
	if (IsEmacsWindow()) {
		Send ^y
		return
	}
	Send ^v
	return

; New window / file
#vk4e::
	if (IsEmacsWindow()) {
		Send ^x
		Send ^b
		return
	}
	Send ^n
	return

; New folder
+#vk4e::
	Send +^n
	return

; Undo / Redo
#vk5a::
	if (IsEmacsWindow()) {
		Send ^x
		Send u
		return
	}
	Send ^z
	return

+#vk5a::
	if (IsEmacsWindow()) {
		Send +^z
		return
	}
	Send +^z
	return

#vk59::
	if (IsEmacsWindow()) {
		Send +^z
		return
	}
	Send ^y
	return

; New / Close tab
#vk54::
	if (IsEmacsWindow()) {
		Send ^x
		Send n
		return
	}
	Send ^t
	return

+#vk54::
	if (IsEmacsWindow()) {
		Send ^x
		Send k
		return
	}
	Send +^t
	return

; Reload
#vk52::
	if (IsEmacsWindow()) {
		Send #{vk52}
		return
	}
	Send ^r
	return

+#vk52::
	if (IsEmacsWindow()) {
		Send +#{vk52}
		return
	}
	Send +^r
	return

; Search
#vk46::
	if (IsEmacsWindow()) {
		Send ^s
		return
	}
	Send ^f
	return

+#vk46::
	if (IsEmacsWindow()) {
		Send +!5
		return
	}
	Send +^f
	return

!#vk46::
	if (IsEmacsWindow()) {
		Send !#{vk46}
		return
	}
	Send !^f
	return

+!#vk46::
	if (IsEmacsWindow()) {
		Send +!#{vk46}
		return
	}
	Send +!^f
	return

; Screen shot
+#vk33::
	Send #{PrintScreen}
	return

+#vk34::
	Send +#s
	return

+#vk35::
	Send !#g
	return

; Task switcher
#Tab::
	if (IsTaskSwitcherWindow()) {
		Send {Right}
		return
	}
	Send #{Tab}
	return

+#Tab::
	if (IsTaskSwitcherWindow()) {
		Send {Left}
		return
	}
	Send +#{Tab}
	return

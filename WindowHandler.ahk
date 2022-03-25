; 2.0-a137-f6f65742

#Include <class\WindowHandlerBase>

#Include <util\WinGetPosEx>

; #Include <util\Join>
#Include <util\WinMove2>
#Include <util\Clamp>
#include <util\ClipCursor>
#include <util\IsProcessElevated>
#include <util\IsProcessSuspended>

class WindowHandler extends WindowHandlerBase {
    __new() {
        ; Init
        this._WinTitle := ""
        this._WinText := ""
        this._ExcludeTitle := []

        this._ExecutablePath := ""

        this._ClassNN := ""

        ; Excluded titles
        this.AddExcludeTitle("ahk_class WorkerW") ; Desktop
        this.AddExcludeTitle("ahk_class DV2ControlHost") ; Task bar (Old)
        this.AddExcludeTitle("ahk_class Shell_TrayWnd") ; Task bar
        this.AddExcludeTitle("ahk_exe SearchApp.exe") ; Start menu

        ; Wait vars
        this._Wait_Timeout := 10

        ; Spam vars
        this._Spam_Rate := 100 ; ms
        this._Spam_HoldPeriod := 100 ; ms

        ; ClipCursor vars
        this.__Callback_ClipCursor := ObjBindMethod(this, "__Timer_ClipCursor")
        this._ClipCursor_Contract := 4 ; px
        this._ClipCursor_Period := 500 ; ms

        ; Public flags
        this.MinMax := ""
    }

    ; ---------- External Helper functions ----------

    ;; TODO Needs documentation
    SetWinTitle(t) {
        this._WinTitle := t
    }

    GetWinTitle() {
        return this._WinTitle
    }

    ; ----------

    ;; TODO Needs documentation
    SetWinText(s) {
        this._WinText := s
    }

    GetWinText(s) {
        return this._WinText
    }

    ; ----------

    ;; TODO Needs documentation
    AddExcludeTitle(t) {
        this._ExcludeTitle.push(t)
    }

    GetExcludeTitles(t) {
        return this._ExcludeTitle
    }

    ; ----------

    ;; TODO Needs documentation
    SetExecutablePath(p) {
        this._ExecutablePath := p
    }

    GetExecutablePath(p) {
        return this._ExecutablePath
    }

    ; ----------

    ;; TODO Needs documentation, figure out a nice way to pass 'k' to 'f' without breaking non-__HotKey funcs
    SetHotKey(k, f, p*) {
        ; Doesn't handle an empty _WinTitle (or any _WinText)
        HotIf (*) => this.Active()
        HotKey(k, (*) => this.GetMethod(f).Call(this, p*)) ; idk if this being p* is a bug or not yet - 1/5/21 me
        HotIf
    }

    ;; TODO Needs documentation
    ; This is horrible design lmao
    ; BUG Doesn't like vanilla modifiers, needs to be the L/R variants under SetHotKey as well as here, ex LAlt, RShift
    SpamHotKey(k, s := "") {
        local StrippedHotKey := RegexReplace(k, "\W", "") ; Strips modifiers from our HotKey

        ; If the 2nd param is empty then the key spams itself
        s := (s != "") ? s : StrippedHotKey

        while GetKeyState(s, "P") {
            Send Format("{{}{} Down{}}", StrippedHotKey)
            Sleep this._Spam_HoldPeriod
            Send Format("{{}{} Up{}}", StrippedHotKey)

            Sleep this._Spam_Rate
        }
    }

    ; ---------- Internal Helper functions ----------

    ;; TODO Needs documentation -- Hacked in at first, but will polish and change to public method eventually.
    __WaitForModifiers() {
        KeyWait "Shift"
        KeyWait "Alt"
        KeyWait "Control"
        KeyWait "LWin"
        KeyWait "RWin"
    }

    ;; TODO Needs documentation
    __Excluded(t) {
        r := False

        for __, e in this._ExcludeTitle {
            if (e == t) {
                r := True
            }
        }

        return r
    }

    ;; TODO Needs documentation
    __DetectHiddenWindows(f, p*) {
        DetectHiddenWindows True
        r := this.GetMethod(f).Call(this, p*)
        DetectHiddenWindows False

        return r
    }

    ; ---------- Timer functions ----------

    ; Don't edit this unless you know what you're doing
    ; BUG Broken by v2 Beta and never got around to fixing it.
    __Timer_ClipCursor() {
        if this.Active() {
            this.GetPosition(&X1, &Y1, &_W, &_H)

            X1 += this._ClipCursor_Contract
            Y1 += this._ClipCursor_Contract

            local X2 := X1 + _W - (this._ClipCursor_Contract * 2)
            local Y2 := Y1 + _H - (this._ClipCursor_Contract * 2)

            ClipCursor(True, X1, Y1, X2, Y2)
        }
    }

    ; ---------- Main Functionality ----------

    ;; TODO Needs documentation
    Exists(Force := False) {
        r := 0

        ; for __, t in this._WinTitle
        local t := this._WinTitle

        if not this.__Excluded(t) {
            r := Force ? this.__DetectHiddenWindows("__Exist", t, this._WinText) : super.__Exist(t, this._WinText)

            if (r != 0) {
                return r
            }
        }

        return r
    }

    ;; TODO Needs documentation
    Active() {
        r := this.Exists()

        if r {
            r := super.__Active(r)
        }

        return r
    }

    ; ----------

    ;; TODO Needs documentation
    Activate() {
        ; XXX This seems pretty likely to return false positives unless the window already exists.  Test further.

        r := this.Exists()

        if r {
            super.__Activate(r)
            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    Close() {
        ; XXX This seems pretty likely to return false positives unless the window already exists.  Test further.

        r := this.Exists()

        if r {
            super.__Close(r)
            return True
        }

        return False
    }

    ;; TODO Needs documentation
    Kill() {
        ; XXX This seems pretty likely to return false positives unless the window already exists.  Test further.

        r := this.Exists()

        if r {
            super.__Kill(r)
            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    Show(Force := True) {
        ; XXX This seems pretty likely to return false positives unless the window already exists.  Test further.

        r := this.Exists(Force)

        if r {
            super.__Show(r)
            return True
        }

        return False
    }

    ;; TODO Needs documentation
    Hide() {
        ; XXX This seems pretty likely to return false positives unless the window already exists.  Test further.

        r := this.Exists()

        if r {
            super.__Hide(r)
            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    GetID() {
        ; Technically this returns the same thing as this.Exists() but I'll keep it for clarity.

        r := this.Exists()

        if r {
            return super.__GetID()
        }

        return ""
    }

    ;; TODO Needs documentation
    GetPID() {
        r := this.Exists()

        if r {
            return super.__GetPID()
        }

        return ""
    }

    ; ----------

    ;; TODO Needs documentation
    GetPosition(&X := "", &Y := "", &W := "", &H := "") {
        ; Originally named GetPositionEx() - This outputs what I expect so it has become the default behavior.
        ; AHK won't stop warning me about these unless I set them to 0.
        local OffsetLeft := 0, OffsetTop := 0, OffsetRight := 0, OffsetBottom := 0

        r := this.Exists()

        if r {
            ; This returns the address of a struct with the dimensions of the window.
            WinGetPosEx(r, &X, &Y, &W, &H, &OffsetLeft, &OffsetTop, &OffsetRight, &OffsetBottom)

            return True
        }

        return False
    }

    ;; TODO Needs documentation
    GetClientPosition(&X := "", &Y := "", &W := "", &H := "") {
        local OffsetLeft, OffsetTop, OffsetRight, OffsetBottom

        r := this.Exists()

        if r {
            super.__GetClientPos(&X, &Y, &W, &H, r)

            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    GetTitle() {
        r := this.Exists()

        if r {
            return super.__GetTitle(r)
        }

        return ""
    }

    ;; TODO Needs documentation
    SetTitle(s) {
        r := this.Exists()

        if r {
            super.__SetTitle(s, r)
            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    ; Returns 0-255 or "" if the window doesn't exist, the transparency value was never set, or under certain OS specific conditions.
    GetTransparency() {
        r := this.Exists()

        if r {
            return super.__GetTransparent(r)
        }

        return ""
    }

    ;; TODO Needs documentation
    SetTransparency(n) {
        ; int n = 0-255

        ; Case-Insensitive compare
        if (IsNumber(n)) {
            n := Clamp(Integer(n), 0, 255)
        }

        ; HACK __GetTransparent returns "" in the case that __SetTransparent(n) hasn't been called first.
        local g := this.GetTransparency()
        g := (g != "") ? g : 255

        ; HACK __SetTransparent only handles one string, "Off" (Case-insensitive), but it seems to accept all strings.
        ; Seems like any string that isn't "Off" is interpreted as 0
        if (not IsNumber(n) and not n = "Off") { ; '=' is Case-insensitive compare, not a typo
            return False
        }

        ; Don't do anything if transparency value didn't change.
        if (IsNumber(n) and g == Integer(n)) {
            return False
        }

        r := this.Exists()

        if r {
            super.__SetTransparent(n, r)
            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    GetStyle() {
        r := this.Exists()

        if r {
            return super.__GetStyle(r)
        }

        return ""
    }

    ;; TODO Needs documentation
    SetStyle(s) {
        r := this.Exists()

        if r {
            super.__SetStyle(s, r)
            return True
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    Restore() {
        r := this.Exists()
        s := super.__GetMinMax(r)

        this.MinMax := s

        if (r != 0) and (s != 0) {
            super.__Restore(r)
            return True
        }

        return False
    }

    ;; TODO Needs documentation
    Minimize() {
        r := this.Exists()
        s := super.__GetMinMax(r)

        this.MinMax := s

        if (r != 0) and (s != -1) {
            super.__Minimize(r)
            return True
        }

        return False
    }

    ;; TODO Needs documentation
    Maximize() {
        r := this.Exists()
        s := super.__GetMinMax(r)

        this.MinMax := s

        if (r != 0) and (s != 1) {
            super.__Maximize(r)
            return True
        }

        return False
    }

    ; ----------

    ;; Freezes the window, removing the ability to interact with it or select it using Alt-Tab.  (Unchanged visually)
    Enable() {
        r := this.Exists()

        if r {
            super.__SetEnabled(True, r)
            return True
        }

        return False
    }

    ;; Un-freezes the window, allowing the user to interact with it or select it using Alt-Tab.
    Disable() {
        r := this.Exists()

        if r {
            super.__SetEnabled(False, r)
            return True
        }

        return False
    }

    ; ----------

    ; Moves and transforms the specified window.
    Move(X := "", Y := "", W := "", H := "") {
        if this.Activate() {
            return WinMove2(X, Y, W, H)
        }

        return False
    }

    ; ----------

    ;; TODO Needs documentation
    GetProcessName() {
        r := this.Exists()

        if r {
            return super.__GetProcessName(r)
        }

        return ""
    }

    ;; TODO Needs documentation
    GetProcessPath() {
        r := this.Exists()

        if r {
            return super.__GetProcessPath(r)
        }

        return ""
    }

    ; ----------

    ;; TODO Needs documentation
    Wait(n := '') {
        r := this.Exists()

        local w := (n != '' and IsNumber(n)) ? Integer(n) : this._Wait_Timeout

        try {
            return super.__Wait(r,, w)

        }

        return False
    }

    ;; TODO Untested, needs documentation
    WaitActive(n := '') {
        r := this.Exists()

        local w := (n != '' and IsNumber(n)) ? Integer(n) : this._Wait_Timeout

        try {
            return super.__WaitActive(r,, w)
        }

        return False
    }

    ;; TODO Untested, needs documentation
    WaitNotActive(n := '') {
        r := this.Exists()

        local w := (n != '' and IsNumber(n)) ? Integer(n) : this._Wait_Timeout

        try {
            return super.__WaitNotActive(r,, w)
        }

        return False
    }

    ;; TODO Untested, needs documentation
    WaitClose(n := '') {
        r := this.Exists()

        local w := (n != '' and IsNumber(n)) ? Integer(n) : this._Wait_Timeout

        try {
            return super.__WaitClose(r,, w)
        }

        return False
    }

    ; ---------- Extended Functionality ----------

    ;; TODO
    Run() {
        ; XXX At the moment this will always create a new process, do I always want that?

        p := this._ExecutablePath

        try {
            Run(p, , , &PID)

            ; This doesn't seem to like when the target window is spawned by another sub-process so it just hangs.
            ; return super.__Wait("ahk_pid " . PID, , this._Wait_Timeout)

            return this.Wait()
        }

        return False
    }

    ; ----------

    ;; TODO
    IsElevated() {
        return IsProcessElevated(this.GetPID())
    }

    ;; TODO
    IsSuspended() {
        return IsProcessSuspended(this.GetPID())
    }

    ; ----------

    ;; TODO Documentation, return
    LockMouse(n := '', c := '') {
        this._ClipCursor_Contract := (c != '' and IsNumber(c)) ? Integer(c) : this._ClipCursor_Contract
        this._ClipCursor_Period := (n != '' and IsNumber(n)) ? Integer(n) : this._ClipCursor_Period

        SetTimer(this.__Callback_ClipCursor, this._ClipCursor_Period)
    }

    ;; TODO Documentation, return
    UnlockMouse() {
        SetTimer(this.__Callback_ClipCursor, 0)
        ClipCursor(False) ; The cursor needs to be released before it can be used correctly
    }

    ; ----------

    ;; TODO Documentation, return
    ShowBorder() {
        try this.SetStyle("+0xC40000")
    }

    ;; TODO Documentation, return
    HideBorder() {
        try this.SetStyle("-0xC40000")
    }
}

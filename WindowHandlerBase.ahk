; 2.0-a122-f595abc2

; https://lexikos.github.io/v2/docs/commands/Win.htm

;; An object-oriented wrapper for AHKv2 Win commands.
class WindowHandlerBase {
    ;; Focuses and reorders the stacking of the first matching window to the topmost layer, the foreground.
    __Activate(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinActivate(p*)
    }

    ;; Does the same thing as __Activate except that it starts searching from the bottommost window rather than the topmost.
    __ActivateBottom(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinActivateBottom(p*)
    }

    ;; Checks if the specified window exists and is currently active (topmost).
    __Active(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            The Unique ID/HWND (Integer) of the specified window if it is active (topmost).
            All other conditions return 0.

        Raises:
            Nothing
        */

        return WinActive(p*)
    }

    ;; Closes the specified window.
    __Close(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinClose(p*)
    }

    ;; Checks if the specified window exists.
    __Exist(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            The Unique ID/HWND (Integer) of the specified window if it exists.
            All other conditions return 0.

        Raises:
            Nothing
        */

        return WinExist(p*)
    }

    ;; XXX
    ;; Retrieves the specified window's class name.
    __GetClass(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetClass(p*) ; Returns String
    }

    ;; XXX
    ;; Retrieves the position and size of the specified window's client area.
    __GetClientPos(&X, &Y, &W, &H, p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinGetClientPos(&X, &Y, &W, &H, p*) ; Doesn't return
    }

    ;; XXX
    ;; Returns the control names for all controls in the specified window.
    __GetControls(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetControls(p*) ; Returns Array[String] or ""
    }

    ;; XXX
    ;; Returns the unique ID numbers for all controls in the specified window.
    __GetControlsHwnd(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetControlsHwnd(p*) ; Returns Array[HWND] or ""
    }

    ;; XXX
    ;; Returns the number of existing windows that match the specified criteria.
    __GetCount(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetCount(p*) ; Returns Int or 0
    }

    ;; XXX
    ;; Returns the unique ID number of the specified window.
    __GetID(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetID(p*) ; Returns HWND or 0
    }

    ;; XXX
    ;; Returns the unique ID number of the last/bottommost window if there is more than one match.
    __GetIDLast(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetIDLast(p*) ; Returns HWND or 0
    }

    ;; XXX
    ;; Returns the unique ID numbers of all existing windows that match the specified criteria.
    __GetList(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetList(p*) ; Returns Array[HWND] or ""
    }

    ;; XXX
    ;; Returns the state whether the specified window is maximized or minimized.
    __GetMinMax(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetMinMax(p*) ; Returns -1, 1, 0
    }

    ;; XXX
    ;; Returns the Process ID number of the specified window.
    __GetPID(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetPID(p*) ; Returns Int(PID) or ""
    }

    ;; XXX
    ;; Retrieves the position and size of the specified window.
    __GetPos(&X, &Y, &W, &H, p*) {
            /*
            Args:
                WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                    See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
                WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                    Hidden text elements are detected if DetectHiddenText is ON.
                ExcludeTitle (String): Windows whose titles include this value will not be considered.
                ExcludeText (String): Windows whose text include this value will not be considered.

            Returns:
                Nothing

            Raises:
                Nothing
            */

        WinGetPos(&X, &Y, &W, &H, p*) ; Doesn't return
    }

    ;; XXX
    ;; Returns the name of the process that owns the specified window.
    __GetProcessName(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetProcessName(p*) ; Returns String or ""
    }

    ;; XXX
    ;; Returns the full path and name of the process that owns the specified window.
    __GetProcessPath(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetProcessPath(p*) ; Returns String or ""
    }

    ;; XXX
    ;; Returns the style or extended style (respectively) of the specified window.
    __GetStyle(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetStyle(p*) ; Returns String or ""
    }

    ;; XXX
    ;; Returns the style or extended style (respectively) of the specified window.
    __GetExStyle(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        ; https://docs.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles

        return WinGetExStyle(p*) ; Returns String or ""
    }

    ;; XXX
    ;; Retrieves the text from the specified window.
    __GetText(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetText(p*) ; Returns String or ""
    }

    ;; XXX
    ;; Retrieves the title of the specified window.
    __GetTitle(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetTitle(p*) ; Returns String or ""
    }

    ;; XXX
    ;; Returns the color that is marked transparent in the specified window.
    __GetTransColor(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetTransColor(p*) ; Returns String (of Hex) or ""
    }

    ;; XXX
    ;; Returns the degree of transparency of the specified window.
    __GetTransparent(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        return WinGetTransparent(p*) ; Returns Int or ""
    }

    ;; XXX
    ;; Hides the specified window.
    __Hide(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinHide(p*) ; Doesn't return
    }

    ;; XXX
    ;; Forces the specified window to close.
    __Kill(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinKill(p*) ; Doesn't return
    }

    ;; XXX
    ;; Enlarges the specified window to its maximum size.
    __Maximize(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMaximize(p*) ; Doesn't return
    }

    ;; XXX
    ;; Collapses the specified window into a button on the task bar.
    __Minimize(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMinimize(p*) ; Doesn't return
    }

    ;; XXX
    ;; Minimizes or un-minimizes all windows.
    __MinimizeAll(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMinimizeAll() ; Doesn't return
    }

    ;; XXX
    ;; Minimizes or un-minimizes all windows.
    __MinimizeAllUndo(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMinimizeAllUndo() ; Doesn't return
    }

    ;; XXX
    ;; Changes the position and/or size of the specified window.
    __Move(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMove(p*) ; Doesn't return
    }

    ;; XXX
    ;; Sends the specified window to the bottom of stack; that is, beneath all other windows.
    __MoveBottom(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMoveBottom(p*) ; Doesn't return
    }

    ;; XXX
    ;; Brings the specified window to the top of the stack without explicitly activating it.
    __MoveTop(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinMoveTop(p*) ; Doesn't return
    }

    ;; XXX
    ;; Redraws the specified window.
    __Redraw(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinRedraw(p*) ; Doesn't return
    }

    ;; XXX
    ;; Un-minimizes or un-maximizes the specified window if it is minimized or maximized.
    __Restore(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinRestore(p*) ; Doesn't return
    }

    ;; XXX
    ;; Makes the specified window stay on top of all other windows (except other always-on-top windows).
    __SetAlwaysOnTop(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetAlwaysOnTop(p*) ; Doesn't return
    }

    ;; XXX
    ;; Enables or disables the specified window.
    __SetEnabled(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetEnabled(p*) ; Doesn't return
    }

    ;; XXX
    ;; Changes the shape of the specified window to be the specified rectangle, ellipse, or polygon.
    __SetRegion(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetRegion(p*) ; Doesn't return
    }

    ;; XXX
    ;; Changes the style or extended style of the specified window, respectively.
    __SetStyle(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetStyle(p*) ; Doesn't return
    }

    ;; XXX
    ;; Changes the style or extended style of the specified window, respectively.
    __SetExStyle(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        ; https://docs.microsoft.com/en-us/windows/win32/winmsg/extended-window-styles

        WinSetExStyle(p*) ; Doesn't return
    }

    ;; XXX
    ;; Changes the title of the specified window.
    __SetTitle(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetTitle(p*) ; Doesn't return
    }

    ;; XXX
    ;; Makes all pixels of the chosen color invisible inside the specified window.
    __SetTransColor(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetTransColor(p*) ; Doesn't return
    }

    ;; XXX
    ;; Makes the specified window semi-transparent.
    __SetTransparent(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinSetTransparent(p*) ; Doesn't return
    }

    ;; XXX
    ;; Un-hides the specified window.
    __Show(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinShow(p*) ; Doesn't return
    }

    ;; XXX
    ;; Waits until the specified window exists.
    __Wait(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            Timeout (Integer or Float): How many seconds to wait before timing out and returning 0.
                Leave blank to allow the function to wait indefinitely.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinWait(p*) ; Return HWND or 0
    }

    ;; XXX
    ;; Waits until the specified window is active or not active.
    __WaitActive(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            Timeout (Integer or Float): How many seconds to wait before timing out and returning 0.
                Leave blank to allow the function to wait indefinitely.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinWaitActive(p*) ; Returns HWND or 0
    }

    ;; XXX
    ;; Waits until the specified window is active or not active.
    __WaitNotActive(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            Timeout (Integer or Float): How many seconds to wait before timing out and returning 0.
                Leave blank to allow the function to wait indefinitely.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinWaitNotActive(p*) ; Returns 1 or 0
    }

    ;; XXX
    ;; Waits until no matching windows can be found.
    __WaitClose(p*) {
        /*
        Args:
            WinTitle (String, Integer or Object): A window title or other criteria identifying the target window.
                See https://lexikos.github.io/v2/docs/misc/WinTitle.htm
            WinText (String): If present, this parameter must be a substring from a single text element of the target window.
                Hidden text elements are detected if DetectHiddenText is ON.
            Timeout (Integer or Float): How many seconds to wait before timing out and returning 0.
                Leave blank to allow the function to wait indefinitely.
            ExcludeTitle (String): Windows whose titles include this value will not be considered.
            ExcludeText (String): Windows whose text include this value will not be considered.

        Returns:
            Nothing

        Raises:
            Nothing
        */

        WinWaitClose(p*) ; Returns 1 or 0
    }
}

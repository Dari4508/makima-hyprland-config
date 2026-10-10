-- scheme.current.lua está en ~/.config/hypr/scheme/ (no en caelestia path)
local scheme = dofile(os.getenv("HOME") .. "/.config/hypr/scheme/current.lua")

return {
    ------------------
    ---- HYPRLAND ----
    ------------------

    -- Apps (prefijos uwsm para UWSM)
    terminal                   = "uwsm app -- kitty",
    browser                    = "uwsm app -- firefox",
    editor                     = "uwsm app -- gnome-text-editor --new-window",
    fileExplorer               = "uwsm app -- dolphin",
    audioSettings              = "uwsm app -- pwvucontrol",

    -- Touchpad
    touchpadDisableTyping      = true,
    touchpadScrollFactor       = 0.3,
    gestureFingers             = 3,
    workspaceSwipeFingers      = 4,
    gestureFingersMore         = 4,

    -- Blur (desactivado para rendimiento en HD 620)
    blurEnabled                = false,
    blurSpecialWs              = false,
    blurPopups                 = false,
    blurInputMethods           = false,
    blurSize                   = 8,
    blurPasses                 = 2,
    blurXray                   = false,

    -- Shadow
    shadowEnabled              = true,
    shadowRange                = 15,
    shadowRenderPower          = 4,
    shadowColour               = "rgba(" .. scheme.inversePrimary .. "10)",

    -- Gaps
    workspaceGaps              = 20,
    windowGapsIn               = 5,
    windowGapsOut              = 10,
    singleWindowGapsOut        = 0,

    -- Window styling
    windowOpacity              = 0.95,
    windowRounding             = 15,
    windowRoundingPower        = 2,
    windowBorderSize           = 1,
    activeWindowBorderColour   = "rgba(" .. scheme.primary .. "e6)",
    inactiveWindowBorderColour = "rgba(" .. scheme.onSurfaceVariant .. "11)",

    -- Misc
    volumeStep                 = 10,
    volumeMax                  = 100,
    cursorTheme                = "sweet-cursors",
    cursorSize                 = 24,
    sleepGestureCmd            = "systemctl suspend-then-hibernate",

    ------------------
    ---- KEYBINDS ----
    ------------------

    -- Workspace navigation (uso code: para layout latam)
    kbGoToWs                   = "SUPER + ALT",          -- binds dead on latam, usamos code: en hypr-user.lua
    kbGoToWsGroup              = "CTRL + SUPER + ALT",   -- dead
    kbMoveWinToWs              = "SUPER + SHIFT + ALT",  -- dead
    kbMoveWinToWsGroup         = "CTRL + SUPER + SHIFT + ALT",

    -- Workspaces
    kbMoveWinToWsSpecial       = { "SUPER + ALT + S", "CTRL + SUPER + SHIFT + Up" },
    kbMoveWinFromWsSpecial     = "CTRL + SUPER + SHIFT + Down",
    kbMoveWinToWsNext          = { "SUPER + ALT + mouse_down", "SUPER + ALT + Page_Down", "CTRL + SUPER + SHIFT + Right" },
    kbMoveWinToWsPrev          = { "SUPER + ALT + mouse_up", "SUPER + ALT + Page_Up", "CTRL + SUPER + SHIFT + Left" },
    kbNextWs                   = { "SUPER + mouse_down", "CTRL + SUPER + Right", "SUPER + Page_Down" },
    kbPrevWs                   = { "SUPER + mouse_up", "CTRL + SUPER + Left", "SUPER + Page_Up" },
    kbNextWsGroup              = "CTRL + SUPER + mouse_down",
    kbPrevWsGroup              = "CTRL + SUPER + mouse_up",

    -- Window Group
    kbWindowCycleNext          = "ALT + TAB",
    kbWindowCyclePrev          = "SHIFT + ALT + TAB",
    kbWindowGroupCycleNext     = "CTRL + ALT + TAB",
    kbWindowGroupCyclePrev     = "CTRL + SHIFT + ALT + TAB",
    kbUngroup                  = "SUPER + U",
    kbToggleGroup              = "SUPER + Comma",
    kbGroupLockActive          = "SUPER + SHIFT + Comma",

    -- Window Actions
    kbWindowDecreaseWidth      = { "SUPER + ALT + Left" },
    kbWindowIncreaseWidth      = { "SUPER + ALT + Right" },
    kbWindowDecreaseHeight     = { "SUPER + ALT + Up" },
    kbWindowIncreaseHeight     = { "SUPER + ALT + Down" },

    kbMoveWindow               = "SUPER + Z",
    kbResizeWindow             = "SUPER + X",
    kbCenterWindow             = "CTRL + SUPER + Backslash",
    kbNormalizeWindow          = "CTRL + SUPER + ALT + Backslash",
    kbWindowPip                = "SUPER + ALT + Backslash",
    kbPinWindow                = "SUPER + P",
    kbWindowFullscreen         = "SUPER + F",
    kbWindowBorderedFullscreen = "SUPER + D",
    kbToggleWindowFloating     = "SUPER + ALT + Space",
    kbCloseWindow              = { "SUPER + Q", "SUPER + Escape" },

    -- Special workspaces toggles
    kbSpecialWs                = "SUPER + S",
    kbSystemMonitorWs          = "SUPER + SHIFT + T",    -- libre (btop en CTRL+SHIFT+Esc)
    kbMusicWs                  = "SUPER + M",
    kbCommunicationWs          = "SUPER + D",
    kbTodoWs                   = "SUPER + R",

    -- Apps (tus bindings originales)
    kbTerminal                 = "SUPER + Return",
    kbBrowser                  = "SUPER + W",
    kbEditor                   = "SUPER + T",
    kbFileExplorer             = "SUPER + E",
    kbAudioSettings            = "CTRL + ALT + V",

    -- Utilities (deshabilitados - usamos grim+slurp estilo Win+Shift+S)
    kbScreenshot               = "",
    kbScreenshotFreeze         = "",
    kbScreenshotRegion         = "",
    kbRecord                   = "CTRL + ALT + R",
    kbRecordSound              = "SUPER + ALT + R",
    kbRecordRegion             = "SUPER + SHIFT + ALT + R",
    kbColorPicker              = "SUPER + SHIFT + C",

    -- Media (hardcoded en keybinds.lua a XF86)
    kbMediaToggle              = "CTRL + SUPER + Space",
    kbMediaNext                = "CTRL + SUPER + Equal",
    kbMediaPrev                = "CTRL + SUPER + Minus",
    kbMediaStop                = "CTRL + SUPER + Backspace",
    kbVolumeMute               = "SUPER + SHIFT + M",

    -- Misc (mapeo de tus binds a caelestia globals)
    kbLauncher                 = "SUPER + Space",
    kbSession                  = "SUPER + ALT + C",
    kbShowSidebar              = "SUPER + A",             -- notificaciones (tuyo SUPER+A)
    kbClearNotifs              = "CTRL + ALT + C",
    kbShowPanels               = "SUPER + SHIFT + K",     -- era SUPER+K, evitando conflictos
    kbLock                     = "SUPER + L",
    kbRestoreLock              = "SUPER + ALT + L",
    kbSleep                    = "SUPER + SHIFT + L",

    -- Clipboard and emoji picker
    kbClipboard                = "SUPER + V",
    kbClipboardDel             = "SUPER + ALT + V",
    kbClipboardPasteLatest     = "CTRL + SHIFT + ALT + V",
    kbEmoji                    = "SUPER + Period",
}
-- ~/.config/caelestia/hypr-user.lua
-- Custom Hyprland binds & config that go BEYOND hypr-vars.lua
-- hl ya es global en Hyprland 0.56+ (NO usar require("hyprland") → stack overflow)

-- ============================================================
-- WORKSPACE NAVIGATION BY CODE (layout latam fix)
-- En latam, las teclas numéricas sin Shift emiten símbolos (²³¹¨´)
-- Usamos keycodes físicos: code:10=1, code:11=2, ..., code:19=0
-- ============================================================

local function code(digit)
    -- digit 1-9 -> evdev keycodes 10-18, 0 -> 19
    if digit == 0 then return "code:19" end
    return "code:" .. (9 + digit)
end

-- Focus workspace 1-3 (SUPER + 1/2/3 físico)
for i = 1, 3 do
    hl.bind("SUPER + " .. code(i), hl.dsp.focus({ workspace = i }))
end

-- Move window to workspace 1-3 (SUPER + SHIFT + 1/2/3 físico)
for i = 1, 3 do
    hl.bind("SUPER + SHIFT + " .. code(i), hl.dsp.window.move({ workspace = i }))
end

-- Move window to workspace 1-3 (follow=false) - SUPER + CTRL + 1/2/3
for i = 1, 3 do
    hl.bind("SUPER + CTRL + " .. code(i), hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move window to next monitor (SUPER + SHIFT + code:1/2/3 físico)
for i = 1, 3 do
    hl.bind("SUPER + SHIFT + " .. code(i), hl.dsp.window.move({ monitor = "+1" }))
end

-- ============================================================
-- ZOOM (tus binds: SUPER+Minus/Plus + keypad)
-- ============================================================

local function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor")
    if (zoomvalue + value) > 3.0 then
        hl.config({ cursor = { zoom_factor = 3.0 } })
    elseif (zoomvalue + value) < 1.0 then
        hl.config({ cursor = { zoom_factor = 1.0 } })
    else
        hl.config({ cursor = { zoom_factor = zoomvalue + value } })
    end
end

hl.bind("SUPER + Minus", function() zoomfunction(-0.3) end, { repeating = true })
hl.bind("SUPER + Plus", function() zoomfunction(0.3) end, { repeating = true })
hl.bind("SUPER + code:82", function() zoomfunction(-0.3) end, { repeating = true })  -- keypad -
hl.bind("SUPER + code:86", function() zoomfunction(0.3) end, { repeating = true })  -- keypad +

-- ============================================================
-- CALCULADORA (tuyo: SUPER+C + XF86Calculator)
-- ============================================================

hl.bind("SUPER + C", hl.dsp.exec_cmd("uwsm app -- gnome-calculator"))
hl.bind("XF86Calculator", hl.dsp.exec_cmd("uwsm app -- gnome-calculator"))

-- ============================================================
-- BTOP (tuyo: CTRL+SHIFT+Escape)
-- ============================================================

hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("uwsm app -- kitty -e btop"))

-- ============================================================
-- TOGGLESPLIT (tuyo: SUPER+J)
-- ============================================================

hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))

-- ============================================================
-- XHOST + ROOT (necesario para algunas apps GUI como root)
-- ============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("xhost +SI:localuser:root")
end)

-- ============================================================
-- WALLPAPER PICKER -> abrir nexus en página WallpaperAndStyle
-- (SUPER+SHIFT+W tuyo -> mapear a caelestia:nexus via keybinds.lua
--  pero no hay IPC directo para página; usamos launcher + navegas)
-- ============================================================

-- ============================================================
-- BTREE: mover ventana a special workspace (SUPER+SHIFT+S)
-- Ya cubierto por kbMoveWinToWsSpecial en hypr-vars.lua
-- ============================================================

-- ============================================================
-- SCRATCHPAD toggle (SUPER+S ya en vars)
-- ============================================================

-- ============================================================
-- VISUAL APP SWITCHER (ALT+TAB) - usando fuzzel (ya instalado)
-- Caelestia solo cicla ventanas sin UI visual; esto abre fuzzel window switcher
-- ============================================================

hl.bind("ALT + TAB", hl.dsp.exec_cmd("fuzzel --window"))
hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("fuzzel --window"))

-- ============================================================
-- MINIMIZAR VENTANA (SUPER+H) -> mover a special workspace (scratchpad)
-- ============================================================

hl.bind("SUPER + H", hl.dsp.window.move({ workspace = "special:special" }))

-- ============================================================
-- RESTAURAR VENTANA MINIMIZADA (SUPER+SHIFT+H) -> traer de special a workspace actual
-- ============================================================

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ workspace = "e+0" }))

-- ============================================================
-- MOVER VENTANA ENTRE MONITORES (SUPER+SHIFT+N) - ciclo monitor actual
-- (SUPER+SHIFT+M reservado para kbVolumeMute)
-- ============================================================

hl.bind("SUPER + SHIFT + N", hl.dsp.window.move({ monitor = "+1" }))

-- ============================================================
-- KEYBOARD LAYOUT: fijar a latam (con teclas muertas para tildes/ñ)
-- Se aplica al inicio y en reload
-- ============================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprctl keyword input:kb_layout latam")
end)

-- Forzar latam ahora
hl.exec_cmd("hyprctl keyword input:kb_layout latam")

-- ============================================================
-- TOGGLE SPLIT (SUPER+J) - ya está arriba
-- ============================================================

-- ============================================================
-- SCREENSHOT ESTILO WINDOWS WIN+SHIFT+S (SUPER+SHIFT+S)
-- Región con selección visual, guarda en ~/Imágenes/Capturas y copia al portapapeles
-- ============================================================

local function screenshot_region()
    local save_dir = os.getenv("HOME") .. "/Imágenes/Capturas"
    hl.exec_cmd("mkdir -p " .. save_dir)
    local filename = save_dir .. "/captura-" .. os.date("%Y%m%d-%H%M%S") .. ".png"
    -- grim + slurp: selección visual con borde, copia a clipboard y guarda archivo
    hl.exec_cmd(string.format("slurp | grim -g - %s && wl-copy < %s && notify-send 'Captura' 'Guardada en %s'", filename, filename, filename))
end

hl.bind("SUPER + SHIFT + S", screenshot_region)

-- ============================================================
-- SCREENSHOT PANTALLA COMPLETA (Print)
-- ============================================================

local function screenshot_full()
    local save_dir = os.getenv("HOME") .. "/Imágenes/Capturas"
    hl.exec_cmd("mkdir -p " .. save_dir)
    local filename = save_dir .. "/captura-" .. os.date("%Y%m%d-%H%M%S") .. ".png"
    hl.exec_cmd(string.format("grim %s && wl-copy < %s && notify-send 'Captura' 'Pantalla completa guardada'", filename, filename))
end

hl.bind("Print", screenshot_full)

-- ============================================================
-- WARP TERMINAL (SUPER+ALT+W)
-- ============================================================

hl.bind("SUPER + ALT + W", hl.dsp.exec_cmd("uwsm app -- warp-terminal"))
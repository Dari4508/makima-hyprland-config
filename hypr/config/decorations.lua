-- Look and feel configuration
-- Ajustado para Intel HD 620 / i5-7200U: efectos visuales fuertes pero baratos

hl.config({
    general = {
        gaps_in = 6,
        gaps_out = 14,
        border_size = 2,
        extend_border_grab_area = 10,
        resize_on_border = true,
        col = {
            active_border = {
                colors = { CACHYLGREEN, CACHYDGREEN },
                angle = 45,
            },
            inactive_border = CACHYGRAY,
        },
    },
    group = {
        col = {
            border_active = CACHYLBLUE,
            border_inactive = CACHYGRAY,
            border_locked_active = CACHYDBLUE,
            border_locked_inactive = CACHYGRAY,
        },
        groupbar = {
            col = {
                active = CACHYLGREEN,
                inactive = CACHYGRAY,
                locked_active = CACHYDBLUE,
                locked_inactive = CACHYGRAY,
            },
        },
    },
    decoration = {
        -- Esquinas mas redondeadas: look moderno tipo "pildora"
        rounding = 14,
        rounding_power = 2,

        -- Transparencia: deja ver el wallpaper detras de las ventanas
        active_opacity = 1.0,
        inactive_opacity = 0.92,
        fullscreen_opacity = 1,

        -- Sombras: separa las ventanas del fondo (efecto "elevado")
        shadow = {
            enabled = true,
            range = 6,
            render_power = 3,
            color = "rgba(1a1a1aff)",
        },

        -- Blur: cristal esmerilado. passes reducidos (4->2) por la iGPU
        blur = {
            size = 5,
            passes = 2,
            special = true,
            ignore_opacity = true,
            -- Vibrancy: saturacion extra detras de las ventanas translucidas
            vibrancy = 0.17,
        },

        dim_special = 0.3,
    },
})

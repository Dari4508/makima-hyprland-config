-- Input configuration

hl.config({
    input = {
        -- Teclado: Latinoamericano (Mexico) -> ñ, á, é, í, ó, ú
        kb_layout  = "latam",
        kb_variant = "",
        kb_model   = "pc105",
        kb_options = "",
        kb_rules   = "",

        -- sensitivity = -0.25,
        accel_profile = "flat",
    },
    -- Uncomment the section below to enable software cursors; this can help with cursor display or behavior issues
    -- cursor = {
    --     no_hardware_cursors = 1,
    -- },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })

-- Animations: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- Estetica "pop-in" + springs para dar el efectoTikTok

-- Default curves and animations
-- Default beziers
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("overshoot",      { type = "bezier", points = { {0.5, 0.9}, {0.1, 1.1}     } })

-- Curva extra: salida suave y rapida (se siente "premium")
hl.curve("smoothOut",      { type = "bezier", points = { {0.16, 1},    {0.3, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 500, dampening = 35 })
hl.curve("rubber",         { type = "spring", mass = 1, stiffness = 200,  dampening = 15 })

-- Spring "bouncy": rebote notable al abrir/cerrar ventanas
hl.curve("bouncy",         { type = "spring", mass = 1, stiffness = 260,  dampening = 22 })

-- Animations
hl.animation({ leaf = "global",         enabled = true, speed = 10,  bezier = "default"    })
hl.animation({ leaf = "border",         enabled = true, speed = 6,   bezier = "easeOutQuint" })

-- Ventanas: pop-in con spring (el efecto signature del look)
hl.animation({ leaf = "windows",        enabled = true, speed = 4,   spring = "easy"       })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 4,   spring = "bouncy", style = "popin 88%" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 2,   bezier = "linear",     style = "popin 92%" })

-- Fades
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 2,   bezier = "smoothOut"  })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 1.5, bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3,   bezier = "quick"      })

-- Capas (Noctalia: barra, dock, notificaciones, panels)
hl.animation({ leaf = "layers",         enabled = true, speed = 3.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 4,   bezier = "smoothOut", style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1.5, bezier = "linear",    style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 1.8, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 1.4, bezier = "almostLinear" })

-- Workspaces
hl.animation({ leaf = "workspaces",     enabled = true, speed = 2,   bezier = "smoothOut",  style = "slide" })
hl.animation({ leaf = "workspacesIn",   enabled = true, speed = 2,   bezier = "smoothOut",  style = "slide" })
hl.animation({ leaf = "workspacesOut",  enabled = true, speed = 2,   bezier = "smoothOut",  style = "slide" })

hl.animation({ leaf = "zoomFactor",     enabled = true, speed = 7,   bezier = "quick"      })

-- Scratchpads
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 2, spring = "bouncy"    })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2, spring = "bouncy"    })

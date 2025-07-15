return {
    "goolord/alpha-nvim",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local alpha = require("alpha")
        local startify = require("alpha.themes.startify")
        startify.section.header.val = {
            [[                                   __                ]],
            [[      ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
        startify.section.header.opts = { position = "center" }
        startify.section.top_buttons.val = {
            startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        }
        startify.section.top_buttons.opts = { position = "center" }

        startify.section.mru.val = { { type = "padding", val = 0 } }
        startify.section.mru.opts = { position = "center" }
        alpha.setup(startify.config)
    end,
}

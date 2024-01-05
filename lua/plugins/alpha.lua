-- https://github.com/goolord/alpha-nvim

return {
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            -- require 'alpha'.setup(require 'alpha.themes.startify'.config) -- file list
            -- require 'alpha'.setup(require 'alpha.themes.dashboard'.config) -- dashboard

            local alpha = require("alpha")
            local dashboard = require("alpha.themes.startify")

            dashboard.section.header.val = {
                [[                                                                                    ]],
                [[      ██╗     ███████╗██╗   ██╗██╗███████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗     ]],
                [[      ██║     ██╔════╝██║   ██║██║██╔════╝    ████╗  ██║██║   ██║██║████╗ ████║     ]],
                [[      ██║     █████╗  ██║   ██║██║███████╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║     ]],
                [[      ██║     ██╔══╝  ╚██╗ ██╔╝██║╚════██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║     ]],
                [[      ███████╗███████╗ ╚████╔╝ ██║███████║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║     ]],
                [[      ╚══════╝╚══════╝  ╚═══╝  ╚═╝╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝     ]],
                [[                                                                                    ]],

            }

            alpha.setup(dashboard.opts)
        end
    },
}

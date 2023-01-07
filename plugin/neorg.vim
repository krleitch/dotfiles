lua << EOF
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/Documents/notes/work",
                    home = "~/Documents/notes/home",
                    gtd  = "~/Documents/notes/gtd",
                },
                autochdir = false,
                open_last_workspace = false
            }
        },
        ["core.norg.concealer"] = {
          config = {
            icon_preset = "diamond"
          }
        },
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp"
          }            },
        ["core.presenter"] = {
          config = {
            zen_mode = "truezen"
          }
        },
        ["core.gtd.base"] = {
          config = {
            workspace = "gtd"
          }
        },
        ["core.norg.journal"] = {
          config = {
            workspace = "home"
          }
        },
        ["utilities.tables"] = {}
    },
    -- logger = {
    --     level = "trace"
    -- }
}
EOF


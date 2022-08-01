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
                }
            }
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.norg.concealer"] = {},
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
    }
}
EOF

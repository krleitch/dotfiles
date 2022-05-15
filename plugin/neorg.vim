lua << EOF
require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                    gtd  = "~/notes/gtd",
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
        ["external.kanban"] = {
          config = {
              task_states = {
                  "backlog",
                  "blocked",
                  "priority",
                  "in_progress",
                  "completed",
                  "cancelled"
                }
            }
        },
    }
}
EOF

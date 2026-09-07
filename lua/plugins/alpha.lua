return {
  "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- YOUR CURRENT LOGO
    dashboard.section.header.val = {
      [[                                   ███  ███                       ]],
      [[                                  ▒███  ▒▒▒                       ]],
      [[  █████   ██████   ████████    ███████  ████  ████████    ██████  ]],
      [[ ███▒▒   ▒▒▒▒▒███ ▒▒███▒▒███  ███▒▒███ ▒▒███ ▒▒███▒▒███  ▒▒▒▒▒███ ]],
      [[▒▒█████   ███████  ▒███ ▒███ ▒███ ▒███  ▒███  ▒███ ▒███   ███████ ]],
      [[ ▒▒▒▒███ ███▒▒███  ▒███ ▒███ ▒███ ▒███  ▒███  ▒███ ▒███  ███▒▒███ ]],
      [[ ██████ ▒▒████████ ████ █████▒▒████████ █████ ████ █████▒▒████████ ]],
      [[▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ▒▒▒▒▒ ▒▒▒▒ ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ]],
    }
    -- buttons / footer you can keep default
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "󰄉  Recent", ":Telescope oldfiles <CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    -- custom layout = this is where you inject the name
    dashboard.config.layout = {
      { type = "padding", val = 2 },
      dashboard.section.header,
      { type = "padding", val = 1 },
      custom_name,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    -- if you want startify icons provider
    -- dashboard.section.footer.opts.hl = "Comment"

    alpha.setup(dashboard.config)
  end,
}

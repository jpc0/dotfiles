return {
  {
    "aca/emmet-ls",
    opts = {
      filetypes = {
        "html",
        "tmpl",
        "html.tmpl",
      },
    },
    config = function() end,
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = {
            enabled = false,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = vim.g.ai_cmp,
        },
        list = {
          selection = {
            preselect = false,
          },
        },
      },
    },
  },
}

-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format and FormatWrite commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  formatter = {
	  prettier = {
		  require("formatter.defaults.prettier")
	  },
  },
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
	typescript = {
		require("formatter.filetypes.typescript").prettier
	},
	typescriptreact = {
		require("formatter.filetypes.typescriptreact").prettier
	},
	html = {
		require("formatter.filetypes.html").prettier
	},
	css = {
		require("formatter.filetypes.css").prettier
	},
	javascript = {
		require("formatter.filetypes.javascript").prettier
	},
	javascriptreact = {
		require("formatter.filetypes.javascriptreact").prettier
	},
	python = {
		require("formatter.filetypes.python").black
	},
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,
    },
    rust = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.rust").rustfmt,
    },
	json = {
		require("formatter.filetypes.json").prettier,
	},
	cpp = {
		require("formatter.filetypes.cpp").clangformat,
	},
	c = {
		require("formatter.filetypes.c").clangformat,
	},
	cmake = {
		require("formatter.filetypes.cmake").cmakeformat,
	},

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

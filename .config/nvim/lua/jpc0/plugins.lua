local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim" 
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer, close and reopen Neovim..."
	vim.cmd [[ packeradd packer.nvim ]]
end

-- Autocommand that reloads neovim whnever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	print "Failed to load packer"
	return
end

-- Install your plugins here
return require('packer').startup(function(use)
	-- My Plugins Here
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	
	-- Colorscheme
	use "folke/tokyonight.nvim"
	
	-- LSP
	use "neovim/nvim-lspconfig"
	
	-- CMP
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/nvim-cmp"
	
	-- Snippets
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

	-- Automatically set up your config after cloning packer.nvim
	-- Put this at the end of all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end )

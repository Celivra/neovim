local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "nvim-lualine/lualine.nvim" },

	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },  -- LSP 配置插件
  	{ "hrsh7th/nvim-cmp" },       -- 补全插件
  	{ "hrsh7th/cmp-nvim-lsp" },   -- nvim-cmp 和 LSP 配合
  	{ "hrsh7th/cmp-buffer" },     -- 补全缓冲区
  	{ "hrsh7th/cmp-path" },       -- 补全路径
  	{ "saadparwaiz1/cmp_luasnip" }, -- 补全 LuaSnip
  	{ "L3MON4D3/LuaSnip" },

})

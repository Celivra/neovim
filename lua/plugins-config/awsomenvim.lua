require("catppuccin").setup({
    flavour = "mocha", 
    background = { light = "latte", dark = "mocha", },
    transparent_background = false, 
    show_end_of_buffer = false, 
    term_colors = false, 
    dim_inactive = { enabled = false, shade = "dark", percentage = 0.15, },
    no_italic = false, 
    no_bold = false, 
    no_underline = false, 
    styles = { 
		comments = { "italic" }, 
		conditionals = { "italic" }, 
		loops = {}, 
		functions = {}, 
		keywords = {}, 
		strings = {}, 
		variables = {}, 
		numbers = {}, 
		booleans = {}, 
		properties = {}, 
		types = {}, 
		operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = { cmp = true, gitsigns = true, nvimtree = true, treesitter = true, notify = false, mini = { enabled = true, indentscope_color = "", }, }, })


vim.cmd("syntax enable")

-- 等待文件类型加载后执行语法匹配
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",  -- 对所有文件类型执行
  callback = function()
    vim.cmd('syntax match Function /\\w\\+\\ze(/')
    vim.cmd('highlight Function guifg=#539eed')
  end,
})

--vim.cmd.colorscheme "catppuccin"
vim.cmd("colorscheme catppuccin")

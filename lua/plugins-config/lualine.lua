local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

lualine.setup({
	options = {
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "toggleterm" },
	sections = {
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
			},
		},
		lualine_b = {
			{
				"filetype",
				colored = true,
				icon_only = true,
			},
			"filename",
		},
		lualine_c = {
			"branch",
			"diff",
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = '', -- e712
					dos = '', -- e70f
					mac = "", -- e711
				},
			},
			"encoding",
			"filetype",
		},

		lualine_y = {},

		lualine_z = {
			"progress",
		},
	},
})


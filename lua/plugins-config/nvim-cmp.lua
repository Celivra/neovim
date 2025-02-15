local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },    -- 使用 LSP 补全
    { name = "buffer" },      -- 使用缓冲区补全
    { name = "path" },        -- 使用路径补全
    { name = "luasnip" },     -- 使用代码片段
  },

  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),           -- 向上滚动文档
    ["<C-f>"] = cmp.mapping.scroll_docs(4),            -- 向下滚动文档
    ["<A-Space>"] = cmp.mapping.complete(),            -- 启动补全
    ["<C-e>"] = cmp.mapping.close(),                  -- 关闭补全窗口
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })  -- 如果补全窗口可见，选择下一个项
      else
        fallback()  -- 如果没有补全项，插入制表符
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })  -- 选择上一个项
      else
        fallback()  -- 如果没有补全项，插入制表符
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,  -- 按下 Enter 时自动选择第一个项
    }),
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
        luasnip = "[Snippet]",
      })[entry.source.name]
      return vim_item
    end,
  },
})


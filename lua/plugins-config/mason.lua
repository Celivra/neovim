-- 先确保 lspconfig 可用
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    vim.notify("没有找到 nvim-lspconfig")
    return
end

-- 正确调用 lspconfig 的 lua_ls
lspconfig.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
})



-- ast-grep 配置
lspconfig.ast_grep.setup({
  on_attach = function(client, bufnr)
    -- 设置一些键绑定
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {})
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {})
  end,
})


require("mason").setup()
require("lspconfig").ast_grep.setup({})

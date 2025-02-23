return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").lua_ls.setup {}

      -- Собираемся прикрепить LSP сервер
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          --  Если клиент не найден, то не прикрепояем LSP
          if not client then return end


          --Вместо нижних 2 строчек можно использовать
          --if vim.bo.filetype == "lua" then

          -- Если клиент поддерживает форматирование
          ---@diagnostic disable-next-line: missing-parameter
          if client.supports_method('textDocument/rename') then
            -- Создать новый локальный прослушиваттель событий буфера
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
            -- Create a keymap for vim.lsp.buf.rename()
          end
          if client.supports_method('textDocument/implementation') then
            -- Create a keymap for vim.lsp.buf.implementation
          end
        end,

      })

      vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)
    end,

  }
}
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client.server_capabilities.completionProvider then
--       vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
--     end
--     if client.server_capabilities.definitionProvider then
--       vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
--     end
--   end,
-- })

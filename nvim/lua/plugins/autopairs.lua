return{
    { "windwp/nvim-autopairs", opts = {}, },
}

-- Подключение LSP для работы автокомплита
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- require('lspconfig')['pyright'].setup{capabilities = capabilities}
-- require('lspconfig')['lua_ls'].setup{capabilities = capabilities}

-- Подстановка скобок к подсказкам, которым это нужно (дополнение для nvim-autopairs)
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

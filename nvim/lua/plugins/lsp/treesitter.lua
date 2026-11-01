return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- Neovim 0.12+ требует новую ветку (master заархивирована)
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    require("nvim-treesitter").install({
      "c",
      "lua",
      "vim", "vimdoc",
      "markdown", "markdown_inline",
      "python",
      "php",
      "bash",
      "html", "query",
      "jinja", "jinja_inline",
      "yaml", "helm",
    })
  end,
  init = function()
    -- compound/custom yaml* filetype → парсер yaml (иначе подсветка ждёт LSP ~2s)
    vim.treesitter.language.register("yaml", "yaml.ansible")
    vim.treesitter.language.register("yaml", "yaml_gitlab")
    vim.treesitter.language.register("yaml", "compose_gitlab")

    -- В новой версии подсветка включается вручную через встроенный API Neovim
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = args.match
        local lang = vim.treesitter.language.get_lang(ft) or ft
        if ft:match("^yaml") or ft == "helm" then
          lang = (ft == "helm") and "helm" or "yaml"
        end
        pcall(vim.treesitter.start, args.buf, lang)
      end,
    })
  end,
}

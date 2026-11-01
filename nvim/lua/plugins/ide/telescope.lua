return {
  -- master: совместим с nvim-treesitter main (0.1.8 ломается на ft_to_lang)
  "nvim-telescope/telescope.nvim",
  branch = "master",
  dependencies = { "nvim-lua/plenary.nvim" },
}

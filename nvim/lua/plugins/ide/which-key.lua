-- return {
--   {
--     "folke/which-key.nvim",
--     event = "VeryLazy",
--     dependencies = "echasnovski/mini.icons",
--     opts = {
--
--     },
--     spec
--     keys = {
--       {
--         "<leader>?",
--         function()
--           require("which-key").show({ global = false })
--         end,
--         desc = "Buffer Local Keymaps (which-key)",
--       },
--       {"<leader>f", group = "Find", desc = "TeleScope"}, -- group
--     },
--   }
-- }


return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = "echasnovski/mini.icons",
  opts = {
    preset = "classic",
    icons = {
      group = "",
    },
    spec = {
      { "<leader>g", group = "Git" },
      { "<leader>f", group = "Find" },
      { "<leader>d", group = "Diagnostic" },
      { "<leader>l", group = "LSP", icon = "" },
      { "<leader>w", group = "Workspace", icon = "" },
      { "<leader>t", group = "Terminal" },
      { "<leader>q", desc = "Exit" },
      { "<leader>e", desc = "File exploer" },
      { "<leader>o", desc = "Git exploer" },
      { "<leader>c", desc = "Close buffer", icon = "" },
      { "<leader>/", desc = "Comment toggle", icon = "" },
      { "<leader>x", desc = "Close any buffer", icon = "" },

    },
  },
}

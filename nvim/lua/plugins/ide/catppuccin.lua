return {
  'catppuccin/nvim',
  priority = 1000,
  opts = {
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
      light = "latte",
      dark = "frappe",
    },
    transparent_background = false, -- disables setting the background color.
    float = {
      transparent = false,          -- enable transparent floating windows
      solid = false,                -- use solid styling for floating windows, see |winborder|
    },
    term_colors = true,             -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false,              -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15,            -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,              -- Force no italic
    no_bold = false,                -- Force no bold
    no_underline = false,           -- Force no underline
    styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" },      -- Change the style of comments
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
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    color_overrides = {
      latte = {
        -- rosewater = "#C98C7F",
        -- flamingo  = "#C96E6E",
        -- pink      = "#D06DB3",
        -- mauve     = "#6A3FA8",
        -- red       = "#9E0F2C",
        -- maroon    = "#A84A52",
        -- peach     = "#B85F2A",
        -- yellow    = "#A67A2A",
        -- green     = "#3B8A35",
        -- teal      = "#2E7F7A",
        -- sky       = "#2F98C7",
        -- sapphire  = "#2E8FA8",
        -- blue      = "#2F4FB8",
        -- lavender  = "#5C6FE0",
        --
        -- text      = "#35384B",
        -- subtext1  = "#41455C",
        -- subtext0  = "#4D5268",
        -- overlay2  = "#6B6F85",
        -- overlay1  = "#777C93",
        -- overlay0  = "#858AA3",
        -- surface2  = "#9096AD",
        -- surface1  = "#9CA2B8",
        -- surface0  = "#A7ADC2",
        -- base      = "#D6D2D2",
        -- mantle    = "#E6E1E1",
        -- crust     = "#F0EDED",


      },
    },
    custom_highlights = function(colors)
      return {
        ["@property"] = { fg = colors.teal },
        ["@variable.member"] = { fg = colors.teal },

      }
    end,
    default_integrations = true,
    auto_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}

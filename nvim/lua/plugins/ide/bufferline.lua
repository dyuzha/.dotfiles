-- Для работы требуется параметр ниже (активирован в lua/core/config.lua)
-- vim.opt.termguicolors = true
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        buffer_close_icon = '',
        mode = 'buffers',
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = true,
            padding = 1
          }
        },
        diagnostics = "nvim_lsp",
        indicator = {
          icon = '  ', -- this should be omitted if indicator style is not 'icon'
          style = 'icon'
        },
        separator_style = "slope",


        --  ====== --
        --  Для BF --

        -- Вызывается при BufferLinePickClose или клике мышью на крестик
        -- close_command = "Bdelete! %d",
        --
        -- -- Опционально: если закрываете буферы кликом колесика / правой кнопкой
        -- right_mouse_command = "Bdelete! %d",
        -- middle_mouse_command = "Bdelete! %d",

      }
    },
  },
}

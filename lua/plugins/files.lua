return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {
          'filename',
          'filetype',
        },
        lualine_x = {
          'encoding',
        },
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
      extensions = {'fugitive'},
    })
  end
}

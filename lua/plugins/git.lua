return {
  "lewis6991/gitsigns.nvim",  -- GitSigns
  config = function()
    vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'GitGutterAdd' })
    vim.api.nvim_set_hl(0, 'GitSignsAddNr', { link = 'GitGutterAddNr' })
    vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'GitGutterChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { link = 'GitGutterChangeNr' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitGutterChange' })
    vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitGutterChangeNr' })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'GitGutterDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { link = 'GitGutterDeleteNr' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdelete', { link = 'GitGutterDelete' })
    vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr', { link = 'GitGutterDeleteNr' })

    -- GitSigns setup
    require('gitsigns').setup({
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '│' },
        topdelete = { text = '▲' },
        changedelete = { text = '│' },
      },
      preview_config = {
        border = 'rounded',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
    })

    -- Other (Git status window)
    vim.cmd([[
      augroup git_fugitive
        autocmd!
        autocmd BufRead,BufNewFile *.git/* setlocal nolist
      augroup END
    ]])
  end
}

-- Finish the git sometime

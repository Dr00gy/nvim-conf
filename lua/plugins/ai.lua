return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_enabled = true

    -- Keybindings
    vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Next()', { noremap = true, silent = true, expr = true })
    vim.api.nvim_set_keymap('i', '<C-K>', 'copilot#Previous()', { noremap = true, silent = true, expr = true })

    -- Enable or disable Copilot in specific files
    vim.cmd([[
      augroup copilot_exclude
        autocmd!
        autocmd FileType lua,python,javascript,typescript let g:copilot_enabled = 1 
        autocmd FileType text,markdown let g:copilot_enabled = 0 
      augroup END
    ]])
  end
}

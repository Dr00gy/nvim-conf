return {
  "kyazdani42/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({ -- Yes, I need a file dir
      disable_netrw = true,
      hijack_netrw = true,
      open_on_tab = false,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        highlight_opened_files = "all",  -- Highlight all opened files
      },
      view = {
        width = 30,
        side = "left", 
      },
    })

    -- Toggle command
    vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', '<Leader>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', '<leader>nt', ':lua require"nvim-tree.api".node.open.tab()<CR>', { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', '<leader>vs', ':lua require"nvim-tree.api".node.open.vertical()<CR>', { noremap = true, silent = true })

    vim.api.nvim_set_keymap('n', '<leader>hs', ':lua require"nvim-tree.api".node.open.horizontal()<CR>', { noremap = true, silent = true })
  end
}

return {
    "neovim/nvim-lspconfig",  -- Core LSP plugin
    dependencies = {
        "williamboman/mason.nvim",           -- Mason for managing external tools (LSP, linters, etc.)
        "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
        "hrsh7th/nvim-cmp",                  -- Completion framework
        "hrsh7th/cmp-nvim-lsp",              -- LSP source for nvim-cmp
        "L3MON4D3/LuaSnip",                  -- Snippet engine
    },
    config = function()
        -- Mason setup 
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "clangd", "pyright", "rust_analyzer", "ts_ls" },  
        })

        -- LSP configurations
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- C and C++
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

        -- Python
        lspconfig.pyright.setup({
            capabilities = capabilities,
        })

        -- Rust
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
        })

        -- TypeScript
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })

        -- LSP keybindings
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            end,
        })

        -- Errs and warnings in a window
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            update_in_insert = true,
            underline = true,
            severity_sort = true,
        })

        -- Autocomplete
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- For snippets
                end,
            },
            mapping = {
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-u>"] = cmp.mapping.scroll_docs(4),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
            },
        })
    end,
}

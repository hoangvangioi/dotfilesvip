return {
    -- bufferline
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>bp", "<cmd>BufferLineTogglePin<cr>",            desc = "Toggle pin" },
            { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", desc = "Close non-pinned buffers" },
            { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>",          desc = "Close all buffer but this" },
        },
        opts = {
            options = {
                always_show_bufferline = false,
                -- no buffer close icon
                buffer_close_icon = ' ',

                -- diagnostics = "nvim_lsp",
                -- diagnostics_indicator = function(_, _, diag)
                --     local icons = require("config.icons").icons.diagnostics
                --     local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                --         .. (diag.warning and icons.Warn .. diag.warning or "")
                --     return vim.trim(ret)
                -- end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "NvimTree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                },
            },
        },
    },

    -- indent guides for Neovim
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    "help",
                    "NvimTree",
                    "lazy",
                    "mason",
                    "toggleterm",
                },
            },
        },
        main = "ibl",
    },

    -- active indent guide and indent text objects
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },

    -- icons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    {
        'stevearc/dressing.nvim',
        event = "VeryLazy",
        opts = { },
    },
}

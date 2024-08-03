return {
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        ---@class PluginLspOpts
        opts = {
            -- options for vim.diagnostic.config()
            diagnostics = {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    source = "if_many",
                    prefix = "●",
                    -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                    -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                    -- prefix = "icons",
                },
                severity_sort = true,
            },
            -- add any global capabilities here
            capabilities = {},

            -- options for vim.lsp.buf.format
            -- `bufnr` and `filter` is handled by the LazyVim formatter,
            -- but can be also overridden when specified
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            -- LSP Server Settings
            ---@type lspconfig.options
            servers = {
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                clangd = {
                    cmd = {
                        "clangd",
                        "--header-insertion=never",
                    }
                },
            },
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
            setup = {
                -- example to setup with clangd.nvim
                -- clangd = function(_, opts)
                --   require("clangd").setup({ server = opts })
                --   return true
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
    },

    -- cmdline tools and lsp servers
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        opts = {
            ensure_installed = {
                "shfmt",
                "clang-format",
                "cmake-language-server",
            },
        },
        ---@param opts MasonSettings | {ensure_installed: string[]}
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end

            -- Because there isn't clangd. So I use gitee to download  clangd rapidly.
            local c_lsp = vim.fn.stdpath("data") .. "/mason/packages/clangd"
            if not vim.loop.fs_stat(c_lsp) then
                vim.fn.system({
                    "git",
                    "clone",
                    "https://gitee.com/Donocean/clangd.git",
                    c_lsp,
                })

                -- change clangd bin permission and link the bin file
                local clangd_path = c_lsp .. "/bin/clangd"
                local target_path = vim.fn.stdpath("data") .. "/mason/bin/clangd"
                vim.fn.system({ "chmod", "u+x", clangd_path })
                os.execute("ln -s " .. clangd_path .. " " .. target_path)
            end
        end,
    },

    -- formatters
    {
        "nvimdev/guard.nvim",
        event = "VeryLazy",
        opts = {
            -- the only options for the setup function
            fmt_on_save = false,
            -- Use lsp if no formatter was defined for this filetype
            lsp_as_default_formatter = true,
        },
        config = function(_, opts)
            local ft = require("guard.filetype")
            -- Specify clang-format file
            local cfg_path = vim.fn.stdpath("config") .. "/lua/plugins/lsp/.clang-format"

            ft("c,cpp"):fmt({
                cmd = "clang-format",
                stdin = true,
                args = { "--style=file:" .. cfg_path },
            })

            -- call setup at last
            require("guard").setup(opts)
        end,
    },

    -- rename, lsp symbol, outline, code action etc.
    {
        "nvimdev/lspsaga.nvim",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons",     -- optional
        },
        opts = {
            -- lsp symbol navigation for lualine
            symbol_in_winbar = {
                enable = true,
                show_file = false,
            },
            outline = {
                win_width = 25,
                keys = {
                    toggle_or_jump = "<leader>",
                },
            },
            rename = {
                keys = {
                    quit = "<c-c>",
                },
            },
        },
        config = function(_, opts)
            require("lspsaga").setup(opts)
        end,
    },
}

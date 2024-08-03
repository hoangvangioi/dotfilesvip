return {
    "stevearc/overseer.nvim",
    cmd = {
        "OverseerOpen",
        "OverseerClose",
        "OverseerToggle",
        "OverseerSaveBundle",
        "OverseerLoadBundle",
        "OverseerDeleteBundle",
        "OverseerRunCmd",
        "OverseerRun",
        "OverseerInfo",
        "OverseerBuild",
        "OverseerQuickAction",
        "OverseerTaskAction",
        "OverseerClearCache",
    },
    keys = {
        { "<leader>ow", "<cmd>OverseerToggle<cr>",      desc = "Task list" },
        { "<leader>oo", "<cmd>OverseerRun<cr>",         desc = "Run task" },
        { "<leader>oa", "<cmd>OverseerQuickAction<cr>", desc = "Action recent task" },
        { "<leader>oi", "<cmd>OverseerInfo<cr>",        desc = "Overseer Info" },
        { "<leader>ob", "<cmd>OverseerBuild<cr>",       desc = "Task builder" },
        { "<leader>ot", "<cmd>OverseerTaskAction<cr>",  desc = "Task action" },
        { "<leader>oc", "<cmd>OverseerClearCache<cr>",  desc = "Clear cache" },
    },
    config = function()
        local overseer = require("overseer")
        overseer.setup({
            dap = false,
            templates = {
                "user.build_file",
                "user.run_file",
                "user.clean_build",
                "user.cmake_run",
                "user.openocd_load",
                "user.idf_build",
            },
            task_list = {
                -- bindings = {
                --     ["<C-h>"] = false,
                --     ["<C-j>"] = false,
                --     ["<C-k>"] = false,
                --     ["<C-l>"] = false,
                -- },
            },
            form = {
                win_opts = {
                    winblend = 0,
                },
            },
            confirm = {
                win_opts = {
                    winblend = 0,
                },
            },
            task_win = {
                win_opts = {
                    winblend = 0,
                },
            },
        })
    end,
}
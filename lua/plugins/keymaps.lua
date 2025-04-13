return{
  "folke/which-key.nvim",
   event = "VeryLazy",
   config = function()
    require("which-key").setup({
      window = {
        position = "bottom", -- 👈 顯示在底部（靠右）
      }
    })
    local wk = require("which-key")

    wk.register({
      ["<leader>f"] = {
        name = "+find",
        f = { require("telescope.builtin").find_files, "Find Files" },
        g = { require("telescope.builtin").live_grep, "Live Grep" },
        b = { require("telescope.builtin").buffers, "Buffers" },
        h = { require("telescope.builtin").help_tags, "Help Tags" },
      },

      }, { mode = { "n" } } )

    wk.register({
      ["<leader>l"] = {
        name = "+LSP",
        k = { vim.lsp.buf.hover, "Hover" },
        g = { vim.lsp.buf.definition, "Go to Definition" },
        a = { vim.lsp.buf.code_action, "Code Action" },
        f = { vim.lsp.buf.format, "Format" },
      },
        ["<leader>g"] = {
          name = "+Git",
          p = "Preview Hunk",
          s = "Stage Hunk",
          r = "Reset Hunk",
          b = "Blame Line",
          d = "Diff This File",
          C = "Telescope Commits",
          B = "Telescope Branches",
          F = "File Git History",
          g = "Neogit Status",
        },
        ["]g"] = "Next Git Hunk",
        ["[g"] = "Previous Git Hunk",
    }, { mode = { "n", "v" } })

    wk.register({
      ["<"] = { "<gv", "Indent Left (Keep Selection)" },
      [">"] = { ">gv", "Indent Right (Keep Selection)" },
    }, { mode = "v" })
   end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
   {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
     desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

return {
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = function()
      require("smoothcursor").setup({
        type = "default", -- 可選：matrix, rainbow, flame, sonic 等
        fancy = {
          enable = true,
          head = { cursor = "▷", color = "Magenta" },
          body = {
            { cursor = "•", color = "Red" },
            { cursor = "•", color = "Orange" },
            { cursor = "•", color = "Yellow" },
          },
          tail = { cursor = "·", color = "White" }
        },
        speed = 50,
      })
    end,
  },
  {	"nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "wombat",
        },
      })
    end,
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp"
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      })
    end,
  }
  
}

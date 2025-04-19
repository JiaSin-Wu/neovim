return {
  {
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
      })
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
          -- Python
					"pyright",    --lsp
          "ruff",       --linter
          "balck",      --formatter
					"lua_ls",

          --C
					"clangd",     --lsp
          "cglang-format",    --formatter
				},
       automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.pyright.setup({capabilities = capabilities})
			lspconfig.clangd.setup({capabilities = capabilities})
			lspconfig.lua_ls.setup({capabilities = capabilities})
			lspconfig.dockerls.setup({capabilities = capabilities})
			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) 
			-- vim.keymap.set({ "n", "v" }, "<leader>gca", vim.lsp.buf.code_action, {})

      vim.diagnostic.config({
        virtual_text = true,  -- 在行尾顯示錯誤訊息
        signs = true,         -- 左邊顯示圖示
        underline = true,     -- 底線標示
        update_in_insert = false,
        severity_sort = true, -- 嚴重程度排序
      })
		end,
	},
}

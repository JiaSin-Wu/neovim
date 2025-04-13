return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
			ensure_installed = {"c","lua"},
      auto_install = true,
			sync_install = false,
    
			highlight = {
				enable = true,
				-- enter the language you want to disable highlight function
				disable = {},
			},

			indent = { enable = true },
		})
	end,
}

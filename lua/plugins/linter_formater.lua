return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
    -- self define clang-tidy as diagnostics source
    local clang_tidy = {
      method = null_ls.methods.DIAGNOSTICS,
      filetypes = { "c", "cpp" },
      generator = null_ls.generator({
        command = "clang-tidy",
        args = { "--quiet", "--", "-std=c11" },  
        to_stdin = false,
        from_stderr = true,
        format = "line",
        check_exit_code = function(code)
          return code <= 1  -- 允許返回 warning
        end,
        on_output = function(line)
          local row, col, msg = line:match(":(%d+):(%d+):%s+warning:%s+(.*)")
          if row and col and msg then
            return {
              row = tonumber(row),
              col = tonumber(col),
              message = msg,
              severity = 2,  -- 2 = warning
              source = "clang-tidy",
            }
          end
        end,
      }),
    }

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- python
        null_ls.builtins.formatting.black,  --formatter
        null_ls.builtins.diagnostics.ruff,  --linter

        --C
        clang_tidy,     --linter
        null_ls.builtins.formatting.clang_format,

      },
		})
	end,
}

vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
vim.o.showtabline = 1
vim.opt.number = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- install = { colorscheme = { "habamax" } },
  -- checker = { enabled = true },
})

require("config")

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ignored_filetypes = {
      "NvimTree", "TelescopePrompt", "lazy", "alpha", "starter", "oil"
    }

    local current_ft = vim.bo.filetype
    local icon = "🇳" -- 你喜歡的 Neovim 圖示
    local title = ""

    if vim.tbl_contains(ignored_filetypes, current_ft) then
      title = string.format("\27]0;%s Neovim\7", icon)
    else
      local filename = vim.fn.expand("%:t")
      local folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      local label = filename ~= "" and filename or ("📂 " .. folder)
      title = string.format("\27]0;%s %s\7", icon, label)
    end

    io.write(title)
  end,
})









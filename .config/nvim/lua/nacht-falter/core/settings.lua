local opt = vim.opt

-- Keep lines visible above and below cursor
opt.scrolloff = 8

-- disable mouse
-- opt.mouse = ""

-- Display the current file name in the statusline
vim.opt.statusline = vim.opt.statusline + " %f"

-- let undotree handle backups
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true
opt.incsearch = true

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance
-- opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register (not recommended)

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- opt.iskeyword:append("-") -- consider string-string as whole word

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Code folding
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- change settings for .md files
vim.cmd [[
if !exists("autocommands_loaded")
	let autocommands_loaded = 1
	autocmd BufEnter * set nowrap
	autocmd BufEnter * set foldlevel=20
	autocmd BufEnter * highlight Normal ctermbg=none
	autocmd BufEnter * highlight Normal guibg=none
	autocmd BufEnter *.md set wrap
	autocmd BufEnter *.md set linebreak
	autocmd BufEnter *.md set linebreak
	endif
	]]

vim.cmd [[
	augroup JavaScriptReactFileType
	autocmd!
	autocmd BufRead,BufNewFile [A-Z]*.js set filetype=javascriptreact
	augroup END
	]]

-- Autocommand for Packer to install plugins when packer.lua is saved
vim.cmd [[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
	]]

vim.g.python3_host_prog = "/usr/bin/python3"

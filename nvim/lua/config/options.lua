local o = vim.o

-- UI
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.ruler = true
o.cc = '80'
o.termguicolors = true
o.hlsearch = false

-- Indent
o.breakindent = true
o.tabstop = 4
o.softtabstop = 4

-- Search
o.ignorecase = true
o.smartcase = true

-- Input
o.mouse = 'a'
o.clipboard = 'unnamedplus'

-- Performance / UX
o.updatetime = 250
o.timeoutlen = 300

-- Completion menu behavior (see also cmp.completion.completeopt)
o.completeopt = 'menuone,noselect'

-- Persistent undo
o.undofile = true

-- Treesitter-based folds, everything unfolded by default
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldlevel = 99

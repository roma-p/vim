return {
  { 'numToStr/Comment.nvim', opts = {} },
  { 'tpope/vim-sleuth' }, -- auto-detect tabstop / shiftwidth
  { 'mbbill/undotree' },
  -- Python-specific indent-based folding (kept for .py buffers only; the
  -- global fold method is now treesitter-based via config/options.lua).
  { 'tmhedberg/SimpylFold', ft = 'python' },
}

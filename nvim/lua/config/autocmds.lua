local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Briefly highlight yanked text
autocmd('TextYankPost', {
  group = augroup('YankHighlight', { clear = true }),
  pattern = '*',
  callback = function() vim.highlight.on_yank() end,
})

-- Enable conceal for markdown. The old config set this via `opt_local` at
-- top level of init.lua, which only affected whatever window happened to be
-- active at startup — almost certainly a bug. This applies it cleanly to
-- markdown buffers only.
autocmd('FileType', {
  group = augroup('MarkdownConceal', { clear = true }),
  pattern = 'markdown',
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

-- Leader must be set before lazy loads any plugin (plugin keymaps bake it in).
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.lazy'

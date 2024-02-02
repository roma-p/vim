
local h_mark = require("harpoon.mark")
local h_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", h_mark.add_file, {desc=""})
vim.keymap.set("n", "<leader>hh", h_ui.toggle_quick_menu, {desc=""})
vim.keymap.set("n", "<leader>u", h_ui.nav_next, {desc=""})
vim.keymap.set("n", "<leader>y", h_ui.nav_prev, {desc=""})

return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'
      vim.keymap.set('n', '<leader>ha', mark.add_file, { desc = 'harpoon add file' })
      vim.keymap.set('n', '<leader>hh', ui.toggle_quick_menu, { desc = 'harpoon menu' })
      vim.keymap.set('n', '<leader>u', ui.nav_next, { desc = 'harpoon next' })
      vim.keymap.set('n', '<leader>y', ui.nav_prev, { desc = 'harpoon prev' })
    end,
  },
}

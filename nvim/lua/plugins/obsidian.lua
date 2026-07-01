return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      workspaces = {
        {
          name = 'icloudVault',
          path = '/Users/romainpelle/Library/Mobile Documents/iCloud~md~obsidian/Documents/RomainVault',
        },
        {
          name = 'hedgeclog_bevy',
          path = vim.fn.expand '~/projects/code/hedgeclog_bevy/project',
        },
      },
    },
  },
}

return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function() return vim.fn.executable 'make' == 1 end,
      },
    },
    config = function()
      local telescope = require 'telescope'
      local builtin = require 'telescope.builtin'

      telescope.setup {
        defaults = {
          mappings = {
            i = { ['<C-u>'] = false, ['<C-d>'] = false },
          },
        },
      }
      pcall(telescope.load_extension, 'fzf')

      -- :LiveGrepGitRoot — live_grep rooted at the current file's git root,
      -- falling back to cwd if the file isn't in a repo.
      local function find_git_root()
        local current_file = vim.api.nvim_buf_get_name(0)
        local cwd = vim.fn.getcwd()
        local current_dir = current_file == '' and cwd
          or vim.fn.fnamemodify(current_file, ':h')
        local git_root = vim.fn.systemlist(
          'git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel'
        )[1]
        if vim.v.shell_error ~= 0 then
          print 'Not a git repository. Searching on current working directory'
          return cwd
        end
        return git_root
      end

      vim.api.nvim_create_user_command('LiveGrepGitRoot', function()
        builtin.live_grep { search_dirs = { find_git_root() } }
      end, {})

      local map = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { desc = desc })
      end

      map('<leader>?', builtin.oldfiles, '[?] Find recently opened files')
      map('<leader><space>', builtin.buffers, '[ ] Find existing buffers')
      map('<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, '[/] Fuzzily search in current buffer')
      map('<leader>s/', function()
        builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
      end, '[S]earch [/] in Open Files')
      map('<leader>ss', builtin.builtin, '[S]earch [S]elect Telescope')
      map('<leader>gf', builtin.git_files, 'Search [G]it [F]iles')
      map('<leader>sf', builtin.find_files, '[S]earch [F]iles')
      map('<leader>sh', builtin.help_tags, '[S]earch [H]elp')
      map('<leader>sw', builtin.grep_string, '[S]earch current [W]ord')
      map('<leader>sg', builtin.live_grep, '[S]earch by [G]rep')
      map('<leader>sG', ':LiveGrepGitRoot<cr>', '[S]earch by [G]rep on Git Root')
      map('<leader>sd', builtin.diagnostics, '[S]earch [D]iagnostics')
      map('<leader>sr', builtin.resume, '[S]earch [R]esume')
    end,
  },
}

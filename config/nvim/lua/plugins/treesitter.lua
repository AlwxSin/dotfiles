---@diagnostic disable: missing-fields
---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    branch = 'main',
    config = function()
      local treesitter = require('nvim-treesitter')
      treesitter.setup {}
      local should_install = {
        'vim',
        'printf',
        'bash',
        'lua',
        'luadoc',
        'json',
        'jsonc',
        'sql',
        'python',
        'gitignore',
        'gitcommit',
        'gitattributes',
        'git_config',
        'go',
        'toml',
        'yaml',
        'regex',
        'markdown',
        'markdown_inline',
      }

      treesitter.install(should_install)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          if
            vim.list_contains(
              treesitter.get_installed(),
              vim.treesitter.language.get_lang(args.match)
            )
          then
            vim.treesitter.start(args.buf)
          end
        end,
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('nvim-treesitter-textobjects').setup {
        select = {
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = 'V',
          },
          include_surrounding_whitespace = true,
        },
        move = {
          set_jumps = false,
        },
      }
      do -- move
        vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
          require('nvim-treesitter-textobjects.move').goto_next_start(
            '@function.outer',
            'textobjects'
          )
          vim.cmd('normal! zz')
        end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
          require('nvim-treesitter-textobjects.move').goto_previous_start(
            '@function.outer',
            'textobjects'
          )
          vim.cmd('normal! zz')
        end)
      end
    end,
  },
  {
    'Wansmer/sibling-swap.nvim',
    config = function()
      local swap = require('sibling-swap')
      swap.setup {
        use_default_keymaps = false,
      }
      vim.keymap.set('n', '<leader>w', swap.swap_with_right_with_opp)
      vim.keymap.set('n', '<leader>q', swap.swap_with_left_with_opp)
    end,
  },
  {
    'Wansmer/treesj',
    config = function()
      require('treesj').setup { use_default_keymaps = false }
      vim.keymap.set('n', 'gJ', require('treesj').join)
      vim.keymap.set('n', 'gS', require('treesj').split)
      vim.keymap.set('n', '<leader>j', require('treesj').toggle)
    end,
  },
}

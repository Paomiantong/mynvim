-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT

local config = {}

function config.tokyonight()
  vim.cmd('colorscheme tokyonight')
end

function config.galaxyline()
  require('modules.ui.statusline')
end

function config.dashboard()
--  local home = os.getenv('HOME')
  local db = require('dashboard')
--  db.session_directory = home .. '/.cache/nvim/session'
--  db.preview_command = 'cat | lolcat -F 0.3'
--  db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
--  db.preview_file_height = 12
--  db.preview_file_width = 80
  db.custom_center = {
    {
      icon = '  ',
      desc = 'Update Plugins                          ',
      shortcut = 'SPC p u',
      action = 'Lazy update',
    },
    {
      icon = '  ',
      desc = 'Find File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
  }
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      always_show_bufferline = false,
    },
  })
end

function config.nvim_tree()
  require('nvim-tree').setup({
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
  })
end

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'GitGutterAdd', text = '▍' },
      change = { hl = 'GitGutterChange', text = '▍' },
      delete = { hl = 'GitGutterDelete', text = '▍' },
      topdelete = { hl = 'GitGutterDeleteChange', text = '▔' },
      changedelete = { hl = 'GitGutterChange', text = '▍' },
      untracked = { hl = 'GitGutterAdd', text = '▍' },
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
  })
end

function config.indent_blankline()
  require('indent_blankline').setup({
    char = '│',
    use_treesitter_scope = true,
    show_first_indent_level = true,
    show_current_context = false,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
    filetype_exclude = {
      'dashboard',
      'DogicPrompt',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'markdown',
      'txt',
      'vista',
      'help',
      'todoist',
      'NvimTree',
      'git',
      'TelescopePrompt',
      'undotree',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
    context_patterns = {
      'class',
      'function',
      'method',
      'block',
      'list_literal',
      'selector',
      '^if',
      '^table',
      'if_statement',
      'while',
      'for',
    },
  })
end

return config

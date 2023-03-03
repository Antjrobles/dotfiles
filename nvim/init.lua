require('plugins')                                -- Load plugins
require('plugins_configs')                        -- Load settings for plugins

-- CONFIGURATION --
vim.g.loaded_netrw = 1                            -- Disable netrw
vim.g.loaded_netrwPlugin = 1                      -- disable netrw    
vim.opt.termguicolors = true                      -- True color support
vim.cmd('colorscheme nightfly')                   -- Set colorscheme (order is important here)
vim.opt.number = true                             -- Show line numbers
vim.opt.title = true                              -- Show file name in title bar
vim.opt.showmode = true                           -- Don't show mode
vim.opt.showcmd = true                            -- Don't show command
vim.opt.showmatch = true                          -- Show matching brackets
vim.opt.ignorecase = true                         -- Ignore casei when searching
vim.opt.smartcase = true                          -- Smart case when searching
vim.opt.hlsearch = true                           -- Highlight search results
vim.opt.incsearch = true                          -- Incremental search (search as characters are entered)
vim.opt.mouse = 'a'                               -- Enable mouse
vim.opt.clipboard = 'unnamedplus'                 -- Copy paste between vim and everything else
vim.opt.updatetime = 300                          -- Faster completion
vim.opt.timeoutlen = 500                          -- By default timeoutlen is 1000 ms
vim.opt.scrolloff = 8                             -- Lines of context
vim.opt.sidescrolloff = 8                         -- Columns of context
vim.opt.expandtab = true                          -- Use spaces instead of tabs
vim.opt.tabstop = 2                               -- Insert 2 spaces for a tab
vim.opt.shiftwidth = 4                            -- Change the number of space characters inserted for indentation
vim.opt.smartindent = true                        -- Insert indents automatically
vim.opt.autoindent = true                         -- Copy indent from current line
vim.opt.wrap = true                               -- Disable line wrap
vim.opt.cursorline = true                         -- Enable highlighting of the current line
vim.opt.cursorcolumn = true                       -- Enable highlighting of the current column 
vim.opt.list = true                               -- Show some invisible characters (tabs...)
vim.opt.listchars = 'tab:»·,trail:·,nbsp:·'       -- Make some invisible characters visible
vim.opt.foldmethod = 'expr'                       -- Enable folding (default 'manual')
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'   -- Set the foldexpr to use treesitter
vim.opt.foldlevel = 99                            -- Open all folds by default
vim.opt.cc = '140'                                -- Set the column to 140
vim.opt.colorcolumn = '140'                       -- Set the column to 140
vim.opt.signcolumn = 'yes'                        -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.completeopt = 'menuone,noselect'          -- Completion options (for deoplete)
vim.opt.shortmess:append('c')                     -- Don't pass messages to |ins-completion-menu|.
vim.opt.syntax = 'enable'                         -- Enable syntax highlighting
vim.opt.background = 'dark'                       -- Tell vim what the background color looks like
vim.opt.spelllang = 'en'                          -- Set the default language for spell checking
vim.opt.spell = true                              -- Enable spell checking
vim.opt.undolevels = 10000                        -- More undo levels
vim.opt.wildmode = 'list:longest'                 -- Command-line completion mode (for command that support multiple file names)
vim.opt.wildmenu = true                           -- Show the possible matches when using tab completion
vim.opt.encoding = 'utf-8'                        -- The encoding displayed 
vim.opt.softtabstop = 2                           -- Insert 2 spaces for a tab
vim.opt.autowrite = true                          -- Automatically save before commands like :next and :make



-- INDENTLINE --
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]





-- MAPPINGS --

-- GENERAL --
vim.g.mapleader = ' '                             -- Leader key
vim.g.maplocalleader = ' '                        -- Local leader key

-- TREESITTER --
vim.keymap.set('n', '<leader>tr', ':NvimTreeToggle<CR>')       -- Toggle NvimTreeToggle: Leader + r


-- TELESCOPE --
vim.keymap.set('n', '<leader>tf', ':Telescope find_files<CR>')       -- Find files: Leader + f
vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<CR>')        -- Find inside files: Leader + g
vim.keymap.set('n', '<leader>tt', ':Telescope<CR>')                  -- Open Telescope: Leader + t


-- BARBAR --
vim.keymap.set('n', '<leader>n', ':BufferNext<CR>')                               -- BufferNext
vim.keymap.set('n', '<leader>c', ':BufferClose<CR>')                               -- BufferClose
vim.keymap.set('n', '<leader>cc', ':BufferCloseAllButCurrent<CR>')                 -- BufferCloseAllButCurrent
vim.keymap.set('n', '<leader>o', ':BufferOrderByBufferNumber<CR>')                 -- BufferOrderByBufferNumber
vim.keymap.set('n', '<leader>p', ':BufferPin<CR>')                                 -- BufferPin



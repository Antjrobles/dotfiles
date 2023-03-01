-- PLUGINS CONFIGS --	i
--
-- VIM AIRLINE --
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'badwolf'
vim.g.airline_cursorcolor = 1


-- INDENT LINES --
vim.g.indent_blankline_char = '▏'
vim.g.indentLine_char_list = '|', '¦', '┆', '┊'
vim.g.indent_blankline_filetype_exclude = {'help', 'terminal', 'dashboard'}
vim.g.indent_blankline_buftype_exclude = {'terminal'}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_setColors = 0
vim.g.indent_colors = {fg = '#5c6370', bg = '#282c34'}

-- BARBAR --
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)        
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)   
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)




-- NERD TREE --
-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {width = 30, mappings = {list = {{key = "u", action = "dir_up"}}}},
    renderer = {group_empty = true},
    filters = {dotfiles = true}
})




-- TREE SITTER --
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "astro", "css", "toml", "vim", "yaml", "typescript", "html",
        "terraform", "typescript", "json", "lua", "vim", "javascript"
    },
    -- Install parsers asynchrounously (only applyed to 'ensure_installed')
    sync_install = false,
    auto_install = true,
    highlight = {enable = true}
}



-- TERMINAL --
require('toggleterm').setup {open_mapping = [[<c-j>]]}
vim.g.terminal_color_0 = '#282c34'





-- TS-AUTOTAG --
require'nvim-treesitter.configs'.setup {autotag = {enable = true}}




-- JS REACT & TSX --

-- vim-javascript --
vim.g.javascript_plugin_jsdoc = 1 -- jsdoc comments
vim.g.javascript_plugin_ngdoc = 1 -- ngdoc comments
vim.g.javascript_plugin_flow = 1 -- flow comments

-- vim-jsx-pretty --
vim.g.jsx_ext_required = 0 -- jsx extension not required         
vim.g.jsx_pretty_highlight_close_tag = 1 -- highlight close tag
vim.g.jsx_pretty_highlight_first_attr = 1 -- highlight first attribute
vim.g.jsx_pretty_one_line_attr = 1 -- one line attributes

-- vom-styled-components --
vim.g.styled_components_highlight_template_literals = 1 -- highlight template literals
vim.g.styled_components_highlight_css = 1 -- highlight css
vim.g.stlyed_components_hightlight_scopes = 1 -- highlight scopes

-- vim-commentary --
-- gcc - comment current line
-- gcap - comment paragraph
-- gcip - comment inner paragraph
-- gc{motion} - comment motion




-- LSP --
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()




-- BARBECUE --
-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
    create_autocmd = false -- prevent barbecue from updating itself automatically
})

vim.api.nvim_create_autocmd({
    "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
    "BufWinEnter", "CursorHold", "InsertLeave",

    -- include these if you have set `show_modified` to `true`
    "BufWritePost", "TextChanged", "TextChangedI"
}, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function() require("barbecue.ui").update() end
})



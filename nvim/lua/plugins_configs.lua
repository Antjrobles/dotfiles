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
local opts = {
    noremap = true,
    silent = true,
    }

require'bufferline'.setup {
    animation = true,                                             -- Enable/disable animations
    auto_hide = false,                                            -- Enable/disable auto-hiding the tab bar when there is a single buffer
    tabpages = true,                                              -- Enable/disable tabpages 
    closable = true,                                              -- Enables/disable close button
    clickable = true,                                             -- Enables/disables clickable tabs 
    diagnostics = {                                               -- Options for diagnostics (or indicator errors, warnings, info)
    -- you can use a list
    {enabled = true, icon = 'ﬀ'}, -- ERROR
    {enabled = false}, -- WARN
    {enabled = false}, -- INFO
    {enabled = true},  -- HINT

    -- OR `vim.diagnostic.severity`
    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
    [vim.diagnostic.severity.WARN] = {enabled = false},
    [vim.diagnostic.severity.INFO] = {enabled = false}, 
    [vim.diagnostic.severity.HINT] = {enabled = true},
  },
    highlight_alternate = false,                                  -- Enable 
    highlight_inactive_file_icons = false,                        -- 
    highlight_visible = true,
    icons = true, 


    on_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',



    minimum_padding = 3,                                        -- Minimum padding width at the ends of the bufferline 
    maximum_length = 30,                                        -- Maximum buffer name length
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',    -- Set letters for each buffer
    no_name_title = nil,                                        -- 
}





-- NVIM TREE --
-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 40, 
        mappings = {
            list = {
                {key = "u", action = "dir_up"}
            }
        }
    },
    renderer = {group_empty = true},
    filters = {dotfiles = false},
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {}
    },

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



-- PLUGINS --
--
-- PACKER --
return require('packer').startup(function(use)
 use 'wbthomason/packer.nvim'                                         -- Package managereturn require('packer').startup(function(use)


-- THEMES --
 use 'joshdick/onedark.vim'                                           -- One dark theme
 use 'ayu-theme/ayu-vim'                                              -- Ayu theme
 use 'NLKNguyen/papercolor-theme'                                     -- Paper color theme
 use { "bluz71/vim-nightfly-colors", as = "nightfly" }                -- Nightfly theme


-- APPEARANCE  --
 use 'Yggdroot/indentLine'                                            -- Indentation lines   
 use 'vim-airline/vim-airline'                                        -- Status bar
 use 'vim-airline/vim-airline-themes'                                 -- Status bar themes
 use 'ryanoasis/vim-devicons'                                         -- File icons
 use 'kylechui/nvim-surround'                                         -- surround text with quotes, brackets, etc.
 use 'RRethy/vim-illuminate'                                          -- Highlight all instances of the word under the cursor.
 use 'norcalli/nvim-colorizer.lua'                                    -- Colorizer
 use 'nvim-tree/nvim-web-devicons'                                    -- optional, for file icons
 use 'xiyaowong/nvim-transparent'                                     -- Transparent Background

 -- TOOLS --
 use 'xiyaowong/nvim-cursorword'                                      -- Highlight the word under the cursor
 use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}           -- Buffer bar
 use 'tpope/vim-fugitive'                                             -- Git for neovim 
 use 'windwp/nvim-ts-autotag'                                         -- Use treesitter to autoclose and autorename html tag
		
		
		
-- TELESCOPE  --
use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- NVIM TREE --
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly' -- optional, updated every week. (see issue #1193)
}

-- NVIM TREESITTER --
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate'
}   
use 'RRethy/nvim-treesitter-textsubjects'                            -- Text objects for treesitter


-- TERMINAL --
use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end} 


-- PRETTIER --
use 'prettier/vim-prettier'
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}              

-- JS REACT AND TSX --
use 'peitalin/vim-jsx-typescript'                                   -- React and TSX
use 'maxmellon/vim-jsx-pretty'                                      -- React and TSX
use 'pangloss/vim-javascript'                                       -- Javascript
use 'styled-components/vim-styled-components'                       -- Styled components
use 'tpope/vim-commentary'                                          -- Comment code


-- LSP --
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- Soporte LSP
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletado
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }



-- BARBECUE --
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup()
    end,
  })

end)




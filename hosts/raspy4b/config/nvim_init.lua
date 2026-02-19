-- Configuración básica
vim.opt.number = true          -- Muestra números de línea
-- vim.opt.relativenumber = true -- Muestra números de línea relativos
vim.cmd('syntax enable')      -- Habilita el resaltado de sintaxis (alternativa a vim.opt.syntax)
vim.opt.syntax = "on"        -- Habilita el resaltado de sintaxis
vim.opt.cursorline = true      -- Resalta la línea actual
vim.opt.tabstop = 4            -- Ancho de tabulación (en espacios)
vim.opt.softtabstop = 4        -- Número de espacios por tabulación al presionar la tecla Tab
vim.opt.shiftwidth = 4         -- Número de espacios para la indentación automática
vim.opt.expandtab = true       -- Convierte tabulaciones en espacios
vim.opt.smartindent = true     -- Indentación inteligente
vim.opt.wrap = false           -- No ajusta las líneas largas (scroll horizontal)
vim.opt.swapfile = false       -- Desactiva la creación de archivos de intercambio (.swp)
vim.opt.backup = false         -- Desactiva la creación de archivos de respaldo
vim.opt.undofile = true        -- Habilita el historial de deshacer persistente
vim.opt.incsearch = true       -- Búsqueda incremental
vim.opt.hlsearch = true        -- Resalta los resultados de búsqueda
vim.opt.ignorecase = true      -- Búsqueda insensible a mayúsculas y minúsculas
vim.opt.smartcase = true       -- Búsqueda sensible a mayúsculas y minúsculas solo si hay mayúsculas en el patrón
vim.opt.termguicolors = true   -- Habilita colores verdaderos en la terminal (si es compatible)
vim.opt.showmode = true        -- Muestra el modo actual
-- Apariencia
vim.opt.background = "dark"    -- Establece el fondo a oscuro (o "light")
vim.opt.signcolumn = "yes"     -- Muestra la columna de signos (para lsp, git, etc.)

-- Comportamiento del editor
--vim.opt.scrolloff = 8          -- Mantiene 8 líneas de contexto arriba y abajo del cursor
--vim.opt.sidescrolloff = 8      -- Mantiene 8 columnas de contexto a los lados del cursor
vim.opt.wildmenu = true        -- Habilita el menú de autocompletado en la línea de comandos
vim.opt.wildmode = "longest:full,full" -- Configura el comportamiento del menú de autocompletado
vim.opt.mouse = "a"            -- Habilita el uso del ratón en todas las modalidades
vim.opt.clipboard = "unnamedplus" -- Usa el portapapeles del sistema

-- Configuración específica para Lua
--vim.opt.foldmethod = "indent"  -- Pliega el código basado en la indentación
--vim.opt.foldnestmax = 10       -- Máximo nivel de plegado
--vim.opt.foldenable = true      -- Habilita el plegado

-- Para evitar problemas con plugins que modifican opciones
vim.opt.shortmess:append "c" -- Evita mensajes de confirmación molestos

-- Visualización
-- vim.opt.list = true             -- Muestra caracteres especiales como tabulaciones y finales de línea
vim.opt.listchars = "tab:> ,eol:$,trail:·,space:_" -- Define cómo se muestran los caracteres especiales
vim.opt.showtabline = 2         -- Muestra siempre la barra de pestañas
vim.opt.winbar = "%f"           -- Muestra el nombre del archivo en la barra de título de la ventana (necesita `nvim-web-devicons` para iconos)
vim.opt.pumheight = 10          -- Altura del menú de autocompletado
vim.opt.completeopt = { "menuone", "noselect" } -- Configuración del autocompletado

-- Comportamiento
vim.opt.timeoutlen = 300        -- Tiempo máximo para reconocer un keymap (en milisegundos)
vim.opt.updatetime = 250        -- Frecuencia con la que se guardan los archivos de intercambio (en milisegundos)
vim.opt.shortmess:append "S"   -- No muestra mensajes de "search hit BOTTOM, continuing at TOP"
vim.opt.splitbelow = true       -- Abre las nuevas ventanas divididas debajo de la actual
vim.opt.splitright = true      -- Abre las nuevas ventanas divididas a la derecha de la actual
vim.opt.wildignore = { "*/node_modules/*", "*/.git/*" } -- Ignora directorios en la búsqueda de archivos

-- Edición
vim.opt.formatoptions = "qrn1"   -- Opciones de formateo de texto
vim.opt.autoindent = true
vim.opt.copyindent = true

-- UI
vim.opt.guifont = "JetBrains Mono:h12" -- Establece la fuente (ajusta el nombre y el tamaño a tu preferencia)

--Búsqueda
vim.opt.wildoptions = {'pum'} -- mejora la visualizacion del menu de autocompletado
vim.opt.inccommand = 'nosplit' -- muestra el resultado de los comandos de sustitución a medida que se escriben.

-- Línea de estado
vim.opt.statusline = "%F%m%r%h%w%=%l/%L (%p%%) %Y %b%*" -- Personaliza la línea de estado




 
-- KEYMAPS --
-- Espacio como líder
vim.g.mapleader = " "


-- Navegación entre ventanas
vim.keymap.set("n", "<leader>h", "<C-w>h") -- Moverse a la ventana de la izquierda
vim.keymap.set("n", "<leader>j", "<C-w>j") -- Moverse a la ventana de abajo
vim.keymap.set("n", "<leader>k", "<C-w>k") -- Moverse a la ventana de arriba
vim.keymap.set("n", "<leader>l", "<C-w>l") -- Moverse a la ventana de la derecha

-- Guardar y cerrar
vim.keymap.set("n", "<leader>w", ":w<CR>")     -- Guardar el archivo
vim.keymap.set("n", "<leader>q", ":q<CR>")     -- Cerrar Neovim
vim.keymap.set("n", "<leader>wq", ":wq<CR>")    -- Guardar y cerrar
vim.keymap.set("n", "<leader>x", ":x<CR>")     -- Guardar si hay cambios y cerrar

-- Buscar y reemplazar
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- Buscar archivos (requiere Telescope)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- Buscar texto en archivos (requiere Telescope)
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>") -- Buscar registros (requiere Telescope)

-- Buffers
vim.keymap.set("n", "<leader>b", "<cmd>Buffers<CR>")  -- Listar buffers (requiere un plugin como `bufferline.nvim` o `fzf.vim`)
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLinePickBuffer<CR>") -- Seleccionar buffer con BufferLine
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>") -- Cerrar buffer actual

-- Otros
vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")     -- Abrir el explorador de archivos
vim.keymap.set("n", "<leader>n", ":noh<CR>") -- Quitar el resaltado de búsqueda

-- Plegado de código
vim.keymap.set("n", "<leader>o", "za") -- Abrir/cerrar el plegado actual
vim.keymap.set("n", "<leader>O", "zA") -- Abrir/cerrar todos los plegados recursivamente
vim.keymap.set("n", "<leader>c", "zc") -- Cerrar el plegado actual
vim.keymap.set("n", "<leader>r", "zr") -- Reducir todos los plegados
vim.keymap.set("n", "<leader>m", "zm") -- Plegar todo
vim.keymap.set("n", "<leader>a", "za") -- alternar el plegado actual

--Recorrer entre buffers
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<cr>")




-- Ejemplo de configuración de autocompletado con cmp (necesita instalación aparte)
-- local cmp = require'cmp'
-- cmp.setup {
--   -- ... configuración de cmp ...
-- }

-- Ejemplo de configuración de LSP (necesita instalación aparte)
-- require'lspconfig'.pyright.setup{}

-- Ejemplo de configuración de treesitter (necesita instalación aparte)
-- require'nvim-treesitter.configs'.setup {
--   ensure_installed = { "lua", "python", "javascript", "typescript", "c", "cpp" },
--   highlight = {
--     enable = true,
--   },
-- }

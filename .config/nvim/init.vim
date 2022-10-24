" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim',{'as':'dracula'}
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/everforest'
Plug 'sainnhe/sonokai'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=2
let g:tex_conceal='abdmg'
let g:tex_superscripts="[0-9a-zA-W.,:;+-<>/()=]"
let g:tex_subscripts="[0-9aehijklmnoprstuvx,+-/().]"

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

Plug 'preservim/nerdtree'

Plug 'easymotion/vim-easymotion'
nmap f <Plug>(easymotion-s)

call plug#end()


" INDENTATION
filetype indent on
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4


" SEARCHING
" set hlsearch
" Ctrl+c to unhighlight and redraw
nnoremap <leader>c :nohl<CR><C-l>


" RENDERING
set encoding=utf-8
set linebreak
set scrolloff=3
syntax enable
set wrap


" COLOR SCHEME
if has('termguicolors')
    set termguicolors
endif
" let g:sonokai_style = "andromeda"
" let g:sonokai_better_performance = 1
colorscheme palenight


" INTERFACE
set laststatus=2
set ruler
set cursorline
set number
set relativenumber


" SPELLCHECK
set spell spelllang=en_gb
set nospell
au FileType tex set spell


" LATEX
let g:tex_flavor='latex'
let g:tex_indent_items=0
let g:tex_indent_and=0
let g:tex_indent_brace=0
au FileType tex vnoremap <C-_> :s/^/% /<CR>:noh<CR>
let g:vimtex_view_method = 'zathura'
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'


" SHORTCUTS
nnoremap <C-n> :NERDTree<CR>
nnoremap <M-n> :NERDTreeClose<CR>
nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>


" OTHER
set clipboard+=unnamedplus


" LUALINE
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
    },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
};

require('nvim-web-devicons').setup {
    default = true;
}
END



" Latex file anti-slowdown
au FileType tex setlocal nocursorline
au FileType tex setlocal nornu
au FileType tex :NoMatchParen


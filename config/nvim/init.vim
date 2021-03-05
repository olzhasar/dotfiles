call plug#begin('~/.config/nvim/plugged')

" => Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" => Appearance
Plug 'morhetz/gruvbox'
Plug 'ap/vim-buftabline'

" => Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" => Utils
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'ludovicchabant/vim-gutentags'

" => Git tools
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb' "enable GBrowse from fugitive
Plug 'junegunn/gv.vim'  "commit broswer

" => Typing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'

" => Syntax
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'cespare/vim-toml'
Plug 'lervag/vimtex'
Plug 'elixir-editors/vim-elixir'

" => Testing
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'

call plug#end()

""""""""""""""""""""""""""""""
" => Basic editor options
""""""""""""""""""""""""""""""
let g:python3_host_prog='/usr/bin/python3'

syntax on
set autoindent
filetype plugin indent on
set encoding=utf-8

set path+=**

set number
set splitright
set splitbelow

set shiftwidth=2
set softtabstop=2

set smartcase
set ignorecase

set autoread
set history=1000
set scrolloff=10

set clipboard=unnamedplus

set exrc  "look for local .vimrc files in project dir
set secure  "do not allow dangerous commands in local .vimrc

set hidden
set nobackup
set nowritebackup
set noswapfile

set pastetoggle=<F3>

set laststatus=2
set statusline=
set statusline+=\ %f
set statusline+=\ %=
set statusline+=%{FugitiveHead()}
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

""""""""""""""""""""""""""""""
" => Theme & colors
""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox

""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""
cabbrev vb vert sb
cabbrev vsf vert sf

command! Bd bp|bd # 

nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>

nnoremap <M-j> :tabprevious<CR>
nnoremap <M-k> :tabnext<CR>

nnoremap <Leader>ls :Buffers<CR>
nnoremap <Leader>bd :Bd<CR>

nnoremap <Leader>co :Copen<CR>

nnoremap <Leader>D :Dispatch<CR>

nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>le :Lexplore<CR>

nnoremap <C-f> :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <C-s> :Ag<CR>

nnoremap <Leader>gs :vertical Git<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gb :GBrowse<CR>

nnoremap <Leader>af :ALEFix<CR>

nmap <silent> gn <Plug>(ale_next)
nmap <silent> gp <Plug>(ale_previous)

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>L :TestLast<CR>

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>

autocmd FileType python nnoremap <leader>B :ALEFix black<CR>

""""""""""""""""""""""""""""""
" => Commands
""""""""""""""""""""""""""""""

command! Vimrc :e $MYVIMRC
command! SVimrc :source $MYVIMRC
command! Bashrc :e ~/.dotfiles/bash/.bashrc
command! Tmuxinator :e ~/.dotfiles/config/tmuxinator/
command! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

""""""""""""""""""""""""""""""
" => Plugin options
""""""""""""""""""""""""""""""
autocmd FileType netrw setl bufhidden=wipe

autocmd StdinReadPre * let s:std_in=1

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

let g:tex_flavor = 'latex'

let test#python#runner = 'pytest'
let test#strategy = 'dispatch'

let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "migrations"]
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_file_list_command = 'ag -l --ignore migrations'

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

""""""""""""""""""""""""""""""
" => ALE
""""""""""""""""""""""""""""""

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\   'vue': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_lint_on_enter = 0

let g:ale_lint_delay = 100

let g:signify_sign_show_count = 0

""""""""""""""""""""""""""""""
" => COC autocomplete settings
""""""""""""""""""""""""""""""

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gde <Plug>(coc-definition)
nmap <silent> gds :call CocAction('jumpDefinition', 'split') <CR>
nmap <silent> gdv :call CocAction('jumpDefinition', 'vsplit') <CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :CocCommand explorer<CR>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

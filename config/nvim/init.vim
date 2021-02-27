call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'

Plug 'Vimjas/vim-python-pep8-indent'

Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

Plug 'vim-test/vim-test'
Plug 'preservim/vimux'

Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'

Plug 'embear/vim-localvimrc'

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

set exrc  "look for local .vimrc files in project dir
set secure  "do not allow dangerous commands in local .vimrc

set hidden
set nobackup
set nowritebackup

set pastetoggle=<F3>

set statusline^=%{coc#status()}

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
let g:airline_theme='gruvbox'

""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""
cabbrev vb vert sb

nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
vnoremap <Leader>y "+y
nnoremap <Leader>ls :Buffers<CR>
nnoremap <Leader>bd :bd<CR>

nnoremap <F8> :TagbarToggle<CR>

nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>ve :Vexplore<CR>

nnoremap <Leader><Leader> :GFiles<CR>
nnoremap <Leader>fi :Files<CR>
nnoremap <Leader>H :History<CR>
nnoremap <Leader>s :BLines<CR>
nnoremap <Leader>ag :Ag<CR>
nnoremap <Leader>gf :GF?<CR>

nnoremap <Leader>gs :Git<CR>
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

command! Vimrc :vs $MYVIMRC
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

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

let g:airline_powerline_fonts = 1

let g:airline_section_a = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

let g:airline#extensions#tabline#enabled = 1  "diplay buffer names on top"
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#branch#displayed_head_limit = 10

let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#fzf#enabled = 0
let g:airline#extensions#ale#enabled = 0

let g:tex_flavor = 'latex'

let test#python#runner = 'pytest'
let test#strategy = 'vimux'

let g:localvimrc_ask=0

let g:VimuxRunnerIndex = 3

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

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

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

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
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

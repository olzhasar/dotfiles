call plug#begin('~/.config/nvim/plugged')

" => Fuzzy search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" => Appearance
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

" => Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" => Utils
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-eunuch'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-startify'
Plug 'rizzatti/dash.vim'

" => Snippets
Plug 'SirVer/ultisnips'

" => Git tools
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-rhubarb' "enable GBrowse from fugitive
Plug 'junegunn/gv.vim'  "commit broswer

" => Typing
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'

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
Plug 'rust-lang/rust.vim'
Plug 'Glench/Vim-Jinja2-Syntax'

" => Testing
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'

call plug#end()

lua require('gitsigns').setup()
lua require('bufferline').setup()

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
set relativenumber
set splitright
set splitbelow

set shiftwidth=2
set softtabstop=2

set smartcase
set ignorecase

set linebreak
set showbreak
let &showbreak = '> '

set autoread
set history=1000
set scrolloff=10

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
set termguicolors
set background=light
colorscheme papercolor

""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""
cabbrev vb vert sb
cabbrev vsf vert sf

command! Bd bp|bd # 

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap ∆ :bp<CR>
nnoremap ˚ :bn<CR>

vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

nnoremap <Leader>bd :Bd<CR>
nnoremap <Leader>b :Buffers<CR>

nnoremap <Leader>G :Goyo<CR>

nnoremap <Leader>co :Copen<CR>
nnoremap <Leader>cc :cclose<CR>

nnoremap <Leader>e :Explore<CR>
nnoremap <Leader>le :Lexplore<CR>

nnoremap <C-f> :GFiles --cached --others --exclude-standard<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>gf :GFiles?<CR>
nnoremap <silent> <Leader>ag :Ag<CR>
nnoremap <silent> <Leader>rg :Rg<CR>
nnoremap <silent> <C-s> :Rg <C-R><C-W><CR>
nnoremap <Leader>l :Lines<CR>

nnoremap <Leader>gs :vertical Git<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gb :GBrowse<CR>

nnoremap <leader>da :Dash<cr>

nnoremap <Leader>df :Gdiff<CR>
nnoremap <Leader>dt :Git difftool<CR>

nnoremap <silent><Leader>st :CocCommand tailwindCSS.headwind.sortTailwindClasses<CR>

nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>al :ALELint<CR>

nmap <silent> gn <Plug>(ale_next)
nmap <silent> gp <Plug>(ale_previous)

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>L :TestLast<CR>

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>

""""""""""""""""""""""""""""""
" => Commands
""""""""""""""""""""""""""""""

command! Vimrc :e $MYVIMRC
command! SVimrc :source $MYVIMRC
command! Bashrc :e ~/.dotfiles/bash/.bashrc
command! Tmuxinator :e ~/.dotfiles/config/tmuxinator/

""""""""""""""""""""""""""""""
" => Plugin options
""""""""""""""""""""""""""""""
autocmd FileType netrw setl bufhidden=wipe

autocmd StdinReadPre * let s:std_in=1

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

let g:fzf_history_dir = '~/.local/share/fzf-history'

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

let g:tex_flavor = 'latex'

let test#python#runner = 'pytest'
let test#strategy = 'dispatch'

let g:gutentags_project_root = ['package.json', 'pyproject.toml', '.git']
let g:gutentags_add_default_project_roots = 0
let g:gutentags_file_list_command = 'rg --files'
let g:gutentags_ctags_tagfile = '.tags'

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:startify_bookmarks = [
      \ '$MYVIMRC',
      \ '~/.dotfiles/bash/.bashrc',
      \ '~/.dotfiles/tmux/.tmux.conf',
      \ '~/.dotfiles/git/.gitignore_global',
      \]

let g:signify_sign_show_count = 0

let g:dispatch_no_tmux_make = 0

let g:coc_global_extensions = [
      \	'coc-tsserver',
      \ 'coc-pyright',
      \ 'coc-tailwindcss',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-vetur',
      \ 'coc-rust-analyzer',
      \ 'coc-clangd'
      \]

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_delay = 100

let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']

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

""""""""""""""""""""""""""""""
" => Goyo callbacks
""""""""""""""""""""""""""""""

function! s:goyo_enter()
  if exists('$TMUX')
    silent !tmux set status off
    silent !tmux resize-pane -Z
  endif
  set showtabline=0
endfunction

function! s:goyo_leave()
  if exists('$TMUX')
    silent !tmux set status on
    silent !tmux resize-pane -Z
  endif
  set showtabline=2
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

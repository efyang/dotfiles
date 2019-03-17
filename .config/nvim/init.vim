"do pip install neovim twisted argparse
"install ctags

if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo "$HOME/.config/nvim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source "$HOME/.config/nvim/init.vim"
endif

call plug#begin('$HOME/.config/nvim/plugged')

" Languages
Plug 'pangloss/vim-javascript',{'for' : ['javascript', 'html5', 'html']}
Plug 'tpope/vim-markdown',{'for' : 'markdown'}
Plug 'othree/html5.vim',{'for' : 'html5'}
"Plug 'rstacruz/sparkup', {'rtp': 'vim/', 'for' : ['css', 'html5', 'html']},
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'derekwyatt/vim-scala', {'for' : 'scala'}
Plug 'fatih/vim-go', {'for' : 'go'}
Plug 'rust-lang/rust.vim', {'for' : 'rust'}
Plug 'mattn/webapi-vim', {'for' : 'rust'}
Plug 'lukerandall/haskellmode-vim', {'for' : 'haskell'}
"Plug 'octol/vim-cpp-enhanced-highlight', {'for' : 'cpp'}
Plug 'ap/vim-css-color', {'for' : ['javascript', 'html5', 'html']}
Plug 'hail2u/vim-css3-syntax', {'for' : 'css'}
"Plug 'klen/python-mode', {'for' : 'python'}
Plug 'wlangstroth/vim-racket', {'for' : 'racket'}
Plug 'guns/vim-clojure-static', {'for' : 'clojure'}
Plug 'LaTeX-Box-Team/LaTeX-Box', {'for' : 'LaTeX'}
Plug 'vitalk/vim-shebang'
Plug 'cespare/vim-toml', {'for' : 'toml'}
Plug 'daeyun/vim-matlab', {'for': 'matlab'}

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
autocmd BufReadPost *.rs setlocal filetype=rust
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly-2019-02-08', 'rls'],
    \ 'python': ['pyls'],
    \ 'cpp': ['cquery']}

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()
nnoremap <silent> gd :call LanguageClient_textDocument_definition()
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

set cmdheight=2
" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1


" Colorschemes
Plug 'bronson/vim-crosshairs'
Plug 'geoffharcourt/one-dark.vim'
Plug 'zeis/vim-kolor'
Plug 'Yggdroot/indentline'
Plug 'junegunn/seoul256.vim'
Plug 'rhysd/wallaby.vim'
Plug 'morhetz/gruvbox'

" Exterior addons
Plug 'chaoren/vim-wordmotion'
Plug 'bling/vim-airline'
Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
Plug 'mhinz/vim-startify'
Plug 'joshhartigan/vim-reddit', {'on': 'Reddit'}
Plug 'chrisbra/Colorizer'
" Useful Programs
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    !cargo build --release
    UpdateRemotePlugins
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'floobits/floobits-neovim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Lokaltog/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
"Plug 'timonv/vim-cargo', {'for' : 'rust'}
Plug 'tomtom/quickfixsigns_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'danro/rename.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-fugitive'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'

Plug 'jeetsukumaran/vim-buffergator'
Plug 'ntpeters/vim-better-whitespace'
autocmd BufEnter * EnableStripWhitespaceOnSave
Plug 'https://github.com/rhysd/committia.vim.git'     " Better commiting messageing
let g:committia_open_only_vim_starting = 1
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
  " Additional settings
  setlocal spell

  " If no commit message, start with insert mode
  if a:info.vcs ==# 'git' && getline(1) ==# ''
    startinsert
  end

  " Scroll the diff window from insert mode
  " Map <C-n> and <C-p>
  imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
  imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)
endfunction

"Plug 'severin-lemaignan/vim-minimap'
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/limelight.vim', {'on': ['Goyo', 'LimeLight']}
Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
" Useful Programs that are mainly for insert mode
"Plug 'Raimondi/delimitmate'
"Plug 'kana/vim-smartinput'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-n>"
Plug 'honza/vim-snippets'

" All of your Plugs must be added before the following line
call plug#end()            " required
let g:plug_timeout = 360 " for YCM
set nocompatible              " be iMproved, required
set number
set backspace=indent,eol,start
if has('gui_running')
    set guifont=Inconsolata:h11,Consolas:h11,Source_Code_Pro:h11
endif
syntax on
au BufRead,BufNewFile *.nvimrc set filetype=vim
au BufRead,BufNewFile *.ss set filetype=racket
au BufRead,BufNewFile *.rkt set filetype=racket
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
" no arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" more shebang recognition
set hidden
let $RUST_SRC_PATH="/home/efyang/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
"let g:ycm_rust_src_path = "/home/efyang/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src"
AddShebangPattern! lua ^#!.*/bin/env\s\+lua\>
AddShebangPattern! haskell ^#!.*/bin/env\s\+runhaskell\>
let g:startify_change_to_dir = "$HOME"
filetype plugin indent on    " required
set laststatus=2
let g:numbers_exclude = ['tagbar', 'gundo', 'nerdtree']

" Syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Airline config
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = ' '
let g:airline_right_sep = '«'
let g:airline_right_sep = ' '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
nnoremap <leader>k :bnext<CR>
nnoremap <leader>j :bprev<CR>

"autostarts NERDTree
function StartupFns()
    if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | e
    endif
    :call AutoPairsInit()
    autocmd vimenter * :call StartupFns()
endfunction
"autostarts autopairs
autocmd vimenter * :call AutoPairsInit()
let g:AutoPairs = {'(': ')', '[': ']', '{': '}', '<': '>', "'": "'", '"': '"', '`': '`'}

"nmap <F9> :MinimapToggle<CR>
"nmap <F10> :CargoBuild<CR>
nmap <F9> :Autoformat<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F7> :Goyo<CR>
nmap <F6> :NERDTreeToggle<CR>
"nmap <c-w> <c-w><c-w>

"Goyo/limelight focus config
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
"Enclosing colors
au VimEnter * RainbowParentheses
"au BufWrite * :Autoformat
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set mouse=
let g:indentLine_char = '│'
let g:indentLine_color_gui = '#3B3D3A'
"switch buffers

"noremap <c-j> :bnext<cr>
"noremap <c-k> :bprevious<cr>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"set cursorline
"setlocal tags=rusty-tags.vi;/,path-to-rust-source-code/rusty-tags.vi
"autocmd BufWrite *.rs :silent !rusty-tags vi
" already symlinked to rustup
let g:rust_doc#downloaded_rust_doc_dir = '$HOME/Documents/rust-docs'
"quit if only quickfix windows left
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
":ccl to close quickfix windows
let g:cargo_command = "Dispatch cargo {cmd}"
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}
" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CompleteDone * pclose!

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
call deoplete#custom#option('sources', {
    \ 'python': ['LanguageClient', 'file', 'ultisnips'],
    \ 'rust': ['LanguageClient', 'file', 'ultisnips'],
    \ 'cquery': ['LanguageClient', 'file', 'ultisnips']
\})

let g:deoplete#auto_complete_start_length = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Set Colorscheme
set background=dark
colors gruvbox
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set clipboard=unnamedplus

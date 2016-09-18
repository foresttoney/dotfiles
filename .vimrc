let mapleader = "\<Space>" " Remap leader to space bar

" Install Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Initialize Plug
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
	let g:NERDTreeMinimalUI = 1
	nmap <leader>nf :NERDTreeFind<cr>
	nmap <leader>nt :NERDTreeToggle<cr>

Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	let g:deoplete#enable_at_startup = 1 
	let g:deoplete#enable_smart_case = 1

Plug 'kien/ctrlp.vim'
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

	" Set ignore files for ctrlP
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/]\.(bower_components|_build|deps|elm-stuff|git|node_modules|pub|vendor)$',
		\ 'link': 'manager'
		\ }

	" Use ag for ctrlP
	if executable('ag')
		set grepprg=ag\ --nogroup\ --nocolor
		let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	endif

	nmap <leader>f :CtrlP<cr>

Plug 'tpope/vim-fugitive'
  let g:fugitive_git_executable = 'LANG=en_US.UTF-8 git'
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gs :Gstatus<CR>

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'
	let g:syntastic_enable_elixir_checker = 0
	let g:syntastic_elixir_checkers = ['elixir']
	let g:syntastic_javascript_checkers = ['jshint']
	let g:syntastic_python_checkers = ['flake8']
	let g:syntastic_vim_checkers = ['vint']

Plug 'junegunn/goyo.vim'

Plug 'elmcast/elm-vim'
  let g:elm_format_autosave = 1

Plug 'mattn/emmet-vim'
  let g:user_emmet_expandabbr_key = '<c-e>'

Plug 'elixir-lang/vim-elixir'

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'StanAngeloff/php.vim'

Plug 'hynek/vim-python-pep8-indent'

call plug#end()

autocmd BufEnter * lcd %:p:h      " Set cwd to current buffer
filetype indent on                " Laod filetype-specific indent files
set autoread 										  " Automatic refresh
set clipboard=unnamed,unnamedplus " Use sysem clipboard
set cursorline  									" Highlight current line
set encoding=utf-8                " Use UTF-8
set expandtab     								" Replace <Tab> with spaces
set foldmethod=manual             " Use manual folding
set lazyredraw 										" Only redraw when necessary 
set mouse=                        " Disable mouse
set noswapfile      							" Disable creating of *.swp files
set number                        " Show line numbers
set shiftwidth=2                  " Indent size for << and >> 
set showmatch 										" Highlight matching [{()}]
set softtabstop=2 								" Number of spaces in tab when editing
set tabstop=2  										" Number of visual spaces per <Tab>
syntax enable                     " Enable syntax processing 

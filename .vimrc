" A (not so) minimal vimrc.
"

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
"
" We set it explicitely to make our position clear!
set nocompatible
let mapleader=' ' " Map leader key to be space

filetype indent plugin on         " Load plugins according to detected filetype.
syntax enable                  " Enable syntax highlighting.

set termguicolors
set noswapfile
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 4 spaces.
set shiftwidth  =2         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set so=10                  " Keeps cursor close to center of screen
set number                 " Numbers on side
set nuw=4                  " adds a bit of space to the left of numbers
set history=1000           " longer undo
set background=dark        " dark mode

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
" set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set formatoptions-=cro     " new lines options not include //

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set re=0                   " use regular expression engine
set list                   " Show non-printable characters.
autocmd BufWritePre * :%s/\s\+$//e " Delete whitespace


" set wildmode=longest,list

" autocmd BufWritePost * :!./node_modules/.bin/prettier % --write
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
" if &shell =~# 'fish$'
"   set shell=/bin/bash
" endif

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#temporary-files
" set backup
" set backupdir   =$HOME/.vim/files/backup/
" set backupext   =-vimbackup
" set backupskip  =
" set directory   =$HOME/.vim/files/swap//
" set updatecount =100
" set undofile
" set undodir     =$HOME/.vim/files/undo/
" set viminfo     ='100,n$HOME/.vim/files/info/viminfo

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'romainl/Apprentice'
Plug 'robertmeta/nofrils' " {{{
	let g:nofrils_heavycomments=1
	let g:nofrils_strbackgrounds=1
" }}}
Plug 'joshuavial/aider.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips' " {{{
  let g:UltiSnipsExpandTrigger="<TAB>"
  let g:UltiSnipsJumpForwardTrigger="<TAB>"
  let g:UltiSnipsJumpBackwardTrigger="<S-TAB>"
  let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
" }}}

Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'do': 'npm install -g vls', 'branch': 'release' } " {{
        nmap <Leader>gd <Plug>(coc-definition)
	nmap <Leader>gi <Plug>(coc-implementation)
	nmap <Leader>gr <Plug>(coc-references)
	nmap <Leader>gy <Plug>(coc-type-definition)
	nmap <Leader>rn <Plug>(coc-rename)
        nmap <Leader>cac  <Plug>(coc-codeaction-cursor)
	nnoremap <silent><nowait> <Leader>p :<C-u>CocListResume<CR>
        let g:coc_global_extensions = [
                \ '@yaegassy/coc-volar',
                \ '@yaegassy/coc-volar-tools',
                \ 'coc-css',
                \ 'coc-tsserver',
                \ 'coc-pyright',
                \ 'coc-eslint',
                \ 'coc-git',
                \ 'coc-html',
                \ 'coc-json',
                \ 'coc-prettier',
                \ '@yaegassy/coc-tailwindcss3',
                \ 'coc-ultisnips',
                \]
" Plug 'BurntSushi/ripgrep'
Plug 'scrooloose/nerdtree' " {{{
	let NERDTreeAutoDeleteBuffer=1
	let NERDTreeHijackNetrw=0
	let NERDTreeMapHelp='<LocalLeader>?'
	let NERDTreeQuitOnOpen=1

	nnoremap <Leader>nf :NERDTreeFind<CR>
	nnoremap <Leader>nt :NERDTreeToggle<CR>
" }}}
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vimwiki/vimwiki'
Plug 'itchyny/calendar.vim'
Plug 'markonm/traces.vim'
Plug 'junegunn/fzf.vim'" {{{
	nnoremap <silent> <C-t>     :Files<CR>
	nnoremap <silent> <Leader>b     :Buffers<CR>
	nnoremap <Leader>rgg     :Rg<Space>
        xnoremap <silent> <Leader>rg    y:Rg <C-R>"<CR>
" }}}
"
Plug 'dense-analysis/ale'
Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'

Plug 'vuciv/golf'

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Search                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
nnoremap <silent> <Leader><Space> :set hls!<CR>
nnoremap <silent> # :set hls<CR>#
nnoremap <silent> * :set hls<CR>*
nnoremap <silent> ? :set hls<CR>?
nnoremap <silent> / :set hls<CR>/
nnoremap <silent> <Leader>k :call ShowDocumentation()<CR>
nnoremap <silent> <Leader><TAB> :set relativenumber!<CR>
" nnoremap <silent> <Leader>cb :up | %bd | e# | bd# <CR>

function! ShowDocumentation()

  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction



let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}
let g:OmniSharp_server_use_mono = 1
" let g:ale_virtualtext_cursor = 1

autocmd FileType cs nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>gr :OmniSharpFindReferences<CR>
autocmd FileType cs nnoremap <buffer> <Leader>gi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>rn :OmniSharpRename<CR>
autocmd BufWritePre *.cs :OmniSharpCodeFormat

" let g:OmniSharp_highlight_types = 0
" let g:OmniSharp_diagnostic_virtual_text = 0
" let g:OmniSharp_diagnostic_enable = 0

" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
colorscheme apprentice
:hi CocErrorHighlight cterm=underline ctermfg=9
:hi Normal ctermbg=16 guibg=#111111
:hi LineNr ctermbg=16 guibg=#111111

:hi Title ctermfg=LightRed cterm=bold

" Vimwiki stuff
nnoremap <silent> <Leader>ww :vsplit<CR>:VimwikiIndex<CR>
let g:vimwiki_folding = 'syntax'
augroup VimwikiFolds
  autocmd!
  autocmd BufReadPost *.wiki if expand('%:t') ==# 'index.wiki' |
        \ setlocal foldlevel=0 |
        \ else |
        \ setlocal foldlevel=99 |
        \ endif
augroup END

:hi VimwikiHeader1 ctermfg=Red        cterm=bold
:hi VimwikiHeader2 ctermfg=LightYellow cterm=bold
:hi VimwikiHeader3 ctermfg=LightGreen  cterm=bold
:hi VimwikiHeader4 ctermfg=LightBlue   cterm=bold
:hi VimwikiHeader5 ctermfg=LightMagenta cterm=bold
:hi VimwikiHeader6 ctermfg=Cyan        cterm=bold

:hi VimwikiBold    cterm=bold ctermfg=15
:hi VimwikiItalic  cterm=italic
:hi VimwikiLink    ctermfg=DarkCyan    cterm=underline
:hi VimwikiCode    ctermfg=White       cterm=bold
:hi VimwikiPre     ctermfg=Yellow      cterm=NONE
" Internal links (default Vimwiki pages)
:hi VimwikiLink        ctermfg=Cyan     cterm=underline
autocmd FileType vimwiki setlocal conceallevel=2 concealcursor=nv
source ~/.cache/calendar.vim/credentials.vim
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" augroup VimwikiConcealExternal
"   autocmd!
"   autocmd FileType vimwiki syntax match VimwikiExternalLink /\[\[[^|]*|[^]]*\]\]/ conceal cchar=🔗
"   autocmd FileType vimwiki highlight VimwikiExternalLink ctermfg=Magenta cterm=underline
" augroup END
augroup VimwikiConcealExternal
  autocmd!
  autocmd FileType vimwiki syntax match VimwikiExternalLink /\[\[[^|]*|[^]]*\]\]/ conceal cchar=🔗
  autocmd FileType vimwiki highlight VimwikiExternalLink ctermfg=Magenta cterm=underline
augroup END



" :hi Function guifg=blue guibg=NONE gui=NONE cterm=NONE

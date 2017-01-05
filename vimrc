set nocompatible
set hidden
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'sirver/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'fatih/vim-go'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'othree/xml.vim'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
call vundle#end()
filetype plugin indent on

set foldmethod=syntax
set foldlevelstart=20

syntax enable
colorscheme ron

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" Type info on cursor position
let g:go_auto_type_info = 1
set updatetime=100

" Automatically highlight matching identifiers
let g:go_auto_sameids = 1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:SimpylFold_docstring_preview = 1
" let g:SimpylFold_fold_docstring = 0

" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8
set fileencoding=utf-8

set splitbelow
set splitright

set relativenumber
set number
highlight LineNr ctermfg=grey

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" <Leader>e for gorename
au FileType go nmap <Leader>e <Plug>(go-rename)

" <Leader>i for token info
au FileType go nmap <Leader>i <Plug>(go-info)

" <Leader>t for TagBar
nmap <Leader>t :TagbarToggle<CR>

:imap jj <Esc>

" Prevent vim from creating a swp file while editing the crontab
set backupskip=/tmp/*,/private/tmp/*


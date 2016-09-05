set nocompatible
set hidden
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
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
call vundle#end()
filetype plugin indent on
colorscheme ron
syntax on
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:go_fmt_command = "goimports"
set relativenumber
set number
highlight LineNr ctermfg=grey

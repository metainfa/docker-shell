FROM alpine:latest

MAINTAINER me@qrawl.net

RUN apk add --update bash curl git vim

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY vimrc ~/.vimrc

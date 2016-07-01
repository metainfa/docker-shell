FROM ubuntu:xenial

MAINTAINER me@qrawl.net

RUN apt-get update && apt-get install -y curl git vim

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY vimrc /root/.vimrc

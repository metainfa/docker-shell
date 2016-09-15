FROM alpine:latest

MAINTAINER Pierre Prinetti <me@qrawl.net>

RUN apk add --no-cache bash curl git python3 vim

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY vimrc /root/.vimrc

COPY bashrc /root/.bashrc

RUN vim -c VundleUpdate -c quitall

ENTRYPOINT ["bash"]

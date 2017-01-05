FROM alpine:latest

MAINTAINER Pierre Prinetti <me@qrawl.net>

RUN apk add --no-cache build-base zsh curl git go python3 vim ctags

ENV HOME=/root
ENV GOPATH=/root/go

# oh-my-zsh script seems to always return 1, even on successfull install.
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY vimrc /root/.vimrc

COPY zshrc /root/.zshrc
COPY zshenv /root/.zshenv

RUN vim -c VundleUpdate -c quitall
RUN vim -c GoInstallBinaries -c quitall

ENTRYPOINT ["zsh"]

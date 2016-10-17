FROM alpine:latest

MAINTAINER Pierre Prinetti <me@qrawl.net>

RUN apk add --no-cache zsh curl git python3 vim

ENV HOME=/root

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

COPY vimrc /root/.vimrc

COPY zshrc /root/.zshrc
COPY zshenv /root/.zshenv

RUN vim -c VundleUpdate -c quitall

ENTRYPOINT ["zsh"]

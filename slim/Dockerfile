FROM ubuntu:22.04

ARG USERNAME=auvred
ARG NEOVIM_VERSION=0.9.1

RUN apt update \
 && apt install -y \
      ca-certificates \
      curl \
      git \
      locales \
      sudo


RUN useradd -ms /bin/bash $USERNAME \
 && echo $USERNAME "ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers"
USER $USERNAME
SHELL ["/bin/bash", "-lc"]
WORKDIR /home/$USERNAME

RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.12.0 \
 && sed -i '1s;^;source $HOME/.asdf/asdf.sh\n;' ~/.bashrc

RUN asdf plugin add neovim \
 && asdf install neovim $NEOVIM_VERSION \
 && asdf global neovim $NEOVIM_VERSION

ENV MY_WORKSPACE_TYPE="dev-container-slim"
ENV MY_WORKSPACE_NAME="auvred/devcon:slim"
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

ADD "https://api.github.com/repos/auvred/dotfiles/commits?per_page=1" latest_commit
RUN sudo locale-gen en_US.UTF-8 \
 && curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash \
 && rm -rf ~/.dotfiles/.git \
 && echo ". $HOME/.asdf/asdf.sh" >> $HOME/.zshrc \
 && mkdir $HOME/.ssh \
 && sudo rm -rf /tmp/*

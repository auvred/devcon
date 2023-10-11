FROM ubuntu:22.04

ARG USERNAME=auvred
ARG NEOVIM_VERSION=0.9.2
ARG NODEJS_VERSION=18.18.0

RUN apt update \
 && apt upgrade -y \
 && apt install -y \
      build-essential \
      ca-certificates \
      curl \
      git \
      gnupg \
      libssl-dev \
      locales \
      lsb-release \
      sudo \
      unzip

RUN useradd -ms /bin/bash $USERNAME \
 && echo $USERNAME "ALL=(ALL) NOPASSWD: ALL" >> "/etc/sudoers"
USER $USERNAME
SHELL ["/bin/bash", "-lc"]
WORKDIR /home/$USERNAME

RUN git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.13.1 \
 && sed -i '1s;^;source $HOME/.asdf/asdf.sh\n;' ~/.bashrc

RUN asdf plugin add neovim \
 && asdf install neovim $NEOVIM_VERSION \
 && asdf global neovim $NEOVIM_VERSION \
 && asdf plugin add nodejs \
 && asdf install nodejs $NODEJS_VERSION \
 && asdf global nodejs $NODEJS_VERSION \
 # Remove unused OpenSSL headers to save ~34MB
 # Source: https://github.com/nodejs/docker-node/pull/1923
 # TODO: remove after https://github.com/nodejs/node/issues/46451 will be resolved
 && find $(asdf where nodejs)/include/node/openssl/archs -mindepth 1 -maxdepth 1 ! -name "linux-x86_64" -exec rm -rf {} \;

ENV MY_WORKSPACE_TYPE="dev-container"
ENV MY_WORKSPACE_NAME="auvred/devcon:latest"

ADD "https://api.github.com/repos/auvred/dotfiles/commits?per_page=1" latest_commit
RUN sudo locale-gen en_US.UTF-8 \
 && curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash \
 && echo ". $HOME/.asdf/asdf.sh" >> $HOME/.zshenv \
 && mkdir $HOME/.ssh \
 && echo "store-dir=~/.pnpm-store" > ~/.npmrc \
 && npm i -g pnpm \
 && sudo rm -rf /tmp/*

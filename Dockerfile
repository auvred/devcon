FROM ubuntu:22.04

ARG USERNAME=auvred

ARG NEOVIM_VERSION=0.9.1
ARG NODEJS_VERSION=18.17.0

RUN apt update \
 && apt upgrade -y \
 && apt install -y \
      apt-transport-https \ 
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
SHELL ["/bin/bash", "-c"]
WORKDIR /home/$USERNAME

COPY setup-asdf.sh /tmp
RUN /bin/bash /tmp/setup-asdf.sh \
 && sudo rm /tmp/setup-asdf.sh

ENV MY_WORKSPACE_TYPE="dev-container"
ENV MY_WORKSPACE_NAME="Dev Container"
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
ADD "https://api.github.com/repos/auvred/dotfiles/commits?per_page=1" latest_commit

COPY setup-stuff.sh /tmp
RUN /bin/bash /tmp/setup-stuff.sh \
 && sudo rm /tmp/setup-stuff.sh

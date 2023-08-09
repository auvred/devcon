FROM auvred/devcon:latest

ARG USERNAME=auvred

USER root

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
 && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
      https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \ 
    | tee /etc/apt/sources.list.d/docker.list > /dev/null \
 && sudo apt update \
 && apt install -y docker-ce docker-ce-cli containerd.io \
 && usermod -aG docker $USERNAME

RUN curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
 && unzip -q awscliv2.zip \
 && aws/install \
 && rm -rf awscliv2.zip aws

RUN cd /tmp \
 && curl -sL https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb -o session-manager-plugin.deb \
 && apt install -y ./session-manager-plugin.deb \
 && rm session-manager-plugin.deb

USER $USERNAME

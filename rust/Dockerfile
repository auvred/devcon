FROM auvred/devcon:latest

RUN curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | bash -s -- -y \
 && source "$HOME/.cargo/env" \
 && rustup component add rust-src

. $HOME/.asdf/asdf.sh

sudo locale-gen en_US.UTF-8
curl -o- https://raw.githubusercontent.com/auvred/dotfiles/master/install.sh | bash

echo ". $HOME/.asdf/asdf.sh" >> $HOME/.zshrc

echo "store-dir=~/.pnpm-store" > ~/.npmrc
npm i -g pnpm

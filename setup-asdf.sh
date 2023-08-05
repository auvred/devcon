git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.12.0
echo ". $HOME/.asdf/asdf.sh" >> $HOME/.bashrc
sudo /bin/bash -c 'echo ". $HOME/.asdf/asdf.sh" >> /root/.bashrc'
. $HOME/.asdf/asdf.sh

NEOVIM_VERSION=0.9.1
NODEJS_VERSION=18.17.0

asdf plugin add neovim
asdf install neovim $NEOVIM_VERSION
asdf global neovim $NEOVIM_VERSION

asdf plugin add nodejs
asdf install nodejs $NODEJS_VERSION
asdf global nodejs $NODEJS_VERSION

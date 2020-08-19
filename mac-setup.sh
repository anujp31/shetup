#!/usr/bin/env bash

touch ~/.hushlogin

if ! brew update; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sudo cp -r .config ~/        && sudo chown -R $USER ~/.config
sudo cp -r .ssh ~/           && sudo chown -R $USER ~/.ssh

sudo cp .key-bindings.zsh ~/ && sudo chown -R $USER ~/.key-bindings.zsh
sudo cp .profile ~/          && sudo chown -R $USER ~/.profile
sudo cp .zsh_plugins.txt ~/  && sudo chown -R $USER ~/.zsh_plugins.txt

brew cask install homebrew/cask-versions/adoptopenjdk8
brew install python3
brew install zsh

brew install antibody
brew install aria2
brew install autoconf
brew install aws-iam-authenticator
brew install awscli
brew install bash
brew install bat
brew install black
brew install brew-cask-completion
brew install cmatrix
brew install coreutils
brew install curl
brew install docker-completion
brew install docker-compose-completion
brew install dos2unix
brew install entr
brew install fasd
brew install fd
brew install fdupes
brew install findutils
brew install flake8
brew install fzf
brew install gawk
brew install gcc
brew install gettext
brew install git
brew install gitmoji
brew install gnu-getopt
brew install gnu-indent
brew install gnu-sed
brew install gnu-tar
brew install gnutls
brew install go
brew install graphviz
brew install grep
brew install htop
brew install httpie
brew install imagemagick
brew install jq
brew install kubernetes-cli
brew install lzo
brew install mtr
brew install nano
brew install ncurses
brew install neofetch
brew install nmap
brew install node
brew install openjdk
brew install openssl
brew install pgcli
brew install pipenv
brew install pipx
brew install pkg-config
brew install poetry
brew install postgresql
brew install pre-commit
brew install procs
brew install pyenv
brew install readline
brew install ripgrep
brew install sd
brew install shellcheck
brew install snappy
brew install speedtest-cli
brew install starship
brew install tealdeer
brew install terminal-notifier
brew install terraform
brew install tesseract
brew install tmux
brew install tree
brew install watch
brew install wget
brew install xmlto
brew install xsv
brew install xvid
brew install xz
brew install youtube-dl
brew install zlib
brew install zsh-completions
brew install zstd


brew tap homebrew/cask-fonts


brew cask install appcleaner
brew cask install authy
# brew cask install datagrip
brew cask install dbeaver-community
brew cask install docker
brew cask install evernote
brew cask install firefox
brew cask install font-hack-nerd-font
brew cask install gifox
brew cask install gimp
brew cask install google-chrome
brew cask install iina
brew cask install iterm2
brew cask install ksdiff
brew cask install macdown
# brew cask install microsoft-teams
brew cask install parsec
# brew cask install pycharm
# brew cask install royal-tsx
brew cask install sensiblesidebuttons
brew cask install slack
brew cask install snowflake-snowsql
brew cask install spotify
brew cask install the-unarchiver
brew cask install tunnelblick
brew cask install visual-studio-code
brew cask install vlc
brew cask install whatsapp
brew cask install yacreader

# iTerm integration
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
/usr/local/bin/zsh -c 'curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash'

# fasd
mkdir -p ~/.cache

# antibody
$(brew --prefix)/bin/antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# fzf
$(brew --prefix fzf)/install --all

# pyenv
cat << EOF >> ~/.bashrc

export PYTHONSTARTUP=~/.pythonrc
eval "$(pyenv init -)"
EOF

# INTERACTIVE
echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
ssh-keygen

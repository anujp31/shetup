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

brew install \
    antibody \
    aria2 \
    awscli \
    bash \
    bat \
    black \
    brew-cask-completion \
    cmatrix \
    coreutils \
    curl \
    docker-completion \
    docker-compose-completion \
    dos2unix \
    fasd \
    fd \
    findutils \
    flake8 \
    fzf \
    gawk \
    gcc \
    git \
    gnu-getopt \
    gnu-indent \
    gnu-sed \
    gnu-tar \
    go \
    grep \
    htop \
    httpie \
    imagemagick \
    jq \
    kafka \
    kompose \
    kops \
    krb5 \
    kubernetes-cli \
    lzo \
    moreutils \
    mtr \
    nano \
    neofetch \
    nmap \
    node \
    nvm \
    nzbget \
    openssh \
    openssl \
    parquet-tools \
    pigz \
    pip-completion \
    pipenv \
    pipx \
    poetry \
    postgresql \
    pre-commit \
    pyenv \
    python \
    python3 \
    readline \
    rename \
    ripgrep \
    rsync \
    speedtest-cli \
    starship \
    terminal-notifier \
    terraform \
    tmux \
    tree \
    unrar \
    vim \
    watch \
    wget \
    xsv \
    xvid \
    xz \
    youtube-dl \
    zookeeper \
    zsh \
    zsh-completions \
    zstd

brew tap homebrew/cask-fonts

brew cask install \
    appcleaner \
    authy \
    datagrip \
    dbeaver-community \
    docker \
    evernote \
    firefox \
    font-hack-nerd-font \
    geekbench \
    gifox \
    gimp \
    google-chrome \
    iina \
    iterm2 \
    keybase \
    kodi \
    ksdiff \
    macdown \
    microsoft-teams \
    parsec \
    pycharm \
    royal-tsx \
    sensiblesidebuttons \
    slack \
    snowflake-snowsql \
    spotify \
    the-unarchiver \
    tunnelblick \
    visual-studio-code \
    vlc \
    whatsapp \
    yacreader

# iTerm integration
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash
/usr/local/bin/zsh -c 'curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash'

# fasd
mkdir -p ~/.cache

# antibody
$(brew --prefix)/bin/antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# fzf
$(brew --prefix)/Cellar/fzf/0.20.0/install --all

# pyenv
cat << EOF >> ~/.bashrc

export PYTHONSTARTUP=~/.pythonrc
eval "$(pyenv init -)"
EOF

# INTERACTIVE
echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
ssh-keygen

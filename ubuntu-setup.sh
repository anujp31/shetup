#!/usr/bin/env bash

sudo apt upgrade -y

sudo apt install -y \
    build-essential \
    git \
    zsh \
    # openssh-server \
    # python3-dev \
    # postgresql-client \


# sudo ln -sf /usr/bin/fdfind /usr/bin/fd

# sudo snap install --classic aws-cli
# sudo snap install --edge black
# sudo snap install --edge fasd
# sudo snap install htop
# sudo snap install jq
# sudo snap install --classic kubectl
# sudo snap install --classic ripgrep

# linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.profile

/home/linuxbrew/.linuxbrew/bin/brew install \
    getantibody/tap/antibody \
    starship \
    bat \
    fzf \
    fd \
    neofetch \
    fasd \
    tmux \
    pigz \
    zstd \
    zsh-completions \
    jq \
    ripgrep \
    awscli \
    # pgcli \
    # black \
    # pipenv \
    # pyenv \
    # pipx \
    # pre-commit \
    # xsv \
    # go \
    # kubectl \


cat <<'EOF' >> ~/.zsh_plugins.txt
robbyrussell/oh-my-zsh path:plugins/fasd
# robbyrussell/oh-my-zsh path:plugins/colored-man-pages
# bobsoppe/zsh-ssh-agent
# robbyrussell/oh-my-zsh path:plugins/aws
# robbyrussell/oh-my-zsh path:plugins/python
# robbyrussell/oh-my-zsh path:plugins/pip
# robbyrussell/oh-my-zsh path:plugins/pyenv
# robbyrussell/oh-my-zsh path:plugins/httpie
# robbyrussell/oh-my-zsh path:plugins/nvm
# robbyrussell/oh-my-zsh path:plugins/npm
# robbyrussell/oh-my-zsh path:plugins/osx

# mafredri/zsh-async
# marzocchi/zsh-notify

zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
# zsh-users/zsh-history-substring-search

# denysdovhan/spaceship-prompt
# molovo/filthy
EOF

/home/linuxbrew/.linuxbrew/bin/antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors

cat <<'EOF'>> ~/.zshrc
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fpath=(/home/linuxbrew/.linuxbrew/share/zsh-completions $fpath)

SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

ZSH_CACHE_DIR=~/.cache

eval "$(starship init zsh)"

. ~/.zsh_plugins.sh

eval $(dircolors -b $HOME/.dircolors)

# use bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

alias ls='ls --color'
EOF

chsh -s /usr/bin/zsh

`brew --prefix`/opt/fzf/install --key-bindings --completion --update-rc --no-fish

rm -f ~/.zcompdump; compinit

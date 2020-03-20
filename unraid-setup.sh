#!/usr/bin/env bash

# put this script in /boot/config
# run manually.. adding it to /boot/config/go doesn't seem to work properly

# set up ssh
# ssh-copy-id -i ~/.ssh/id_rsa root@tower
# ssh root@tower
# chmod 700 .ssh


# install starship
curl -fsSL https://starship.rs/install.sh | bash -s -- -f

# install antibody
curl -sfL git.io/antibody | sh -s - -b /usr/local/bin

cat << EOF > ~/.zsh_plugins.txt
robbyrussell/oh-my-zsh path:plugins/fasd
robbyrussell/oh-my-zsh path:plugins/colored-man-pages
bobsoppe/zsh-ssh-agent

# KEEP THESE NEXT TO LAST
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
EOF

antibody bundle < .zsh_plugins.txt > .zsh_plugins.sh

cat << 'EOF' > .zshrc
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
. .zsh_plugins.sh
. .key-bindings.zsh
EOF

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --update-rc --no-fish

wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors
echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.zshrc

cat << EOF > .key-bindings.zsh
bindkey "^[[H"   beginning-of-line # home
bindkey "^[[3~"  delete-char       # delete
bindkey "^[[F"   end-of-line       # end
# bindkey "^[[2~"                    # insert
# bindkey "^[[5~"                    # page up
# bindkey "^[[6~"                    # page down
EOF
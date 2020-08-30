#!/usr/bin/env bash

# create microsd
# add the following to /boot partition to enable ssh + wifi
# - empty file'ssh'
# - `wpa_supplicant.conf` like so:
## country=US
## ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
## update_config=1
##
## network={
##     ssid="your_real_wifi_ssid"
##     scan_ssid=1
##     psk="your_real_password"
##     key_mgmt=WPA-PSK
## }

# /etc/rc.local (before exit 0)
## # Disable WiFi if wired.
## logger "Checking Network interfaces..."
## if ethtool eth0 | egrep "Link.*yes" && ifconfig eth0 | grep "inet"; then
##   logger 'Disabling WiFi...'
##   ifconfig wlan0 down
## else
##   logger 'WiFi is still enabled: Ethernet is down or ethtool is not installed.'
## fi

sudo raspi-config

sudo apt update -y
sudo apt upgrade -y

# fan shim
git clone https://github.com/pimoroni/fanshim-python
cd examples
sudo ./install-service.sh

sudo apt install -y \
    golang-go \
    zsh \


curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker pi

sudo reboot

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.profile


/home/linuxbrew/.linuxbrew/bin/brew install \
#    getantibody/tap/antibody \
#    starship \
    bat \
    fzf \
    fd \
    neofetch \
    fasd \
    tmux \
    zsh-completions \
    jq \
    ripgrep

/home/linuxbrew/.linuxbrew/bin/antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors

cat <<'EOF' >> ~/.zsh_plugins.txt
robbyrussell/oh-my-zsh path:plugins/fasd
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
EOF

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

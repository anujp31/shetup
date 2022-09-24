# mac setup

## First things first...
1. Install Homebrew
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

1. Install essentials
    ```bash
    brew install aria2
    brew install bat
    brew install curl
    brew install fasd
    brew install fd
    brew install findutils
    brew install fzf
    brew install git
    brew install gnu-getopt
    brew install gnu-indent
    brew install gnu-sed
    brew install gnu-tar
    brew install grep
    brew install gawk
    brew install gcc
    brew install openssl
    brew install htop
    brew install httpie
    brew install imagemagick
    brew install jq
    brew install nano
    brew install rename
    brew install ripgrep
    brew install sd
    brew install starship
    brew install terminal-notifier
    brew install tmux
    brew install tree
    brew install watch
    brew install wget
    brew install xsv
    brew install zinit
    brew install zstd

    brew install iterm2 # Better terminal
    brew install monitorcontrol # Control external monitor brighness
    brew install rectangle # Window snapping/tiling
    brew install sensiblesidebuttons # Enable mouse side buttons
    ```

1. Complete fzf install
    ```
    $(brew --prefix fzf)/install --all
    ```

1. Other stuff
    ```bash
    mkdir ~/.cache
    touch .hushlogin
    ```

1. Copy [.zshrc](mac/.zshrc) to `~/.zshrc`

1. Install iterm2 utilities
    ```bash
    zsh -c 'curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash'
    ```

Fix Home/End etc.
1. Copy [.key-bindings.zsh](mac/.key-bindings.zsh) to `~/.key-bindings.zsh`

1. Copy [DefaultKeyBinding.dict](mac/DefaultKeyBinding.dict) to `~/Library/KeyBindings/DefaultKeyBinding.dict`
You will need to `mkdir ~/Library/KeyBindings.dict`


## Other stuff
### Useful apps
```bash
brew install alt-tab # Better alt tab (actually opt+tab)
brew install appcleaner # App uninstaller
brew install dbeaver-community # Database/SQL client
brew install firefox
brew tap homebrew/cask-fonts && brew install font-hack-nerd-font # Best monospace font
brew install google-chrome
brew install google-drive
brew install hot # CPU temp / Fan monitor
brew install iina # Video player
brew install slack
brew install spotify
brew install whatsapp
brew install yacreader # Comic book reader
```

### Remote Access VPN
- [wireguard](https://apps.apple.com/us/app/wireguard/id1451685025?mt=12)
- [Tailscale](https://apps.apple.com/us/app/tailscale/id1475387142?mt=12)

### Python
```bash
brew install python
brew install pyenv
brew install pyenv-virtualenv
brew install black
brew install flake8
```

Add the following to your `~/.zshrc`
```bash
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```


### Java, Scala and other JVM
Use [sdkman](https://sdkman.io) to install and manage java, scala, maven etc.
```bash
curl -s "https://get.sdkman.io" | bash
```

Example install of java and maven:
```bash
# Install both java 8 and 18 but use java 8
sdk i java 8.332.08.1-amzn
sdk i java 18.0.1-amzn
sdk u java 8.332.08.1-amzn
# Install maven
sdk i maven 3.8.6
```

### ssh
`~/.ssh/config`
```
StrictHostKeyChecking no
ForwardAgent yes

# Share multiple sessions over a reusable connection socket (faster since you only need to auth once)
# If you have lots of concurrent connections to the same server doing heavy data transfer, disable this.
ControlMaster auto
ControlPath ~/.ssh/socket-%r@%h-%p
ControlPersist 600
```

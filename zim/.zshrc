# interactive shell config

. ~/.vivid-snazzy.sh
. ~/.fzf.zsh

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'
# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes
zstyle ':zim:ssh' ids tower

# zsh-autosuggestions
# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# zsh-syntax-highlighting
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

ZIM_HOME=~/.zim
if [[ ! ~/.zim/init.zsh -nt ~/.zimrc ]]; then
  . ${ZIM_HOME}/zimfw.zsh init -q
fi
. ${ZIM_HOME}/init.zsh

eval "$(starship init zsh)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export VIRTUAL_ENV_DISABLE_PROMPT=1

. "${HOME}/.iterm2_shell_integration.zsh"
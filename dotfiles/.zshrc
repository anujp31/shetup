TERM=xterm-256color

fpath+=~/.zfunc

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

source $HOME/.profile

SAVEHIST=100000
HISTSIZE=100000
HISTFILE=~/.zsh_history

# setopt BANG_HIST               # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE
# setopt HIST_FIND_NO_DUPS       # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
# setopt HIST_VERIFY             # Don't execute immediately upon history expansion.
# setopt HIST_BEEP               # Beep when accessing nonexistent history.

# needed for fasd
ZSH_CACHE_DIR=~/.cache

ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# autoload -U promptinit && promptinit
zstyle :plugins:ssh-agent identities id_rsa

source ~/.zsh_plugins.sh
source ~/.key-bindings.zsh

source ~/.fzf.zsh

source "${HOME}/.iterm2_shell_integration.zsh"

# export PYTHONSTARTUP=~/.pythonrc
# eval "$(pyenv init -)"

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3
# pip zsh completion end

#compdef pipenv
_pipenv() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
}
if [[ "$(basename -- ${(%):-%x})" != "_pipenv" ]]; then
#  autoload -U compinit && compinit
  compdef _pipenv pipenv
fi

#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# added by pipx (https://github.com/pipxproject/pipx)
export PATH="/Users/anuj/.local/bin:$PATH"

eval "$(starship init zsh)"

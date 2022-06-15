autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

fpath=($(brew --prefix)/share/zsh-completions $fpath)

PATH="$HOME/.local/bin:$PATH"

PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/curl/bin:$PATH"
PATH="/usr/local/sbin:$PATH"

export \
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/gnu-tar/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/grep/libexec/gnuman:$MANPATH"
MANPATH="/usr/local/opt/curl/share/man:$MANPATH"

SAVEHIST=10000
HISTSIZE=10000
HISTFILE=~/.zsh_history
# setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.

setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

ZSH_CACHE_DIR=~/.cache

eval "$(starship init zsh)"

zstyle :plugins:ssh-agent identities id_rsa # add other private ssh keys here

# use bat for man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"
alias ls='ls --color'
# alias fd='fdfind'

# FASD
eval "$(fasd --init auto)"

# ZINIT
source $(brew --prefix)/opt/zinit/zinit.zsh
zinit for \
    light-mode  zsh-users/zsh-completions \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
    light-mode  bobsoppe/zsh-ssh-agent \
    light-mode atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!' \
                trapd00r/LS_COLORS \
    light-mode from"gh-r" as"program" \
                junegunn/fzf-bin
    light-mode  marzocchi/zsh-notify
    # light-mode pick"async.zsh" src"pure.zsh" \
    #             sindresorhus/pure \

. ~/.key-bindings.zsh

# FZF
. ~/.fzf.zsh
alias fzfpbat="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ALIASES
alias ls='ls --color'

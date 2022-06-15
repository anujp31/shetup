# # autoload zkbd
# # typeset -g -A key
# # bindkey -e
#
# #bindkey '^H' delete-word # iterm
# #bindkey '^[[3~' delete-char # tmux
#
# # Skip forward/back a word with opt-arrow
# # bindkey '^[[1;9D' backward-word # iterm
# # bindkey '[D' backward-word
# bindkey '^[^[[D' backward-word # tmux os x
# # bindkey '^[[1;3D' backward-word # tmux ubuntu
#
# # bindkey '^[[1;9C' forward-word # iterm
# # bindkey '[C' forward-word
# bindkey '^[^[[C' forward-word # tmux os x
# # bindkey '^[[1;3C' forward-word # tmux ubuntu
#
# # bindkey '^[[1;5C' forward-word # [Ctrl-RightArrow] - move forward one word
# # bindkey '^[[1;5D' backward-word # [Ctrl-LeftArrow] - move backward one word
#
# # Skip to start/end of line with cmd-arrow
# # bindkey '[E' beginning-of-line
# bindkey '^[[H' beginning-of-line # iterm [Home]
# bindkey '^[[1~' beginning-of-line # tmux
#
# # bindkey '[F' end-of-line
# bindkey '^[[F' end-of-line # iterm [End]
# bindkey '^[[4~' end-of-line # tmux
#
#
#
# # # Delete word with opt-backspace/opt-delete
# # bindkey '[G' backward-kill-word
# # bindkey '[H' kill-word
#
# # # Delete line with cmd-backspace
# # bindkey '[I' kill-whole-line
#
# # bindkey will list all existing mappings
# # bindkey -l will give you a list of existing keymap names.
# # bindkey -M <keymap> will list all the bindings in a given keymap.
# # use zle -al to get all commands




##################################################################################33



# From https://github.com/reenhanced/zsh-config/blob/master/lib/key-bindings.zsh
# TODO: Explain what some of this does..

# bindkey -e
# bindkey '\ew' kill-region

# ^j ^i ^m ^, ^. cannot be used
# alias ←="pushd -q +1"
# alias →="pushd -q -0"
# alias ↑="cd .."
# bindkey -s '^u' "↑\n"
# bindkey -s '^b' "←\n"
# bindkey -s '^f' "→\n"
# bindkey -s '^k' "ls\n"
# bindkey -s '\ev' "vim\n"

# bindkey '^r' history-incremental-search-backward
# bindkey "^[[5~" up-line-or-history
# bindkey "^[[6~" down-line-or-history

# make search up and down work, so partially type and hit up/down to find relevant stuff
# bindkey '^[[A' up-line-or-search
# bindkey '^[[B' down-line-or-search

# bindkey "^[[H" beginning-of-line
# bindkey "^[[1~" beginning-of-line
# bindkey "^[OH" beginning-of-line
# bindkey "^[[F"  end-of-line
# bindkey "^[[4~" end-of-line
# bindkey "^[OF" end-of-line
# bindkey ' ' magic-space    # also do history expansion on space

# bindkey "^[[1;5C" forward-word
# bindkey "^[[1;5D" backward-word

# bindkey '^[[Z' reverse-menu-complete

# Make the delete key (or Fn + Delete on the Mac) work instead of outputting a ~
# bindkey '^?' backward-delete-char
# bindkey "^[[3~" delete-char
# bindkey "^[3;5~" delete-char
bindkey "\e[3~" delete-char

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'


# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -e                                            # Use emacs key bindings

bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
if [[ "${terminfo[kpp]}" != "" ]]; then
  bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
fi
if [[ "${terminfo[knp]}" != "" ]]; then
  bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi

bindkey ' ' magic-space                               # [Space] - do history expansion

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

# file rename magick
bindkey "^[m" copy-prev-shell-word

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
#

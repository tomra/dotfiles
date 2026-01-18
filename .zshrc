source ${HOME}/.zsh_aliases

# Customize to your needs...

eval "$(/opt/homebrew/bin/brew shellenv)"

# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE=32768
export SAVEHIST=32768
export HISTFILE="${HOME}/.zsh_history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_SPACE      # Ignore commands starting with space
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks
setopt SHARE_HISTORY          # Share history across terminals (optional)

## pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# delete a word with '/' as delimeter
autoload -U select-word-style
select-word-style bash

# basic auto/tab complete:
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# optional integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshlocal ] && source ~/.zshlocal

# load zsh plugins
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# prompt
eval "$(starship init zsh)"

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

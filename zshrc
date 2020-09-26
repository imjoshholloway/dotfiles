# ensure homebrew is setup correctly for linux
test -d $HOME/.linuxbrew && eval $($HOME/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
command -v brew &> /dev/null && export BREW_PREFIX=$(brew --prefix)

eval $($BREW_PREFIX/bin/brew shellenv)

export DOTFILES=$HOME/dotfiles
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$HOME/bin:$BREW_PREFIX/bin:$PATH"

export ZPLUG_HOME=$BREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh

#zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "bobsoppe/zsh-ssh-agent", use:ssh-agent.zsh, from:github
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# END OF ZPLUG STUFF

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=240'

zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
# do not autoselect the first completion entry
unsetopt menu_complete
unsetopt flowcontrol
# show completion menu on successive tab press
setopt auto_menu
setopt complete_in_word
setopt always_to_end
setopt complete_aliases

# ============
# key bindings
# ============
bindkey -v

# Let backspace work after switching from insert to normal mode
# See: https://github.com/denysdovhan/spaceship-prompt/issues/91
bindkey "^?" backward-delete-char

#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
#bindkey "^[[3~" delete-char
#bindkey '^[[1;5C' forward-word
#bindkey '^[[1;5D' backward-word

# =======
# history
# =======
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first

# ignore duplication command history list
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

# share command history data
setopt share_history

# respect gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# =======
# aliases
# =======
alias reload="source $HOME/.zshrc"
alias aws_whoami="aws sts get-caller-identity"
alias k="kubectl"
alias kctx="kubectx"
alias vim="nvim"

export NVM_DIR="$HOME/.nvm"
test -f $BREW_PREFIX/opt/nvm/nvm.sh && source $BREW_PREFIX/opt/nvm/nvm.sh

# ===========================
# local only sensitive things
# ===========================
test -f $HOME/.localrc && source $HOME/.localrc

# configure fzf
test -f $HOME/.fzf.zsh && source $HOME/.fzf.zsh

# finally.. init the prompt
eval "$(starship init zsh)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

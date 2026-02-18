# install zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

HOMEBREW_PREFIX="/opt/homebrew"
PROTO_PREFIX="$HOME/.proto"

export GOPATH=$HOME/go

export PATH="$GOPATH/bin:$HOME/bin:$HOME/.local/bin:$HOMEBREW_PREFIX/bin:$PROTO_PREFIX/bin:$PATH"

zinit_plugins=(
  bobsoppe/zsh-ssh-agent
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
  softmoth/zsh-vim-mode
  sindresorhus/pure
)

for plugin in $zinit_plugins; do
  zinit light $plugin
done

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

autoload -Uz compinit
compinit

# ============
# key bindings
# ============
bindkey -v

# Let backspace work after switching from insert to normal mode
# See: https://github.com/denysdovhan/spaceship-prompt/issues/91
bindkey "^?" backward-delete-char

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
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
alias aws_whoami="aws sts get-caller-identity"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias vim="nvim"
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias docker="podman"

eval "$(proto activate zsh)"

# ===========================
# local only sensitive things
# ===========================
test -f $HOME/.localrc && source $HOME/.localrc

fpath+=("$HOMEBREW_PREFIX/share/zsh/site-functions")

autoload -U promptinit; promptinit
prompt pure


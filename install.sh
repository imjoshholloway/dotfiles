#!/usr/bin/env bash
set -e

echo ''

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

overwrite_all=false
backup_all=false
skip_all=false

link () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]; then
      local current="$(readlink $dst)"

      if [ "$current" == "$src" ]; then
	skip=true;
      else
        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action < /dev/tty

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac
      fi
    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]; then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]; then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]; then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]; then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}

homebrew () {
  if ! [ -x "$(command -v brew)" ]; then
    info "Installing homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  brew bundle --file="$DOTFILES_DIR/Brewfile"
}

DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_REPO="https://github.com/imjoshholloway/dotfiles.git"

if [ ! -d "$DOTFILES_DIR/.git" ]; then
    info "Cloning dotfiles into $DOTFILES_DIR"
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
elif [ "$PWD" != "$DOTFILES_DIR" ]; then
    info "Updating dotfiles"
    git -C "$DOTFILES_DIR" pull --ff-only
fi

cd "$DOTFILES_DIR"

mkdir -p $HOME/.config

# dots are configs that live as a .<name> under ~/
dots=("zshrc" "gitconfig")
# configs live under ~/.config/<name>
configs=("ghostty")

# install the top level dotfiles
for f in ${dots[@]}; do
    link "${PWD}/${f}" "${HOME}/.${f}"
done

# install configs
for f in ${configs[@]}; do
    link "${PWD}/${f}" "${HOME}/.config/${f}"
done

link "${PWD}/claude" "${HOME}/.claude"

homebrew

# supress login messages
touch ~/.hushlogin

echo ''
echo '  All installed!'

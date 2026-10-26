#!/usr/bin/env bash
set -euo pipefail

# Ubuntu installer. Required tools must already be installed.
for tool in vim git curl; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        printf 'Missing required command: %s (nothing was installed).\n' "$tool" >&2
        exit 1
    fi
done

if [[ ! -t 0 || ! -t 1 ]]; then
    printf 'Run in an interactive terminal: bash <(curl -fsSL https://raw.githubusercontent.com/CoderDxx/myvim/main/install.sh)\n' >&2
    exit 1
fi

stage=$(mktemp -d)
trap 'rm -rf -- "$stage"' EXIT
repo_url="https://raw.githubusercontent.com/CoderDxx/myvim/${MYVIM_REF:-main}"

# Download both files before replacing the user's configuration.
curl -fsSL --retry 3 "$repo_url/.vimrc" -o "$stage/vimrc"
curl -fsSL --retry 3 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o "$stage/plug.vim"
[[ -s "$stage/vimrc" && -s "$stage/plug.vim" ]]

# First launch needs only plugin declarations: themes do not exist yet.
printf 'set nocompatible\n' > "$stage/bootstrap.vim"
awk '/^call plug#begin\(/,/^call plug#end\(/' "$stage/vimrc" >> "$stage/bootstrap.vim"
if ! grep -q '^call plug#end(' "$stage/bootstrap.vim"; then
    printf 'Invalid .vimrc: vim-plug declaration block is missing.\n' >&2
    exit 1
fi

if [[ -e "$HOME/.vimrc" || -L "$HOME/.vimrc" ]]; then
    backup="$HOME/.vimrc.backup.$(date +%Y%m%d%H%M%S).$$"
    cp -- "$HOME/.vimrc" "$backup"
    printf 'Previous configuration backed up to %s\n' "$backup"
fi
mkdir -p -- "$HOME/.vim/autoload"
cp -- "$stage/plug.vim" "$HOME/.vim/autoload/plug.vim"
# Replace a symlink itself rather than writing into its target.
if [[ -L "$HOME/.vimrc" ]]; then
    rm -- "$HOME/.vimrc"
fi
cp -- "$stage/vimrc" "$HOME/.vimrc"

printf 'Opening Vim to run PlugInstall. Check its results; retry :PlugInstall if any download fails.\n'
vim -N -u "$stage/bootstrap.vim" -c 'PlugInstall --sync' -c 'source $HOME/.vimrc'

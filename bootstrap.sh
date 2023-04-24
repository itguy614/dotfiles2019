#!/bin/sh

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

mkdir -p $HOME/.local/bin
ln -sf $DOTFILES/scripts/t $HOME/.local/bin/t

rm $HOME/.gitignore
ln -s $DOTFILES/.global-gitignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

rm $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

rm -Rf $HOME/.git_template
ln -s $HOME/.dotfiles/.git_template $HOME/.git_template

rm $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

rm $HOME/.vim
ln -s $HOME/.dotfiles/.vim $HOME/.vim

rm -Rf $HOME/.config/kitty
ln -s $DOTFILES/kitty $HOME/.config/kitty

rm $HOME/.hyper.js
ln -s $HOME/.dotfiles/.hyper.js $HOME/.hyper.js

ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf

echo "Installing Vundle"
rm -Rf $HOME/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# ctag prefs
rm $HOME/.ctags
ln -s $HOME/.dotfiles/.ctags $HOME/.ctags

# editorconfig prefs
rm $HOME/.editorconfig
ln -s $HOME/.dotfiles/.editorconfig $HOME/.editorconfig

# php_cs config
rm $HOME/.php_cs
ln -s $HOME/.dotfiles/.php_cs $HOME/.php_cs

rm $HOME/.env
ln -s $HOME/.dotfiles/.env $HOME/.env

rm $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

case `uname` in
    Darwin)
#        source $HOME/.dotfiles/bootstraps/osx.sh
    ;;
esac

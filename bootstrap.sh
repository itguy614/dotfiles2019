#!/bin/sh

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Add global gitignore
rm $HOME/.gitignore
ln -s $HOME/.dotfiles/.global-gitignore $HOME/.gitignore
git config --global core.excludesfile $HOME/.gitignore

# git config
rm $HOME/.gitconfig
ln -s $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

# Symlink vim prefs
rm $HOME/.vimrc
ln -s $HOME/.dotfiles/.vimrc $HOME/.vimrc

rm $HOME/.vim
ln -s $HOME/.dotfiles/.vim $HOME/.vim

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
        source $HOME/.dotfiles/bootstraps/osx.sh
    ;;
esac

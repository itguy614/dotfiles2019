#!/bin/sh

echo 'Install homebrew'
sudo rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

echo 'Installing taps'
brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/core
brew tap homebrew/services


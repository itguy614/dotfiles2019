#!/bin/sh

echo 'Installing apps'
unixutils=(
    1password
    appcleaner
    betterzip
    caffeine
    cheatsheet
    dash
    docker
    dropbox
    evernote
    firefox
    google-chrome
    iterm2
    omnigraffle
    royal-tsx
    spectacle
    sublime-text
    superduper
    suspicious-package
    transmission
    tunnelblick
    valentina-studio
    visual-studio-code
)
brew cask install ${unixutils[@]}

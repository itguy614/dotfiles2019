#!/bin/sh

echo 'Installing fonts'
fonts=(
    font-3270
    font-anka-coder
    font-anonymous-pro
    font-dejavusansmono-nerd-font
    font-dejavusansmono-nerd-font-mono
    font-fira-code
    font-fira-mono
    font-fira-sans
    font-fontawesome
    font-go
    font-hack
    font-inconsolata
    font-input
    font-noto-mono
    font-noto-sans
    font-roboto
    font-source-sans-pro
    font-terminus
    font-ubuntu
)
brew cask install ${fonts[@]}

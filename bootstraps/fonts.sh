#!/bin/sh

echo 'Installing fonts'
fonts=(
    font-3270
    font-anka-coder
    font-anonymous-pro
    font-dejavu-sans-mono-nerd-font
    font-fira-code
    font-fira-mono
    font-fira-sans
    font-fontawesome
    font-go
    font-hack
    font-inconsolata
    font-noto-mono
    font-noto-sans
    font-terminus
)
brew install ${fonts[@]}

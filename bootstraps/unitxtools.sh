#!/bin/sh

echo 'Installing default unix tools'
unixutils=(
    coreutils
    findutils
    osxutils
)
brew install ${unixutils[@]}

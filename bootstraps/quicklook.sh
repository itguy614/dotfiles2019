#!/bin/sh

echo 'Installing quicklook tools'
unixutils=(
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    webpquicklook
)
brew install ${unixutils[@]}

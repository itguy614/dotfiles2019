#!/bin/sh

echo 'Install Xcode command line tools'
xcode-select -p
if [[ $? -ne 0 ]]; then
  xcode-select --install
fi

xcodebuild -version
if [[ $? -ne 0 ]]; then
    # Accept Xcode license
    sudo xcodebuild -license
fi

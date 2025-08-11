#!/usr/bin/env bash
set -e

# Install dependencies
sudo apt update && sudo apt install -y curl unzip xz-utils zip git

# Install Flutter stable
git clone https://github.com/flutter/flutter.git -b stable $HOME/flutter

# Add Flutter to PATH
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> $HOME/.bashrc
source $HOME/.bashrc

# Pre-download Flutter dependencies
flutter doctor
flutter precache
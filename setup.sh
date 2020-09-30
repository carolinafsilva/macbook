#!/usr/bin/env zsh

# commandline tools
xcode-select --install

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# packages
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/CarolinaFSilva/macbook/master/setup/homebrew/taps.sh)"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/CarolinaFSilva/macbook/master/setup/homebrew/formulas.sh)"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/CarolinaFSilva/macbook/master/setup/homebrew/casks.sh)"

# dotfiles
git clone --bare https://github.com/CarolinaFSilva/dotfiles $HOME/.dotfiles
git --git-dir=$HOME/.dotfiles --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/.dotfiles --work-tree=$HOME reset --hard

# programming
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/CarolinaFSilva/macbook/master/setup/programming.sh)"

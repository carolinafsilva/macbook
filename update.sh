#!/usr/bin/env zsh

### Homebrew

## taps.sh

brew tap | xargs -I '{}' echo "brew tap {}" > setup/homebrew/taps.sh
chmod +x setup/homebrew/taps.sh

## formulas.sh

brew leaves | sed -e 's/@.*//' -e 's|\(.*/\)*||' | xargs -I '{}' echo "brew install {}" > setup/homebrew/formulas.sh
chmod +x setup/homebrew/formulas.sh

## casks.sh

brew list --cask | xargs -I '{}' echo "brew cask install {}" > setup/homebrew/casks.sh
chmod +x setup/homebrew/casks.sh


### Programming.sh

## Opam

# remove packages list
grep -v -e "opam install -y" setup/programming.sh > /tmp/programming.sh

# add current packages
opam list -s --roots | xargs -I '{}' sed -i "" -e '/^opam pin add/a\
opam install -y {}' /tmp/programming.sh

# Update file
mv /tmp/programming.sh setup/programming.sh

## Python

# remove packages list
grep -v -e "python3 -m pip install" setup/programming.sh > /tmp/programming.sh

# add current packages
pip-chill --no-version | xargs -I '{}' sed -i "" -e '/^# python/a\
python3 -m pip install {}' /tmp/programming.sh

# Update file
mv /tmp/programming.sh setup/programming.sh

## VSCode extensions

# remove extensions list
grep -v -e "--install-extension" setup/programming.sh > /tmp/programming.sh

# add current extensions to list
code --list-extensions | xargs -I '{}' sed -i "" -e '/^code \\/a\
\ \ \ \ --install-extension {} \\' /tmp/programming.sh

# remove last \
sed -i "" -e "$(sed -n '/--install-extension/=' /tmp/programming.sh | tail -n 1)"'s/ \\//' /tmp/programming.sh

# Update file
mv /tmp/programming.sh setup/programming.sh

## Making script executable
chmod +x setup/programming.sh

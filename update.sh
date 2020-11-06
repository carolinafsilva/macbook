#!/usr/bin/env zsh

#
# This script updates the scripts files inside the setup folder used to
# bootstrap MacOS with the packages currently installed on the system
#

### Homebrew

## taps.sh

brew tap | xargs -I '{}' echo 'brew tap {}' > setup/homebrew/taps.sh
chmod +x setup/homebrew/taps.sh

## formulas.sh

brew leaves | sed -e 's/@.*//' -e 's|\(.*/\)*||' | xargs -I '{}' echo 'brew install {}' > setup/homebrew/formulas.sh
chmod +x setup/homebrew/formulas.sh

## casks.sh

brew list --cask | xargs -I '{}' echo 'brew cask install {}' > setup/homebrew/casks.sh
chmod +x setup/homebrew/casks.sh

### Appstore.sh

mas list | awk '{ printf("%s # %s\n", $1, $2) }' | xargs -I '{}' echo 'mas install {}' > setup/appstore.sh

### Programming.sh

## Cron

# remove crontab configuration
sed -i '' -e "0$(sed -n '/^crontab <<EOF/=' setup/programming.sh),0$(sed -n '/^EOF/=' setup/programming.sh)d" setup/programming.sh

# add current crontab configuration
{ echo 'crontab <<EOF'; crontab -l; echo 'EOF' } | tail -r | xargs -I '{}' sed -i '' -e '/^# cron/a\
{}' setup/programming.sh

## Opam

# remove packages list
sed -i '' -e '/opam install -y.*$/d' -e '/opam pin add -y.*$/d' setup/programming.sh

# add pinned packages
opam list --pinned | awk 'NR > 2 { printf("%s %s\n", $1, $8) }' | xargs -I '{}' sed -i '' -e '/opam init/a\
opam pin add -y {}' setup/programming.sh

# add current packages
opam list -s --roots | xargs -I '{}' sed -i '' -e '/^opam pin add/a\
opam install -y {}' setup/programming.sh

## Python

# remove packages list
sed -i '' -e '/python3 -m pip install.*$/d' setup/programming.sh

# add current packages
pip-chill --no-version | xargs -I '{}' sed -i '' -e '/^# python/a\
python3 -m pip install {}' setup/programming.sh

## VSCode extensions

# remove extensions list
sed -i '' -e '/--install-extension.*$/d' setup/programming.sh

# add current extensions to list
code --list-extensions | xargs -I '{}' sed -i '' -e '/^code \\/a\
\ \ \ \ --install-extension {} \\' setup/programming.sh

# remove last \
sed -i '' -e "$(sed -n '/--install-extension/=' setup/programming.sh | tail -n 1)"'s/ \\//' setup/programming.sh

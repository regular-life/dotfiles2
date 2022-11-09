#!/bin/sh
sudo pacman -S xbindkeys xsel xdotool
touch ~/.xbindkeysrc
echo "\"echo -n | xsel -n -i; pkill xbindkeys; xdotool click 2; xbindkeys\"
b:2 + Release" > ~/.xbindkeysrc
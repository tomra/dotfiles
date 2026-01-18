#!/bin/bash

set -eo pipefail

icon_path=/Applications/kitty.app/Contents/Resources/kitty.icns
if [ ! -f "$icon_path" ]; then
  echo "Can't find existing icon, make sure kitty is installed"
  exit 1
fi

echo "Replace icon"
icon_url=~/SynologyDrive/pictures/kitty.png
cp $icon_url $icon_path

killall Finder
killall Dock

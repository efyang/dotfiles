#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

firefox-nightly -createprofile default
for directory in $(find ~/.mozilla/firefox -maxdepth 1 -mindepth 1 -name '*.*' -type d); do
    mkdir -p "$directory/chrome"
    cp -f "$DIR/userChrome.css" "$directory/chrome/userChrome.css"
done

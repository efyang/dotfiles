#!/usr/bin/env bash
read WIDTH HEIGHT <<<$(xrandr | grep \* | awk '{print $1}' | tr "x" " ")
let XGAP="$WIDTH - (268 + $WIDTH/30)"
let YGAP="($HEIGHT - 620)/2"
echo "$XGAP $YGAP"
if [ "$XGAP" -gt 0 ] && [ "$YGAP" -gt 0 ]; then
    sed -e "s/gap_x=1588/gap_x=$XGAP/g" "$HOME/scripts/conky-default-config" | sed -e "s/gap_y=230/gap_y=$YGAP/g" > "$HOME/.conkyrc"
else
    \cp "$HOME/scripts/conky-default-config" "$HOME/.conkyrc"
fi
sleep 15
conky -d

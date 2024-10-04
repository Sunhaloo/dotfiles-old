#!/bin/bash

if grep -q 'background_opacity 0.7' ~/.config/kitty/themes/current-theme.conf; then
	sed -i 's/background_opacity 0.7/background_opacity 0.9/g' ~/.config/kitty/themes/current-theme.conf
	echo "Done! Reload kitty config!"
elif grep -q 'background_opacity 0.9' ~/.config/kitty/themes/current-theme.conf; then
	sed -i 's/background_opacity 0.9/background_opacity 0.7/g' ~/.config/kitty/themes/current-theme.conf
	echo "Done! Reload kitty config!"
else
	echo "There's no background_opacity present in the current kitty theme..."
fi

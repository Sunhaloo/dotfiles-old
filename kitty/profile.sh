#!/bin/bash

echo "Select a profile:"
echo "   (1) Coding"
echo "   (2) Screen Sharing"
read -r profile

if [ "$profile" -eq 1 ]; then
    rm ~/.config/kitty/kitty.conf && echo "removed kitty.conf" || echo "Failed to remove kitty.conf"
    cp ~/.config/kitty/config-file/kitty-zone.conf ~/.config/kitty/kitty.conf && echo "added kitty-zone.conf" || echo "Failed to add kitty-zone.conf"

    if grep -q 'background_opacity 0.7' ~/.config/kitty/themes/current-theme.conf; then
        sed -i 's/background_opacity 0.7/background_opacity 1/g' ~/.config/kitty/themes/current-theme.conf
        echo "Opacity changed to 1. Reload kitty config!"
    else
        echo "background_opacity 0.7 not found..."
    fi

elif [ "$profile" -eq 2 ]; then
    rm ~/.config/kitty/kitty.conf && echo "removed kitty.conf" || echo "Failed to remove kitty.conf"
    cp ~/.config/kitty/config-file/kitty-show.conf ~/.config/kitty/kitty.conf && echo "added kitty-show.conf" || echo "Failed to add kitty-show.conf"

    if grep -q 'background_opacity 1' ~/.config/kitty/themes/current-theme.conf; then
        sed -i 's/background_opacity 1/background_opacity 0.7/g' ~/.config/kitty/themes/current-theme.conf
        echo "Opacity changed to 0.7. Reload kitty config!"
    else
        echo "background_opacity 1 not found..."
    fi

else
    echo "Invalid option! Please choose 1 or 2."
fi

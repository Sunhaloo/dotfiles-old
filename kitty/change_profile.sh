#!/bin/bash

echo "Select a profile:"
echo "   (1) Coding"
echo "   (2) Screen Sharing"
read -r profile

if [ "$profile" -eq 1 ]; then
    rm ~/.config/kitty/kitty.conf && echo "removed kitty.conf" || echo "Failed to remove kitty.conf"
    cp ~/.config/kitty/config-file/kitty-zone.conf ~/.config/kitty/kitty.conf && echo "added kitty-zone.conf" || echo "Failed to add kitty-zone.conf"
elif [ "$profile" -eq 2 ]; then
    rm ~/.config/kitty/kitty.conf && echo "removed kitty.conf" || echo "Failed to remove kitty.conf"
    cp ~/.config/kitty/config-file/kitty-show.conf ~/.config/kitty/kitty.conf && echo "added kitty-show.conf" || echo "Failed to add kitty-show.conf"
else
    echo "What the hell?"
fi

# this code is basically take from Mr Nikolov Lazar
# here is his version: https://github.com/nikolovlazar/dotfiles/blob/main/.config/kitty/change-profile.sh
# Thank You Mr Nikolov Lazar

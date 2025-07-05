#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

# INFO: Link to Documentation: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md

# function what will allow us to configure kanata 
kanata_configuration() {
    print_dashed_lines
    printf "+\t Kanata Configuration\t      +\n"
    print_dashed_lines

    # following the official documentation ( for Linux )
	# sudo groupadd uinput

	# sudo usermod -aG input $USER
	# sudo usermod -aG uinput $USER

	# sudo cp ~/dotfiles/kanata/99-input.rules /etc/udev/rules.d/

	# sudo udevadm control --reload-rules && sudo udevadm trigger

	# ls -l /dev/uinput

	# sudo modprobe uinput

	# sudo rm /usr/lib/systemd/system/kanata.service

    printf "\n+     Moving Kanata Configuration     +\n"

	# move the configuration files from dotfiles to ~/.config
	# create the directories
	# mkdir -p ~/.config/systemd/user
	# mkdir -p ~/.config/kanata
	# move the `.service` file
	# cp ~/dotfiles/kanata/kanata.service ~/.config/systemd/user/
	# cp ~/dotfiles/kanata/config.kbd ~/.config/kanata/

	# run the service
# 	systemctl --user daemon-reload
# 	systemctl --user enable kanata.service
# 	systemctl --user start kanata.service
# 	systemctl --user status kanata.service | head
}

kanata_configuration

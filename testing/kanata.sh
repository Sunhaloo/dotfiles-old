#!/usr/bin/env bash

printf "\nHello World\n"

# INFO: Link to Documentation: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md

# function what will allow us to configure kanata 
kanata_configuration() {
    # following the official documentation ( for Linux )
	# sudo groupadd uinput

	printf "\nAdding the User '%s'\n" "$USER"
	# sudo usermod -aG input $USER
	# sudo usermod -aG uinput $USER

	# move file from kanata folder to /etc/udev/rules.d
	# sudo cp ~/dotfiles/kanata/99-input.rules /etc/udev/rules.d/
	# reload the "thing" IDK what I am reading
	# sudo udevadm control --reload-rules && sudo udevadm trigger
	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nVerification\n"
	# verify it
	# ls -l /dev/uinput

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# load the uinput drivers
	# sudo modprobe uinput

	# remove the "default" service file ( if present )
	# sudo rm /usr/lib/systemd/system/kanata.service

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
# 	systemctl --user status kanata.service
}

#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

# INFO: Link to Documentation: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md

# function what will allow us to configure kanata 
kanata_configuration() {
    printf "\n+\t Kanata Configuration\t      +\n\n"

    # following the official documentation ( for Linux )
	sudo groupadd uinput

	sudo usermod -aG input $USER
	sudo usermod -aG uinput $USER

	sudo cp ~/dotfiles/kanata/99-input.rules /etc/udev/rules.d/

	sudo udevadm control --reload-rules && sudo udevadm trigger

	ls -l /dev/uinput

	sudo modprobe uinput

	sudo rm /usr/lib/systemd/system/kanata.service

    printf "\n+     Moving Kanata Configuration     +\n\n"

	# move the configuration files from dotfiles to ~/.config
	# create the directories
	mkdir -p ~/.config/systemd/user
	mkdir -p ~/.config/kanata
	# move the `.service` file
	cp ~/dotfiles/kanata/kanata.service ~/.config/systemd/user/
	cp ~/dotfiles/kanata/config.kbd ~/.config/kanata/

	# run the service
	systemctl --user daemon-reload

    # ask the user if he wants to autostart kanata on boot
    read -p "Do You Want To Autostart Kanata On Boot [y/N]: " user_enable

    echo

    if [[ "$user_enable" == "y" ]]; then
        print_dashed_lines
        printf "+     Enabling Kanata On Boot!!!      +\n"
        print_dashed_lines

        # enable kanata on boot / when computer starts
        systemctl --user enable kanata.service

    elif [[ "$user_enable" == "N" || "$user_enable" == ""  ]]; then
        print_dashed_lines
        printf "+     Skipping Kanata Autostart!      +\n"
        print_dashed_lines

    else
        echo "Wrong Input... Skipping!!!"
    fi

    printf "+     Starting Kanata On Boot!!!      +\n"

    systemctl --user start kanata.service
    systemctl --user status kanata.service | head
}

#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

# ask the user to check if he is on the desktop environment with a browser running
read -p "Are You On Your Desktop Environment? Do You Have A Browser Running? [y/N]: " user_desktop

echo

if [[ "$user_desktop" == "y" ]]; then
    print_dashed_lines
    printf "+          Configuring Git!           +\n"
    print_dashed_lines


elif [[ "$user_desktop" == "N" || "$user_desktop" == ""  ]]; then
    print_dashed_lines
    printf "+Skipping Git Configuration!!!+\n"
    print_dashed_lines

else
    echo "Wrong Input... Skipping!!!"
fi

# function to configure Git
configure_git() {
	printf "\n"
	# prompt the user to enter credentials
	read -p "Please Enter Your Email ( attached with GitHub ): " git_email
	read -p "Please Enter Your Username: " git_username

	# start configuring Git ---> output appropriate message
	printf "\nSetting Up Git...\n\n"

	# configure git
	git config --global user.email "$git_email"
	git config --global user.name "$git_username"
	git config --global init.defaultBranch main

	# list Git configuration
	git config --list

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# output appropriate message
	printf "\n\nGit Configuration Completed\n"
}


# function to generate SSH key
generate_ssh_key() {
	printf "\n"

	# prompt the user to enter his email
	read -p "Please Enter Your Email: " user_email

	# output '-' 50 times
	printf "\n"
	printf '%0.s-' {1..50}
	printf "\n"

	# generate new SSH key based on user's email
	ssh-keygen -t ed25519 -C "$user_email"
	
	printf "\n\nStarting ssh-agent in the background\n"
	# start the ssh-agent in the background
	eval "$(ssh-agent -s)"

	# output '-' 50 times
	printf "\n"
	printf '%0.s-' {1..50}
	printf "\n"

	# add SSH private key to the ssh-agent
	printf "\n\nAdding SSH Private Key to ssh-agent\n"

	# output '-' 50 times
	printf "\n"
	printf '%0.s-' {1..50}
	printf "\n"

	# display the contents of SSH public key
	cat ~/.ssh/id_ed25519.pub

	# output '-' 50 times
	printf "\n"
	printf '%0.s-' {1..50}
	printf "\n"

}

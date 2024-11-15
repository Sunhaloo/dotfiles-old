#!/bin/bash

# function to display options to user
display_options() {
    printf "\nWelcome to Shitty Install Script\n\n"

	printf '%0.s-' {1..50}
	printf "\n"

    printf "\nOption [1]: Git Configuration"
    printf "\nOption [2]: Move Files and Folders to Required Location"
    printf "\nOption [3]: Install All Programs - Packages / Tools - Drivers"
    printf "\nOption [4]: Install OMZ, TMUX TPM"
    printf "\nOption [5]: GitHub Configuration"
    printf "\nOption [6]: Exit\n\n"
}


# function to check + install packages with pacman ( if necessary )
install_package() {
	# starts iterating over the arguments / packages
    for package in "$@"; do

        # if the package is already installed
        if pacman -Qs "$package" > /dev/null; then
            # output the approriate message
            echo "$package is already installed."
        # if the package has not been found

        else
			# install the package ( without confirmation )
            echo "Installing $package..."
            sudo pacman -S --noconfirm "$package"
        fi
    done
}


# function to check + install packages with yay ( if necessary )
install_yay_package() {
	# starts iterating over the arguments / packages
    for package in "$@"; do

        # if the package is already installed
        if yay -Qs "$package" > /dev/null; then
            # output the approriate message
            echo "$package is already installed."
        # if the package has not been found

        else
			# install the package ( without confirmation )
            echo "Installing $package..."
            yay -S --noconfirm "$package"
        fi
    done
}


# function to setup Git / GitHub
setup_git_ssh() {
	# check if the file `git.sh` exists
	if [ -f git.sh ]; then
		# make git script executable and run it
		chmod +x git.sh
		bash ./git.sh
	# if the file has not been found
	else
		# output approriate message
		printf "\nSript File has NOT been Found!!!\n\n"

		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"

		# exit with error
		exit 1
	fi
}


# function to move files and folders to required location
move_file_folders() {
    printf "\nMoving Files and Folders to Required Locations\n\n"

	printf '%0.s-' {1..50}
	printf "\n"

	# create my folders like `Obsidian`, `GitHub`...
    printf "\nCreating User Folders\n\n"
	mkdir -p ~/{GitHub,Obsidian,OBS\ Studio,Screenshots}
	cp -r ~/dotfiles/scripts "$HOME"

	printf '%0.s-' {1..50}
	printf "\n"

	# move configuration files for packages like Hyprland, Kitty...
    printf "\nMoving Configuration Files and Folders\n\n"
	cp -r ~/dotfiles/{hypr,waybar,kitty,rofi,ohmyposh} ~/.config
	cp -r ~/dotfiles/{.zshrc,.tmux.conf} "$HOME"

	printf '%0.s-' {1..50}
	printf "\n"

	# move nvim's configuration files
    printf "\nNeovim's Configuration\n\n"
	# delete user specicic data and state data files
	rm -rf ~/.local/{share,state}/nvim
	# apply neovim configuration
	cp -r ~/dotfiles/nvim ~/.config
}


# function to install all packages/program/tools/drivers
install_all() {
	printf "\nUpdate and Install Programs\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nUpdating System\n\n"
	
	# update the package manager's and AUR's database and update system
	sudo pacman -Syy --noconfirm
	sudo pacman -Syu --noconfirm
	yay -Syy --noconfirm
	yay -Syu --noconfirm

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n\n"

	printf "\nInstalling Packages - Applications - Tools - Drivers\n\n"

	# pacman packages
	install_package

	# AUR packages
	install_yay_package

}



# function tto evaluate user's choice of option
evaluate_user_option() {
	# conditions to evaluate based on user's choice
	if [[ "$user_option" = 1 ]]; then
		# call the function to setup git
		setup_git_ssh

	if [[ "$user_option" = 2 ]]; then
		# call the function to move files and folders
		move_file_folders

	if [[ "$user_option" = 3 ]]; then
		# call the function to move files and folders
 
	elif [[ "$user_option" = 7 ]]; then
		# user wants to exit the script
		printf "\nGood Bye!\n"
		exit 0

	else
		# users presses unavailable option
		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"

		# output approriate message
		printf "\nWrong Option\n\n"

		# output '-' 50 times
		printf '%0.s-' {1..50}
		printf "\n"
	fi

}


# our main function
main() {
    # call function to display options available
    display_options

    # prompt the user to select option
    read -p "Please Select an Option: " user_option

	printf '%0.s-' {1..50}
	printf "\n"

    # call `evaluate_user_option` to run the functions in selected option
    evaluate_user_option "$user_option"

}


# source the main function
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
	main
fi

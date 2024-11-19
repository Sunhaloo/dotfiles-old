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
    printf "\nOption [5]: Exit\n\n"
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

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"


	yay -Syy --noconfirm
	yay -Syu --noconfirm

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nInstalling Packages - Applications - Tools - Drivers\n\n"

	# pacman packages
	install_package git hyprland hyprutils hyprpicker hyprcursor hyprpaper hyprwayland-scanner xwaylandvideobridge xdg-desktop-portal-hyprland xdg-desktop-portal-wlr power-profiles-daemon wl-clipboard swaync waybar sddm
	install_package kitty neovim rofi-emoji rofi btop gnome-keyring thunar thunar-volman gvfs gvfs-afc gufw lxinput brightnessctl network-manager-applet blueman
	install_package gcc clang nodejs npm yarn jdk21-openjdk openjdk21-src openjdk21-doc luarocks lua go rustup rust
	install_package ffmpeg ripgrep fd eza zoxide fzf lazygit tmux yazi zsh yt-dlp
	install_package ristretto obsidian obs-studio mpv spotify-launcher
	install_package arc-gtk-theme-eos
	install_package otf-font-awesome ttf-hack-nerd ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-iosevka-nerd ttf-victor-mono-nerd

	# AUR packages
	install_yay_package intel-ivsc-firmware hyprshot pyprland oh-my-posh kanata thorium-browser-bin vscodium-bin nwg-look ani-cli bibata-cursor-theme banana-cursor-bin apple_cursor whitesur-icon-theme
	install_yay_package slides vencord
}


# function to install oh-my-zsh
install_omz() {
	printf "\nOh-My-ZSH Installation\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	printf "\nOh-My-ZSH Installation Completed\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nOh-My-ZSH Plugins Installation\n\n"

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	# remove the new .zshrc that has been created by omz installation
	rm -rf ~/.zshrc.pre-oh-my-zsh
	cp -r ~/dotfiles/.zshrc "$HOME"

	printf "\nOh-My-ZSH Plugins Installation Completed\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"
}

# function to install tmux-tmp
install_tpm() {
    printf "\n\nTMUX TPM Installation\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

	printf "\nTMUX TPM Installation Completed\n\n"

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"
}


# WARNING: this has not been tested
# in addition, this is basically taken from:
# https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md
kanata_configuration() {
	# create a new group
	sudo groupadd uinput
	# add the user
	printf "\nAdding the User '%s'\n" "$USER"
	sudo usermod -aG input $USER
	sudo usermod -aG uinput $USER

	# move file from kanata folder to /etc/udev/rules.d
	sudo cp ~/dotfiles/kanata/99-input.rules /etc/udev/rules.d/
	# reload the "thing" IDK what I am reading
	sudo udevadm control --reload-rules && sudo udevadm trigger
	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	printf "\nVerification\n"
	# verify it
	ls -l /dev/uinput

	# output '-' 50 times
	printf '%0.s-' {1..50}
	printf "\n"

	# load the uinput drivers
	sudo modprobe uinput

	# move the configuration files from dotfiles to ~/.config
	# create the directories
	mkdir -p ~/.config/systemd/user
	mkdir -p ~/.config/kanata
	# move the `.service` file
	sudo cp ~/dotfiles/kanata/kanata.service ~/.config/systemd/user/
	sudo cp ~/dotfiles/kanata/config.kbd ~/.config/kanata/
}


# function to evaluate user's choice of option
evaluate_user_option() {
	# conditions to evaluate based on user's choice
	if [[ "$user_option" = 1 ]]; then
		# call the function to setup git
		setup_git_ssh

	elif [[ "$user_option" = 2 ]]; then
		# call the function to move files and folders
		move_file_folders

	elif [[ "$user_option" = 3 ]]; then
		# call the function to install all programs / packages
		install_all

	elif [[ "$user_option" = 4 ]]; then
		# call function to install OMZ, TMUX TPM...
		install_omz
		install_tpm
 
	elif [[ "$user_option" = 5 ]]; then
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

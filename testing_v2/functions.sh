#!/usr/bin/env bash

# function that will print out the welcome logo
print_logo() {
    cat << "EOF"
  _____    _____       ___     ___   
 / ____|  / ____|     / _ \   / _ \  
| (___   | (___      | (_) | | (_) | 
 \___ \   \___ \      \__  |  \__  | 
 ____) |  ____) |       / /     / /  
|_____/  |_____/       /_/     /_/   


          "Less is More"

EOF
}

# function that will check if a package is already installed on system
is_installed() {
    pacman -Q "$1" &> /dev/null
}


# function that will check if a groups of packages are already installed on system
is_group_installed() {
    pacman -Qg "$1" &> /dev/null
}

# function check if yay has already been installed on our system been installed
yay_installation() {
    if command -v yay &> /dev/null; then
        # output appropriate message
        printf "\n== YAY Has Already Been Installed! ==\n\n"

    # meaning that `yay` has not been found on the system
    else
        # output appropriate message
        printf "\n== YAY Has NOT Been Installed... Installing!!! ==\n\n"

        # install the `yay` AUR helper as per the documentation
        sudo pacman -S --needed git base-devel

        printf "== Cloning Repository with Git!!! ==\n\n"

        git clone https://aur.archlinux.org/yay.git

        cd yay

        printf "== Building YAY ==\n\n"

        makepkg -si

        # remove the unwanted folders
        printf "== Post Install Folder Clean =="

        cd .. && rm -rf yay
    fi
}

# function that will install all the packages that we tell it to... obviously!
install_packages() {
    # initialise variables
    local packages=("$@")
    not_on_sys=()

    echo "Install Function"
    echo "${packages[@]}"

    # iterate through the list of packages provided by argument ( main program )
    for pkgs in "${packages[@]}"; do
        echo "$pkgs"
        # if the package inside the `packages` array is not found on system
        if ! is_installed "$pkgs" && ! is_group_installed "$pkgs"; then
            # add that package to the array `not_on_sys`
            not_on_sys+=("$pkgs")
        fi
    done

    # install all the packages that are found inside the `not_on_sys` array
    if [[ "${#not_on_sys[@]}" -ne 0 ]]; then
        yay -S --noconfirm "${not_on_sys[@]}"
    fi
}

# function that will allow us to configure kanata ( rust-based keyboard remapper )
kanata_configuration() {
    # INFO: Link to Documentation: https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md
    printf "\n== Kanata Configuration ==\n\n"

    # following the official documentation ( for Linux )
	sudo groupadd uinput

	sudo usermod -aG input $USER
	sudo usermod -aG uinput $USER

    # "create" the '99-input.rules' files... In this case, I already have it!
	sudo cp ~/dotfiles/kanata/99-input.rules /etc/udev/rules.d/

	sudo udevadm control --reload-rules && sudo udevadm trigger

    # simply verification
	ls -l /dev/uinput

	sudo modprobe uinput

	sudo rm /usr/lib/systemd/system/kanata.service

    printf "\n+     Moving Kanata Configuration     +\n\n"

    # prepared the required directories for configuration files
	mkdir -p ~/.config/systemd/user
	mkdir -p ~/.config/kanata
    
    # moving my configuration to `~/.config` directory
	cp ~/dotfiles/kanata/kanata.service ~/.config/systemd/user/
	cp ~/dotfiles/kanata/config.kbd ~/.config/kanata/

    # reload the user systemd manager configuration
	systemctl --user daemon-reload

    # ask the user if he wants to autostart kanata on boot
    read -p "Do You Want To Autostart Kanata On Boot [y/N]: " user_enable

    # if the user wants to enable kanata on boot
    if [[ "$user_enable" == "y" ]]; then
        printf "\n== Enabling Kanata On Boot!!! ==\n"

        # enable kanata on boot / when computer starts
        systemctl --user enable kanata.service

    # if the user does not want to enable kanata on boot
    elif [[ "$user_enable" == "N" || "$user_enable" == ""  ]]; then
        printf "\n== Skipping Kanata On Boot - Autostart!!! ==\n"

    # if the user did not enter correct / required input
    else
        printf "\n== Wrong Input... Skipping Kanata Autostart!!! ==\n"
    fi

    printf "== Starting Kanata's Service== \n"

    # start kanata right away
    systemctl --user start kanata.service
    # check if kanata has been successfully started
    systemctl --user status kanata.service | head
}

# function that will ask the user to if he is currently on laptop
laptop_packages() {
    # initialise variable
    local laptop_packages=("$@")

    echo "Laptop Function"
    echo "${laptop_packages[@]}"

    # ask the user if he / she is on laptop
    read -p "Are You On Laptop [y/N]: " laptop_user


    # if the user wants to download and install laptop packages
    if [[ "$laptop_user" == "y" ]]; then
        printf "\n== Installing Laptop Specific Packages!!! ==\n"

        # call the required function to make 'yay' download and install required packages
        install_packages "${laptop_packages[@]}"

    # if the user does not want to install laptop packages
    elif [[ "$laptop_user" == "N" || "$laptop_user" == ""  ]]; then
        printf "\n== Skipping Laptop Packages! ==\n"

    # if the user did not enter correct / required input
    else
        printf "\n== Wrong Input... Skipping Laptop Packages!!! ==\n"
    fi
}

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

        printf "== Post Install Folder Clean =="

        cd .. && rm -rf yay
    fi
}

# function that will refresh 'yay' and 'pacman' packages and update entire system
update_system() {
    # refresh the AUR and pacman packages
    yay -Syy --noconfirm
    sudo pacman -Syy --noconfirm

    # actually update the system ( update packages downloaded with both `yay` and `pacman` )
    yay -Syu --noconfirm
    sudo pacman -Syu --noconfirm
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
    printf "\n== Device Type - Laptop Specific Packages!!! ==\n\n"

    # ask the user if he / she is on laptop
    read -p "Are You On Laptop [y/N]: " laptop_user

    # if the user wants to download and install laptop packages
    if [[ "$laptop_user" == "y" ]]; then
        printf "\n== Installing Laptop Specific Packages!!! ==\n"

        # initialise variable
        local laptop_packages=("$@")

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

# function that will enable all the required services
enable_services() {
    # initialise variable
    local services=("$@")

    # iterate through the list of services provided by argument ( main program )
    for service in "${services[@]}"; do
        # use the actual `systemctl` with argument / flag `is-enabled` to check is service is enabled
        if ! systemctl is-enabled "$service" &> /dev/null; then
            echo "Enabling $service..."

            # enable the service that is not already enabled
            sudo systemctl enable "$service"

        # meaning that the service has already been enabled
        else
            # output appropriate message
            echo "$service is already enabled"
        fi
    done
}

# function to install curl and setup OMZ
oh_my_zsh() {
    # INFO: Link to Documentation: https://github.com/ohmyzsh/ohmyzsh
	printf "== Oh-My-ZSH Installation ==\n\n"

    # following the installation guide for OMZ
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	printf "== Oh-My-ZSH Curl Completed ==\n\n"

	printf "== Install Required Plugins ==\n\n"

    install_packages zsh-autosuggestions zsh-syntax-highlighting

    # remove any exisiting ZSH related files
    rm -rf ~/.zsh{rc.pre-oh-my-zsh,rc,_history}

	# WARNING need to look in this
    # move my ZSH configuration file to be sourced
    cp ~/dotfiles/zsh/.zshrc $HOME

    # move the `~/.oh-my-zsh/` to `~/.config/oh-my-zsh/`
    mv -r ~/.oh-my-zsh/ ~/.config/oh-my-zsh/
	cp ~/dotfiles/zsh/aliases.zsh  ~/.config/oh-my-zsh/custom/

	# move the pluginsinstalled with `pacman` to `$ZSH/plugins/` folder
	mv -r /usr/share/zsh/plugins/* ~/.config/oh-my-zsh/plugins/

    printf "== Oh-My-ZSH and ZSH Setup Completed!!! ==\n\n"
}

# function that will clone and setup TMUX TPM
tmux_plugin_manager() {
    printf "== TMUX Plugin Manager ==\n"

    # if the directory at location '~/.tmux/' exists
    if [[ -d "$HOME/.tmux" ]]; then
        printf "\n== TMUX Plugin Manager Folder Exists! ==\n\n"

    # meaning that TMUX Plugin Manager is not present on system
    else
        printf "\n== Cloning Repository with Git!!! ==\n\n"

        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

        printf "== TMUX Plugin Manager Installed ==\n"
    fi
}


# function that will configure git and create SSH key for git
git_configuration() {
    # INFO: Link to Documentation:
    # https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux

    # prompt the user to confirm if they are currently
    # on the desktop environment with a browser installed
    read -p "Are You On Hyprland? Do You Have A Browser? [y/N]: " user_desktop

    # meaning that the user wants configure git and setup SSH key
    if [[ "$user_desktop" == "y" ]]; then
        printf "\n== Configuring Git! ==\n\n"

        # ask the user to enter his email
        read -p "Enter Your Email ( Attached To GitHub ): " git_email
        # ask the user to enter his email again for confirmation
        read -p "Confirm Your Email: " git_email_confirmation

        # if the user's email is the same
        # ==> meaning original email == confirmation email
        if [[ "$git_email" == "$git_email_confirmation" ]]; then
            printf "\n== Email Confirmed ==\n\n"

        # meaning that the original email is not the same as confirmation email
        else
            printf "\n== Emails Did NOT Match Up!!! ==\n"

            # return the "error" status code to our main program
            return 1
        fi
        
        # if emails have checked our... ask the user to enter his username
        read -p "Please Enter Your Username ( Attached To GitHub ): " git_username

        printf "\n== Setting Up User Specific Configurations ==\n\n"

        # using information provided, setup git for user
        git config set --global user.email "$git_email"
        git config set --global user.name "$git_username"
        git config set --global init.defaultBranch main

        printf "\n== Setting Up User Configurations Completed ==\n\n"

        # display the git configuration that has been applied
        git config list | head

        printf "\n== Setting Up SSH Key == \n\n"

        # following the documentation
        ssh-keygen -t ed25519 -C "$git_email"
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_ed25519

        printf "\n== SSH Key ( Already Copied To Clipboard ) == \n\n"

        # display the SSH key and also copy to the clipboard
        cat ~/.ssh/id_ed25519.pub && cat ~/.ssh/id_ed25519.pub | wl-copy

    # meaning that the user does not want to configure git right now
    elif [[ "$user_desktop" == "N" || "$user_desktop" == ""  ]]; then
        printf "\n== Skipping Git Configurations!!! ==\n"

    # if the user did not enter correct / required input
    else
        printf "\n== Wrong Input... Skipping Laptop Packages!!! ==\n"
    fi
}

# function that can be used to reboot the machine of installation if need be
reboot_computer() {
    :
    # ask the user if he / she wants to reboot the computer
    read -p "Do You Want To Reboot The System [Y/n]: " user_reboot

    # meaning that the user wants to reboot the computer
    if [[ "$user_reboot" == "Y"  || "$user_reboot" == "" ]]; then
        printf "\n== Rebooting System... ==\n"
        
        # sleep the program for '0.5s'
        sleep 0.5s

        # reboot the computer using `systemctl`
        # systemctl reboot

    # the user does not want to reboot
    elif [[ "$user_reboot" == "n" ]]; then
        # output appropriate message
        printf "\n== Installation and Setup Complete! ==\n"

        # exit the program with correct status code
        exit 0

    # if the user did not enter correct / required input
    else
        printf "\n== Wrong Input... Skipping Rebooting!!! ==\n"
    fi
}

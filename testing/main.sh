#!/usr/bin/env bash
# you entire system automatically and without much input from you. Really Cool Stuff!
# but then I came across this video by one of the GOAT typecraft:

# https://www.youtube.com/watch?v=62mygqukbYk

# even though my install script worked fine and did all the things that I asked it to do
# it was... Shit! I was "long" for nothing not even good code formatting and so on.
# heck I did not even used arrays ( because of my lack of experience also ); I did
# not think that I would have needed to. I basically "vibe-coded" my way around.

# therefore, I decided to "re-learn" BASH scripting. I did my learning differently
# whereby if I don't understand something, its only then I would open Obsidian to learn!
# now the time has come for me to actually write the install script.

# someone in a discord server that I am in told me that "Creating your own from
# scratch is one thing but in the real-world understanding and adapting existing code
# is what most of us, developers do" ( https://github.com/sandylnur )

# long story short... I am going to be "stealing" typecraft's code and adapting it for my usage
# Again, Thank You So Much Mr typecraft!

# import the `functions.sh` file
source functions.sh
# import the `packages.conf` file
source packages.conf
# import the `git.sh` file
source git.sh

# set / show any errors on exit
set -e

# call the function to print the welcome screen
print_logo

# download the install `yay` AUR helper
print_dashed_lines
printf "+\t        Yay AUR\t\t      +\n"
print_dashed_lines

# check if yay has already been installed on our system been installed
if is_installed yay; then
    # INFO: the reason that I am doing this is because in some distros like
    # EndeavourOS, you will be able to just run `sudo pacman -S yay`... Heck!
    # it ( from what I remember ) comes pre-installed on the system!
    printf "\nYAY Has Already Been Installed!\n\n"

# meaning that the user does not have `yay` installed on the system
else
    printf "\nYAY Has NOT Been Installed... Installing!\n\n"

    # install the `yay` AUR helper as per the documentation
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay

    # build and install `yay` on our system
    printf "\n\n+\t    Building Yay\t      +\n\n"
    makepkg -si

    # remove the unwanted folders
    printf "\n+  Cleaning Installation Folders\t +\n\n"
    cd .. && rm -rf yay
fi

print_dashed_lines
printf "+        Updating Whole System       +\n"
print_dashed_lines

echo
echo

# refresh the AUR and pacman packages
yay -Syy --noconfirm
sudo pacman -Syy --noconfirm

# actually update the system ( update packages downloaded with both `yay` and `pacman` )
yay -Syu --noconfirm
sudo pacman -Syu --noconfirm

# import the `term_utils.sh` file
source term_utils.sh
# import the `dotfiles.sh` file
source dotfiles.sh

# call the function to "install" TMUX TPM
tmux_plugin_manager 

# ask the user if he / she is on laptop
read -p "Are You On Laptop [y/N]: " laptop_user

echo

if [[ "$laptop_user" == "y" ]]; then
    print_dashed_lines
    printf "+ Installing Laptop Specific Packages +\n"
    print_dashed_lines

    # call the function and appropriate array to download and install laptop packages
    install_packages "${LAPTOP[@]}"

elif [[ "$laptop_user" == "N" || "$laptop_user" == ""  ]]; then
    print_dashed_lines
    printf "+      Skipping Laptop Packages!      +\n"
    print_dashed_lines

else
    echo "Wrong Input... Skipping!!!"
fi

echo

# ask the user if he / she wants to install and configure kanata
read -p "Do You Want To Install and Configure Kanata [y/N]: " kanata_config

echo

if [[ "$kanata_config" == "y" ]]; then
    print_dashed_lines
    printf "+  Installing and Configuring Kanata  +\n"
    print_dashed_lines

    # call the function to be able to install kanata
    install_packages "kanata"

    # call the function that will configure kanata for us
    kanata_configuration 

elif [[ "$kanata_config" == "N" || "$kanata_config" == ""  ]]; then
    print_dashed_lines
    printf "+         Skipping Kanata!!!          +\n"
    print_dashed_lines

else
    echo "Wrong Input... Skipping!!!"
fi


echo

print_dashed_lines
printf "+          Installing Packages        +\n"
print_dashed_lines

install_packages "${DESKTOP[@]}"
install_packages "${DEPENDENCIES[@]}"
install_packages "${DEV_TOOLS[@]}"
install_packages "${LANGS[@]}"
install_packages "${FONT[@]}"

print_dashed_lines
printf "+   Enabling Required Services!!!     +\n"
print_dashed_lines

echo

for service in "${SERVICES[@]}"; do
if ! systemctl is-enabled "$service" &> /dev/null; then
    echo "Enabling $service..."
    sudo systemctl enable "$service"
else
    echo "$service is already enabled"
fi
done

echo
print_dashed_lines

# call the function to be able to configure git
git_configuration 

# ask the user if he / she wants to reboot the system
read -p "Do You Want To Reboot The System [Y/n]: " user_reboot

echo

if [[ "$user_reboot" == "Y"  || "$user_reboot" == "" ]]; then
    print_dashed_lines
    printf "+\tRebooting System...\t+\n"
    print_dashed_lines
    
    # sleep the program for '0.5s'
    sleep 0.5s


elif [[ "$user_reboot" == "n" ]]; then
    print_dashed_lines
    printf "+   Installation and Setup Complete   +\n"
    print_dashed_lines

    # exit the program / script without any errors
    exit 0

else
    echo "Wrong Input... Skipping!!!"
fi

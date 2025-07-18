#!/usr/bin/env bash

source functions.sh
source packages.conf

print_logo

yay_installation 

update_system 

clear

install_packages "${WINDOW_MANAGER[@]}"
install_packages "${SYSTEM_UTILS[@]}"
install_packages "${DESKTOP[@]}"
install_packages "${DEVELOPMENT[@]}"
install_packages "${LANGS[@]}"

clear

laptop_packages "${LAPTOP[@]}"

clear

enable_services "${SERVICES[@]}"

clear

if ! source dotfiles.sh; then
    printf "\nConfiguration SH was Skipped or Failed, continuing with the rest...\n"
fi

# oh_my_zsh
# NOTE: going to get the manual installation way
oh_my_zsh_manual

clear
 
tmux_plugin_manager

clear

kanata_configuration

clear

clear

if ! git_configuration; then
    printf "\nGit Configuration was Skipped or Failed, continuing with the rest...\n"
fi

clear

reboot_computer

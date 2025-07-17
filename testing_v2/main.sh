#!/usr/bin/env bash

source functions.sh
source packages.conf

yay_installation 

clear

update_system 

clear

if ! source dotfiles.sh; then
    printf "\nConfiguration SH was Skipped or Failed, continuing with the rest...\n"
fi

clear

install_packages "${WINDOW_MANAGER[@]}"
install_packages "${SYSTEM_UTILS[@]}"
install_packages "${DESKTOP[@]}"
install_packages "${DEVELOPMENT[@]}"
install_packages "${LANGS[@]}"
install_packages "${SERVICES[@]}"

clear

laptop_packages "${LAPTOP[@]}"

clear

enable_services

clear

oh_my_zsh

clear
 
tmux_plugin_manager

clear

kanata_configuration

clear

if ! git_configuration; then
    printf "\nGit Configuration was Skipped or Failed, continuing with the rest...\n"
fi

clear

reboot_computer

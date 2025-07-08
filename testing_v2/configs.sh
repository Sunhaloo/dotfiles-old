#!/usr/bin/env bash

# define the dotfiles repository URL
# REPO_URL="https://github.com/Sunhaloo/dotfiles.git"
REPO_URL="https://github.com/Sunhaloo/doits.git"
# define the dotfiles folder name
# DIR_NAME="dotfiles"
DIR_NAME="actual_repo"
# define my directory where I keep all my repositories
# REPO_DIR="$HOME/GitHub/"
REPO_DIR="$HOME/gitshit/"
# define the configuration directory
# CONFIG_DIR="$HOME/.config/"
CONFIG_DIR="$HOME/.shitter/"

# change current working directory to home directory
cd $HOME

printf "\n== Dotfiles Setup ==\n\n"

# if the directory at location '~/GitHub/dotfiles' exists
if [[ -d "$REPO_DIR$DIR_NAME" ]]; then
    # meaning that the 'dotfiles' repository already exists
    printf "== Dotfiles Repository Already Exists! ==\n\n"

    # show the user where the repository has been installed
    printf "-- Repository Located At: %s --\n\n" "$(find "$HOME" -type d -name "$DIR_NAME" 2>/dev/null)"

    printf "== Checking Required Directories ==\n\n"

    # if the directory at location '~/.config' exists
    if [[ -d "$CONFIG_DIR"  ]]; then
        printf "== Configuration Directory Exists ==\n\n"

    # meaning that the folder has not been created
    else
        printf "== Creating Configuration Folders / Directory ==\n\n"

        # create the '~/.config' folder
        mkdir -p "$CONFIG_DIR"
    fi

# if the 'dotfiles' repository is not present on the system
else
    printf "== Cloning Dotfiles Repository ==\n\n"

    printf "== Checking Required Directories ==\n\n"
    
    # create the directory '~/GitHub/'
    mkdir "$REPO_DIR"

    # if the directory at location '~/.config' exists
    if [[ -d "$CONFIG_DIR"  ]]; then
        printf "== Configuration Directory Exists ==\n\n"

    # meaning that the folder has not been created
    else
        printf "== Creating Configuration Folders / Directory ==\n\n"

        # create the '~/.config' folder
        mkdir -p "$CONFIG_DIR"
    fi

    printf "== Cloning Dotfiles Repository ==\n\n"

    # clone the my dotfiles repository
    git clone "$REPO_URL" "$REPO_DIR$DIR_NAME"

    # show the user where the repository has been installed
    printf "\n-- Repository Located At: %s --\n\n" "$(find "$HOME" -type d -name "$DIR_NAME" 2>/dev/null)"

fi

# WARNING: need to complete this part... Going to for supper :)

# check if the cloning of the repository was successful
if [[ $? -eq 0 ]]; then
    # meaning that return status is '0' ==> clone successful
    # therefore, move each folder into their respective positions
    printf "+      Moving Configurations!!!       +\n"

    echo

    if [[ -d "$HOME/{Obsidian,OBS\ Studio,Screenshots,Wallpapers}" ]]; then
        printf "+      Creating Home Folders!         +\n\n"
        # create the all the required folders that I need
        mkdir ~/{Obsidian,OBS\ Studio,Screenshots,Wallpapers}

    else
        # output appropriate message
        printf "+\tHome Folders Exists!\t      +\n\n"
    fi

    printf "+\t   Moving Folders!\t      +\n\n"

    # move the required configuration files
    # NOTE: remember to add starship to configuration files
    cp -r $HOME/GitHub/dotfiles/{hypr,waybar,kitty,nvim,rofi} ~/.config
    cp -r $HOME/GitHub/dotfiles/{.zshrc,.tmux.conf} $HOME

    printf "+      Moving Folders Completed!      +\n\n"


# meaning that the clone was not successful
else
    # output appropriate message
    echo
    printf "+      WARNING: Cloned Failed!!!      +\n"

    # return to the shell with exit status code '1'
    # exit 1
    return 1
fi


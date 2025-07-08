#!/usr/bin/env bash

# define the dotfiles repository URL
REPO_URL="https://github.com/Sunhaloo/dotfiles.git"
# REPO_URL="https://github.com/Sunhaloo/doits.git"
# define the dotfiles folder name
DIR_NAME="dotfiles"
# DIR_NAME="actual_repo"
# define my directory where I keep all my repositories
REPO_DIR="$HOME/GitHub/"
# REPO_DIR="$HOME/gitshit/"
# define the configuration directory
CONFIG_DIR="$HOME/.config/"
# CONFIG_DIR="$HOME/.shitter/"

# change current working directory to home directory
cd $HOME

printf "\n== Dotfiles Setup ==\n\n"

# if the directory at location '~/GitHub/dotfiles' exists
if [[ -d "$REPO_DIR$DIR_NAME" ]]; then
    # meaning that the 'dotfiles' repository already exists
    printf "== Dotfiles Repository Already Exists! ==\n\n"

    printf "\nThe Repository Is Located At: "
    find -type d -name "$REPO_DIR$DIR_NAME" 2> /dev/null

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
    printf "\nThe Repository Is Located At: %s" find -type d -name "$REPO_DIR$DIR_NAME" 2> /dev/null

fi

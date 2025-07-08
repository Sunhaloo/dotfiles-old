#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

# define the dotfiles repository URL
REPO_URL="https://github.com/Sunhaloo/dotfiles.git"
# define the dotfiles folder name
DIR_NAME="dotfiles"
# define my directory where I keep all my repositories
REPO_DIR="$HOME/GitHub/"
# define the configuration directory
CONFIG_DIR="$HOME/.config/"

# change current working directory to home directory
cd $HOME

print_dashed_lines 
printf "+\t   Dotfiles Setup\t      +\n"
print_dashed_lines 

echo

# check if the directory '~/GitHub/dotfiles' exists
if [[ -d "$REPO_DIR$DIR_NAME" ]]; then
    # meaning that the 'dotfiles' repository already exists
    printf "+ Dotfiles Repository Already Exists! +\n"
    print_dashed_lines 

    printf "\n+    Checking Required Directories    +\n"

    # check if our configuration directory exist directory
    if [[ -d "$CONFIG_DIR"  ]]; then
        # meaning that folder has already be created
        printf "\n+   Configuration Directory Exists    +\n\n"

    else
        printf "\n+  Creating Configuration Directory  +\n\n"
        # create the '~/.config' folder
        mkdir -p "$CONFIG_DIR"
    fi

# meaning that 'dotfiles' repository is not present
else
    print_dashed_lines 
    printf "\n+     Cloning Dotfiles Repository     +\n\n"
    print_dashed_lines 

    printf "\n+    Checking Required Directories    +\n\n"
    
    # create the directory '~/GitHub/'
    mkdir "$REPO_DIR"

    # check if our configuration directory exist directory
    if [[ -d "$CONFIG_DIR"  ]]; then
        # meaning that folder has already be created
        printf "\n+   Configuration Directory Exists   +\n\n"
        
    else
        printf "\n+  Creating Configuration Directory  +\n\n"
        # create the '~/.config' folder
        mkdir -p "$CONFIG_DIR"
    fi

    # head over into the specified directory where I place all my repositories
    cd "$REPO_DIR"

    printf "\n+     Cloning Dotfiles Repository     +\n\n"
    # clone the my dotfiles repository
    git clone "$REPO_URL"
fi


# check if the cloning of the repository was successful
if [[ $? -eq 0 ]]; then
    # meaning that return status is '0' ==> clone successful
    # therefore, move each folder into their respective positions
    print_dashed_lines 
    printf "+      Moving Configurations!!!       +\n"
    print_dashed_lines 

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
    print_dashed_lines 
    printf "+      WARNING: Cloned Failed!!!      +\n"
    print_dashed_lines 

    # return to the shell with exit status code '1'
    exit 1
fi


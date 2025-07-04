#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

# define the dotfiles repository URL
REPO_URL="https://github.com/Sunhaloo/dotfiles.git"
# define the dotfiles folder name
DIR_NAME="dotfiles"
# define my directory where I keep all my repositories
REPO_DIRS="$HOME/GitHub/"

# change current working directory to home directory
cd $HOME

print_dashed_lines 
printf "+\t   Dotfiles Setup\t      +\n"
print_dashed_lines 

# check if the directory '~/GitHub/dotfiles' exists
if [[ ! -d "$REPO_DIRS$DIR_NAME" ]]; then
    # meaning that the 'dotfiles' repository already exists
    printf "\n+ Dotfiles Repository Already Exists! +\n"

# meaning that 'dotfiles' repository is not present
else
    printf "\n+     Cloning Dotfiles Repository     +\n"
fi

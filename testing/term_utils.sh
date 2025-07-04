#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

# function that will clone and setup TMUX TPM
tmux_plugin_manager() {
    print_dashed_lines 
    printf "+\t  TMUX Plugin Manager!\t      +\n"
    print_dashed_lines 

    # check if directory '~/.tmux/' exists
    if [[ -d "$HOME/.tmux" ]]; then
        printf "\n+ TMUX Plugin Manager Folder Exists! +\n"

    # meaning that TMUX Plugin Manager is not present on system
    else
        # following the official documentation
        # clone and "install" TPM
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

        printf "\n+   TMUX Plugin Manager Installed!    +\n\n"

    fi
}

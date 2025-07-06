#!/usr/bin/env bash

# import the `functions.sh` file
source functions.sh

git_configuration() {
    echo

    # ask the user to check if he is on the desktop environment with a browser running
    read -p "Are You On Your Desktop Environment? Do You Have A Browser Running? [y/N]: " user_desktop

    echo

    if [[ "$user_desktop" == "y" ]]; then
        print_dashed_lines
        printf "+          Configuring Git!           +\n"
        print_dashed_lines

        echo

        # ask the user to enter his email
        read -p "Please Enter Your Email ( attached with GitHub ): " git_email
        # ask the user to enter his email again for confirmation
        read -p "Please Confirm Your Email ( attached with GitHub ): " git_email_confirmation

        echo

        if [[ "$git_email" == "$git_email_confirmation" ]]; then
            print_dashed_lines
            printf "+         Email Confirmed!!!          +\n"
            print_dashed_lines
        else
            print_dashed_lines
            printf "+            Bad Email!!!             +\n"
            print_dashed_lines
            exit 1
        fi

        echo
        
        read -p "Please Enter Your Username: " git_username

        printf "+          Setting Up User!           +\n"

        # using information provided, setup git for user
        git config set --global user.email "$git_email"
        git config set --global user.name "$git_username"
        git config set --global init.defaultBranch main

        printf "+     Setting Up User Completed!      +\n\n"

        # display the git configuration that has been applied
        git config list | head

        printf "\n\n+        Setting Up SSH Key!          +\n\n"

        # generate new SSH key based on user's email
        ssh-keygen -t ed25519 -C "$user_email"
        start the ssh-agent in the background
        eval "$(ssh-agent -s)"

        cat ~/.ssh/id_ed25519.pub && cat ~/.ssh/id_ed25519.pub | wl-copy

    elif [[ "$user_desktop" == "N" || "$user_desktop" == ""  ]]; then
        print_dashed_lines
        printf "+    Skipping Git Configuration!!!    +\n"
        print_dashed_lines

        echo

    else
        echo "Wrong Input... Skipping!!!"

        echo
    fi
}

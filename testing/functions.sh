#!/usr/bin/env bash

# function that will help us to display a "rule"
print_dashed_lines() {
    # simply display a rule
    printf "%0.s=" {1..39}
    printf "\n"
}

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
    # use positional arguments to check if package is installed
    # place all `stdout` and `stderr` into the black hole
    pacman -Q "$1" &> /dev/null
    # pacman -Q "$1"
}


# function that will check if a groups of packages are already installed on system
is_group_installed() {
    # use positional arguments to check if package group is installed
    # place all `stdout` and `stderr` into the black hole
    pacman -Qg "$1" &> /dev/null
}


# INFO: now I can see that typecraft is installing all this packages with `yay`
# even if that packages is available inside the native `pacman` repositories
# my install script did not... meaning that I had a function that would install "pacman"
# packages and another function that will only install "yay" packages, i.e 2 different
# functions for only 1 job

# I am now going to switch over to his approach because of the simplicity and the motto
# "Less is More" I am going to , again, choose simplicity over shear speed!
# because we know that using `yay` to install native "pacman" packages is going to add a little delay

# function that will install all the packages that we tell it to... obviously!
install_packages() {
    # intialise variable to hold all the packages provided by array
    local packages=("$@")
    
    # declare and initialise an empty array to hold all packages to actually install
    not_on_sys=()

    # iterate through the list of packages provided by argument ( main program )
    for pkgs in "${packages[@]}"; do
        # check if that package has already been installed on the system
        # this is done by calling the 2 functions found above

        # NOTE: in this case, you must NOT add the `[[]]` characters
        # this is because we are not testing conditions... we are "testing" functions / commands
        if ! is_installed "$pkgs" && ! is_group_installed "$pkgs"; then
            # add that package to the array `not_on_sys`
            not_on_sys+=("$pkgs")

        fi
    done

    # echo "${#not_on_sys[@]}"

    # check if the length of the array `not_on_sys` is not '0'
    if [[ "${#not_on_sys[@]}" -ne 0 ]]; then
        # meaning that array is not empty
        # install all the packages found inside array using the 'yay' AUR helper
        yay -S --noconfirm "${not_on_sys[@]}"
    fi
}


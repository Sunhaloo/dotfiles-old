#!/bin/bash


github="$HOME/GitHub/obsidian"
obsidian="$HOME/Obsidian/"
obsidian_sun="$HOME/Obsidian/S.Sunhaloo"
obsidian_qna="$HOME/Obsidian/Question - Problems - Solutions"

# create functions to move folders
github_obsidian() {
    printf "\nDeleting Folders in '%s' Directory" "$obsidian"
    rm -rf ~/Obsidian/S.Sunhaloo
    rm -rf ~/Obsidian/Question\ -\ Problems\ -\ Solutions/

    printf "\nMoving Folders\n"
    cp -r ~/GitHub/obsidian/S.Sunhaloo ~/Obsidian/
    cp -r ~/GitHub/obsidian/Question\ -\ Problems\ -\ Solutions/ ~/Obsidian/
}


obsidian_github() {
    printf "\nDeleting Folders in '%s' Directory" "$github"
    rm -rf ~/GitHub/obsidian/S.Sunhaloo
    rm -rf ~/GitHub/obsidian/Question\ -\ Problems\ -\ Solutions/

    printf "\nMoving Folders\n"
    cp -r ~/Obsidian/S.Sunhaloo ~/GitHub/obsidian/
    cp -r ~/Obsidian/Question\ -\ Problems\ -\ Solutions/ ~/GitHub/obsidian/
}


printf "\nObsidian Vault Folder Move Script\n"

printf "\nOption 1: Move From Obsidian to GitHub"
printf "\nOption 2: Move From GitHub to Obsidian\n\n"

# ask the user to enter option
read -p "Please Enter Option: " user_option

if [ $user_option -eq 1 ]; then
    printf "\nMoving From '%s' to '%s'\n" "$obsidian" "$github"
    # call the function
    obsidian_github


elif [ $user_option -eq 2 ]; then
    printf "\nMoving From '%s' to '%s'\n" "$github" "$obsidian"
    github_obsidian

else
    printf "\nWrong Input\n"
fi


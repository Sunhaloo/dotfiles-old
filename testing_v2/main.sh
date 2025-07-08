#!/usr/bin/env bash

source functions.sh
source packages.conf


# if ! git_configuration; then
#     printf "\nGit Configuration was Skipped or Failed, continuing with the rest..."
# fi

if ! source configs.sh; then
    printf "\nConfiguration SH was Skipped or Failed, continuing with the rest..."
fi

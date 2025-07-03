#!/usr/bin/env bash

# I already had an install script and it was great to be able to install and configure
# you entire system automatically and without much input from you. Really Cool Stuff!
# but then I came across this video by one of the GOAT typecraft:

# https://www.youtube.com/watch?v=62mygqukbYk

# even though my install script worked fine and did all the things that I asked it to do
# it was... Shit! I was "long" for nothing not even good code formatting and so on.
# heck I did not even used arrays ( because of my lack of experience also ); I did
# not think that I would have needed to. I basically "vibe-coded" my way around.

# therefore, I decided to "re-learn" BASH scripting. I did my learning differently
# whereby if I don't understand something, its only then I would open Obsidian to learn!
# now the time has come for me to actually write the install script.

# someone in a discord server that I am in told me that "Creating your own from
# scratch is one thing but in the real-world understanding and adapting existing code
# is what most of us, developers do" ( https://github.com/sandylnur )

# long story short... I am going to be "stealing" typecraft's code and adapting it for my usage
# Again, Thank You So Much Mr typecraft!

# import the `functions.sh` file
source functions.sh

# call the function to print the welcome screen
print_logo


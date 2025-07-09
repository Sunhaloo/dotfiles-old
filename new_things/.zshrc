# == define the default programs ==
export EDITOR="nvim"
# export TERM="kitty"
# export TERMINAL="kitty"
# export BROWSER="zen-browser"
# export FILE_MANAGER="thunar"

# == XDG Base Directory ==
# following the XDG Base Directory specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# == Paths ==
# define the path of binaries
export PATH="$PATH:/home/azmaan/.local/bin"
# define the custom directory path for OMZ configurations
export ZSH="$HOME/.config/oh-my-zsh"
# define the 'custom' folder path for OMZ
export ZSH_CUSTOM="$ZSH/custom"

# define the path of history iles

# define the custom path for ZSH's history file
HISTFILE="$XDG_CACHE_HOME/zsh_history"

ZSH_THEME="robbyrussell"

# remind me when to update OMZ instead of auto-updating / not updating at all
zstyle ':omz:update' mode reminder  # just remind me to update when it's time


# "default" OMZ  plugins are found inside `$ZSH/plugins/`
# custom plugins installed with OMZ ( NOT `pacman` ) are found inside `$ZSH_CUSTOM`
plugins=(git)

# actually load OMZ
source $ZSH/oh-my-zsh.sh

# NOTE: need to look into this!!!
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

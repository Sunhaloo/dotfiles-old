# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# ALIASES

# System
# change 'sudo' to 'fucking'
alias fucking='sudo'

# System ( Arch / Arch Based Distributions )
# search for installed applications ---> provide application / package name
alias pkgsearchI='sudo pacman -Q | grep'
# search for applications ---> provide application / package name
alias pkgsearch='sudo pacman -Ss'
# installing applications ---> provide application / package name
alias install='sudo pacman -S'
# removing and purging applications ---> provide application / package name
alias remove='sudo pacman -R'
# update the whole system
alias update='sudo pacman -Syu'
# clean system packages
alias clean='sudo pacman -Rns $(pacman -Qdtq)'

# System ( Debian / Debian Based Distributions )
# search for applications ---> provide application / package name
# alias pkgsearch='sudo apt search'
# installing applications ---> provide application / package name
# alias install='sudo apt-get install'
# removing and purging applications ---> provide application / package name
# alias remove='sudo apt-get remove'
# update the whole system
# alias update='sudo apt update; sudo apt upgrade -y'
# clean system packages
# alias clean='sudo apt autoremove -y; sudo apt autoclean'

# System - eza
alias ls='eza --no-user --no-time --no-permissions --icons=always'
alias ls -la='eza -la --no-user --no-time --no-permissions --icons=always'
alias tree='eza -T --icons=always'

# Applications
# opening up Neovim
alias nv='nvim'
# make opening Python like in Windows
alias python='python3'

# Tmux
alias t='tmux'

# Git
# LazyGit UI
alias lg="lazygit"
# clone repository ---> provide repository name
alias clone='git clone'
# alias for 'git status'
alias gs='git status'
# alias for 'git add' ---> provide files to add
alias ga='git add'
# alias for 'git commit' ---> provide the commit message
alias commit='git commit -m'
# alias for 'git push' ---> provide branch name
alias push='git push -u origin'
# alias for 'git log'
alias gl='git log'
# alias for 'git pull'
alias gp='git pull'
# Obsidian - GitHub repo
alias repo-azmaan='cd ~/GitHub/azmaan/'
# GitHub repo - dotfiles
alias repo-dotfiles='cd ~/GitHub/dotfiles/'
alias cp_GO='cp -r S.Sunhaloo ~/Obsidian/'
alias cp_OG='cp -r S.Sunhaloo ~/GitHub/azmaan/'

# System - cd / zoxide
# zoxide - smarter 'cd'
eval "$(zoxide init --cmd cd zsh)"

# 'fzf' fuzzy finder
source <(fzf --zsh)

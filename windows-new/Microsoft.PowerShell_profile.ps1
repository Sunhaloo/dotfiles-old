# System
# list all the packages installed with winget
function winget_list { & winget list $args }
Set-Alias -Name 'pkglist-installed' -Value winget_list
# search for a packages with winget
function winget_search { & winget search $args }
Set-Alias -Name pkgsearch -Value winget_search
# install a package with winget
function winget_install { & winget install $args }
Set-Alias -Name install -Value winget_install
# function to uninstall / remove a package
function winget_remove { & winget uninstall $args }
Set-Alias -Name remove -Value winget_remove

# System - eza
# ls
Remove-Item Alias:ls
function eza_ls { eza --no-user --no-time --no-permissions --icons=always }
Set-Alias -Name ls -Value eza_ls
# ll
function eza_ll { eza -la --no-user --no-time --no-permissions --icons=always }
Set-Alias -Name ll -Value eza_ll
# tree
Remove-Alias tree
function eza_tree { eza -T --icons=always }
Set-Alias -Name tree -Value eza_tree


# Applications
# neovim
Remove-Item Alias:nv -Force
Set-Alias nv nvim


# Git
# lazygit
Set-Alias lg lazygit
# clone repository
function clone_repo { & git clone $args }
Set-Alias -Name clone -Value clone_repo
# alias for 'git status'
function git_status { & git status $args }
Set-Alias -Name gs -Value git_status
# alias for 'git add'
function git_add { & git add $args }
Set-Alias -Name ga -Value git_add
# alias for 'git commit'
function git_commit { & 'git commit -m' $args }
Set-Alias -Name commit -Value git_commit
# alias for 'git push'
function git_push { & 'git push -u origin' $args }
Set-Alias -Name push -Value git_push
# alias for 'git log'
Remove-Item Alias:gl -Force
function git_log { & git log $args }
Set-Alias -Name gl -Value git_log
# alias for 'git pull'
Remove-Item Alias:gp -Force
function git_pull { & git pull $args }
Set-Alias -Name gp -Value git_pull


# zoxide - smarter 'cd'
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

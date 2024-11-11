# Git
# clone repository
function clone_repo { & git clone $args }
Set-Alias -Name clone -Value clone_repo

function git_status { & git status $args }
Set-Alias -Name gs -Value git_status

Remove-Item Alias:ls
function eza_ls { eza --no-user --no-time --no-permissions --icons=always }
Set-Alias -Name ls -Value eza_ls

# zoxide - smarter 'cd'
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

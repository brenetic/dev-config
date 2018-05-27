alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gci='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gm='git merge'
alias gp='git push'
alias gsh='git stash'
alias gst='git status'

complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_branch gba
complete -o default -o nospace -F _git_commit gc
complete -o default -o nospace -F _git_commit gci
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_pull gl
complete -o default -o nospace -F _git_merge gm
complete -o default -o nospace -F _git_push gp
complete -o default -o nospace -F _git_stash gsh

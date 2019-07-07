# GIT
alias gd='git diff'
alias gco='git checkout'
alias gstat='git status'
alias gpull='git pull'
alias gp='git push'
# alias gsync='git pull; git push'
alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'
alias current_branch='git branch | grep "^\*" | cut -d" " -f2'
alias gwip='save-changes-to-git-and-push-to-remote'




alias gup='git pull --rebase origin $(current_branch)'
compdef gup=git
alias gpush='git push origin $(current_branch)'
compdef gpush=git
alias gsync='git pull --rebase origin $(current_branch) && git push origin $(current_branch)'
compdef gsync=git

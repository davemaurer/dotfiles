alias rbp="source ~/.bash_profile"

# Shortcut for bundle exec
alias be="bundle exec"

# go back folders in term without cd
alias     ..="cd .."
alias    ...="cd ../.."
alias   ....="cd ../../.."
alias  .....="cd ../../../.."
alias ......="cd ../../../../.."
alias cdt="cd ~/Turing"
alias be="bundle exec"

# Git aliases
alias gs="git status"
alias gd="git diff --patience --ignore-space-change"
alias gc="git checkout"
alias gb="git branch"
alias ga="git add"
alias gh="git hist"
alias gk="git commit -m"
alias gac="git add .; git commit -m"

#Tmux commands
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tsess="tmux list-sessions"
alias td="tmux detach"
alias tks="tmux kill-server"
alias x="exit"
alias nw='tmux new-window -c "$PWD"'

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias l="ls -lFGgohq"

function xxx {
  echo "That is naughty."
  echo "That is SUPER naughty!."
  echo "THAT IS SUPER NAUGHTY!!!"
}

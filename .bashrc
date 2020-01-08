# Alias commands
alias q='exit'
alias c='clear'

# Alias directories
alias home='cd ~'
alias root='cd /'
alias repos='cd ~/Documents/repos'

# Alias git
alias gs='git status'
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'

# Grep color
export GREP_OPTIONS=' — color=auto'

# Set vim default editor
export EDITOR=vim

# SSH
alias ssh-waterloo='ssh krleitch@linux.student.cs.uwaterloo.ca'

# $1 is file to copy. $2 is destination
scp-waterloo() {
    scp "$1" "krleitch@linux.student.cs.uwaterloo.ca:~/$2"
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# PS1
export PS1="\[\033[38;5;197m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;243m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\]\[\033[38;5;38m\]\$(parse_git_branch)\[\033[00m\] "


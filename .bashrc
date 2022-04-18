# Alias commands
alias q='exit'
alias c='clear'

# Alias directories
alias home='cd ~'
alias root='cd /'
alias repos='cd ~/Documents/repos'

# Alias Current project
alias spot='cd ~/Documents/repos/spot'
alias spots='cd ~/Documents/repos/spot/spot-web'
alias spotw='cd ~/Documents/repos/spot/spot-server'
alias spotc='cd ~/Documents/repos/spot-chat'

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
    if  [[ -d "$1" ]]; then
        scp -r "$1" "krleitch@linux.student.cs.uwaterloo.ca:~/$2"
    else
        scp "$1" "krleitch@linux.student.cs.uwaterloo.ca:~/$2"
    fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# PS1
export PS1="\[\033[38;5;197m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;243m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$\[$(tput sgr0)\]\[\033[38;5;38m\]\$(parse_git_branch)\[\033[00m\] "


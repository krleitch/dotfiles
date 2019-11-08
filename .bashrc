# Alias commands
alias q='exit'
alias c='clear'

# Alias directories
alias home='cd ~'
alias root='cd /'

# Alias git
alias ga='git add -A'
alias gc='git commit -m'
alias gp='git push'

# Grep color
export GREP_OPTIONS=' — color=auto'

# Set vim default editor
export EDITOR=vim

# SSH
alias ssh-waterloo='ssh krleitch@linux.student.cs.uwaterloo.ca'

# PS1
export PS1="\[\033[38;5;197m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;241m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"


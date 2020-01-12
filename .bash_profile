oldps1=$PS1
# ps1 = color + oldps1 + endcolor
export PS1="\[\e[33m\]"$PS1"\[\e[m\]"
source ~/.bashrc

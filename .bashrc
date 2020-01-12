function timer_start {
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

trap 'timer_start' DEBUG

if [ "$PROMPT_COMMAND" == "" ]; then
  PROMPT_COMMAND="timer_stop"
else
  PROMPT_COMMAND="$PROMPT_COMMAND; timer_stop"
fi

#export PS1="\[\e[31m\]"$PS1"\[\e[m\]"
#export PS1="\[\033[38;5;162m\]\h\w${timer_show}s>\[$(tput sgr0)\]"
export PS1='\[\033[38;5;162m\]\h ${timer_show}s\w>\[$(tput sgr0)\]'

export PATH=$PATH:~/Library/Python/2.7/bin:~/bin

#python autocomplete in shell
PYTHONSTARTUP="/Users/`whoami`/.pyrc"
if [ -f $PYTHONSTARTUP ]; then
   export PYTHONSTARTUP
else
   PYTHONSTARTUP="/home/`whoami`/.pyrc"
   if [ -f $PYTHONSTARTUP ]; then
      export PYTHONSTARTUP
   else
      echo "Not able to set PYTHONSTARTUP"
   fi
fi

alias gitd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# some 'go' settings
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=~/Dropbox/go/


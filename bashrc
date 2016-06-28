# Kill all processes that contains the string from the first parameter.
monsterkill() {
  read -p "Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9
  fi
}

alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias aptinstall='sudo apt-get install -y'
alias ..='cd ..'
alias ...='cd ../../../'
alias :q='exit' # vim user :)
alias ll='ls -l'
alias la='ls -a'

################################################
#                    SOURCES                   #
# 1. http://qr.ae/RUbhwT                       #
################################################

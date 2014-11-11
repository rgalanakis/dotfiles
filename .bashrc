source ~/.aliases

function title() {
    echo -ne "\033]0;$1\007"
}

set_prompt () {
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Brown='\[\e[01;33m\]'
    Reset='\[\e[00m\]'

    PS1=""
    # If root, just print the host in red.
    # Otherwise, print the current user and host in green.
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h "
    else
        PS1+="$Green\\u@\\h "
    fi
    # Add the working directory and prompt marker in blue
    PS1+="$Blue\\w "
    # Reset the text color to the default.
    PS1+="\\\$$Reset "
}
PROMPT_COMMAND='set_prompt'

### brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

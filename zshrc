# exports / aliases ############################
export EDITOR="emacs"
export PATH="~/bin:$PATH"

if [[ $TERM == "rxvt-unicode" ]] ; then
   export TERM="xterm-256color"
fi

if [[ -d "$HOME/.cabal" ]]; then
   export PATH="$HOME/.cabal:$PATH"
fi

if [[ -f /usr/local/bin/virtualenvwrapper.sh ]]; then
   export WORKON_HOME="$HOME/.virtualenvs"
   export PROJECT_HOME="$HOME/dev"
   source /usr/local/bin/virtualenvwrapper.sh
   alias v="workon"
fi

alias u="sudo apt-get update"
alias s="apt-cache search"
alias i="sudo apt-get update; sudo apt-get install"
alias uu="sudo apt-get update; sudo apt-get dist-upgrade"
alias p="sudo apt-get purge"
alias du1="du --max-depth 1 -h"

# Base16 Shell
BASE16_SHELL="$HOME/.base16-railscasts.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# antigen ######################################
source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen theme agnoster
DEFAULT_USER=maik

antigen bundle git
antigen bundle command-not-found
antigen bundle pip
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions src

antigen apply

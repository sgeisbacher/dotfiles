#!/bin/bash

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
export GRADLE_HOME="/Users/stefan/Downloads/gradle-2.5/"


# PATH 
GNUCOREUTILS="/usr/local/opt/coreutils/libexec/gnubin" 
export PATH="$GNUCOREUTILS:$PATH:$GRADLE_HOME/bin"
export PATH="$PATH:/sbin:/usr/local/bin:$HOME/nc/bin:$HOME/bin"

# ALIASES
alias gst="git status"
alias gdiff="git diff"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg="glog"

alias eco2='cd $HOME/nc/code/eco2/'
alias eco11='cd $HOME/nc/code/eco11/'
alias eco2core='eco2 && cd xxxl-core'
alias eco11is='eco11 && cd lutzgroup/xxxl-is'
alias eco2os='eco2 && cd xxxl'
alias xis='eco11is'

alias ant='ncant'

alias vupssh='vagrant up && vagrant ssh'
alias vdupssh='vagrant destroy -f && vupssh'

alias wake_hdvdr='ssh 10.17.0.201 "bash boot_hdvdr.sh"'

alias ssh='LANG="en_US.UTF-8" LC_CTYPE="en_US.UTF-8" LC_ALL="en_US.UTF-8" /usr/bin/ssh'


# FUNCTIONS
fgrep () { find . -type f -name "$2" -print0 | xargs -0 grep "$1" ; }
ff () { /usr/bin/find . -name "$@" ; }

docker_destroy_all_containers () { docker_stop_all_containers && docker rm $(docker ps -aq) }
docker_destroy_all_images () { docker images | tail -n+2 | sed -r 's/\s{2,}/\t/g' | cut -f 3 | xargs docker rmi }
docker_destroy_all_images_forced () { docker images | taildd -n+2 | sed -r 's/\s{2,}/\t/g' | cut -f 3 | xargs docker rmi -f }
docker_stop_all_containers () { docker stop $(docker ps -aq) }
docker_stop_running_containers () { docker stop $(docker ps -q) }


# MISC
if ! (ssh-add -l | grep -q 'privateservers') ; then
	echo "adding id_rsa_privateservers to ssh-agent ..."
	ssh-add ~/.ssh/id_rsa_privateservers
fi

if ! (env | grep -i docker_host) ; then 
	echo "loading docker-environment ..."
	eval "$(docker-machine env docker-dev-box)"
fi

[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
else
  eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi

export TERM=xterm-256color

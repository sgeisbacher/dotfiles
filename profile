#!/bin/bash

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
export GRADLE_HOME="/usr/local/opt/gradle-2.14.1"

# GOLANG
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/private/code/go
export PATH=$(pyenv root)/shims:$GOPATH/bin:$PATH
alias gosrc="cd $GOPATH/src/github.com/sgeisbacher"
gocover() { go test -v -coverprofile=/tmp/cover.out "$1" && go tool cover -html=/tmp/cover.out -o /tmp/coverage.html && open /tmp/coverage.html }

# PATH
GNUCOREUTILS="/usr/local/opt/coreutils/libexec/gnubin" 
GNUFINDUTILS="/usr/local/opt/findutils/libexec/gnubin"
export PATH="$GNUFINDUTILS:$GNUCOREUTILS:$PATH:$GRADLE_HOME/bin"
export PATH="$PATH:/sbin:/usr/local/bin:$HOME/nc/bin:$HOME/bin"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


alias java7='JAVA_HOME=$(/usr/libexec/java_home -v 1.7)'
alias java8='JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'

alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'


# ALIASES
alias gst="git status"
alias gdiff="git diff"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg="glog"
alias gco="git checkout"
alias fdisks='fdisk -l | grep "Disk /"'


# VAGRANT
alias vupssh='vagrant up && vagrant ssh'
alias vdupssh='vagrant destroy -f && vupssh'

alias ssh='LANG="en_US.UTF-8" LC_CTYPE="en_US.UTF-8" LC_ALL="en_US.UTF-8" /usr/bin/ssh'

alias d='date +%Y-%m-%d'


# FUNCTIONS
fgrep () { find . -type f -iname "$2" -print0 | xargs -0 grep "$1" ; }
ff () { /usr/bin/find . -iname "$@" ; }
knownhost_reset () { [[ $1 =~ "^[0-9]+$" ]] && sed "${1}d" -i ~/.ssh/known_hosts }

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
export TERM=xterm-256color
export ANSIBLE_NOCOWS=1


# GPG
[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
  export GPG_AGENT_INFO
else
  eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
fi



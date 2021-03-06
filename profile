#!/bin/bash

# JAVA
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
# export GRADLE_HOME="/usr/local/opt/gradle-2.14.1"
# launchctl setenv JAVA_HOME "$JAVA_HOME"

# GOLANG
export GOROOT=/usr/local/opt/go/libexec
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH
alias gosrc="cd $GOPATH/src/github.com/sgeisbacher"
gocover() { go test -v -coverprofile=/tmp/cover.out "$1" && go tool cover -html=/tmp/cover.out -o /tmp/coverage.html && open /tmp/coverage.html }

# PATH
GNUCOREUTILS="/usr/local/opt/coreutils/libexec/gnubin" 
GNUFINDUTILS="/usr/local/opt/findutils/libexec/gnubin"
export PATH="$GNUFINDUTILS:$GNUCOREUTILS:$PATH:$GRADLE_HOME/bin"
export PATH="$PATH:/sbin:/usr/local/bin:$HOME/nc/bin:$HOME/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# MISC CODING STUFF
export REACT_DEVTOOLS_PATH="/Users/stefan/Library/Application Support/Google/Chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi/2.5.0_0"
export ANSIBLE_ROLES_PATH="/etc/ansible/roles:~/.ansible/roles"
# export PATH=$(pyenv root)/shims:$PATH

# ALIASES
alias 1pwd='gopass show -c 1pwd-masterpwd && open /Applications/1Password\ 7.app'
alias onepwd='1pwd'
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'
alias vimrc='vim $HOME/.vimrc'
alias zshrc='vim $HOME/.zshrc.local'
alias profile='vim $HOME/.profile'
alias gst="git status -sb"
alias gcd="_() { git log --left-right --graph --cherry-pick --oneline ${1}...${2} }; _"
alias gdiff="git diff"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg="glog"
alias gco="git checkout"
alias fdisks='fdisk -l | grep "Disk /"'
alias listenports='lsof -nPi | grep -i listen'
alias ssh='LANG="en_US.UTF-8" LC_CTYPE="en_US.UTF-8" LC_ALL="en_US.UTF-8" /usr/bin/ssh'
alias d='date +%Y-%m-%d'
alias vi='vim'
alias nmapsshsrvs='nmap -oG - -p 22 --open -sV'
alias mysqlclient='docker run -ti alpine /bin/sh -c "apk --update add mysql-client && /bin/sh"'


alias restic_nas='restic -r sftp:fileserver.grz:/srv/storage/fileserver/restic/stefan -p ~/.restic-passwd'
alias restic_htz='restic -r sftp:u151603@u151603.your-storagebox.de:stefan -p ~/.restic-passwd'
alias restic_aws='AWS_ACCESS_KEY_ID=${RESTIC_AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${RESTIC_AWS_SECRET_ACCESS_KEY} restic -r s3:https://s3.amazonaws.com/sgeisbacher-bkp/restic -p ~/.restic-passwd'
alias restic_franz='eval $(gopass network/restic/franz-cmd)'

# FUNCTIONS
fgrep () { find . -type f -iname "$2" -print0 | xargs -0 grep -HI "$1" ; }
ff () { /usr/bin/find . -iname "$@" ; }
ffs () { /usr/bin/find . -iname "*$@*" ; }
knownhost_reset () { [[ $1 =~ "^[0-9]+$" ]] && sed "${1}d" -i ~/.ssh/known_hosts }

docker_destroy_all_containers () { docker_stop_all_containers && docker rm $(docker ps -aq) }
docker_destroy_all_images () { docker images | tail -n+2 | sed -r 's/\s{2,}/\t/g' | cut -f 3 | xargs docker rmi }
docker_destroy_all_images_forced () { docker images | taildd -n+2 | sed -r 's/\s{2,}/\t/g' | cut -f 3 | xargs docker rmi -f }
docker_stop_all_containers () { docker stop $(docker ps -aq) }
docker_stop_running_containers () { docker stop $(docker ps -q) }

### extracts the given file
x () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# MISC
if ! (ssh-add -l | grep -q 'privateservers') ; then
	echo "adding id_rsa_privateservers to ssh-agent ..."
	ssh-add ~/.ssh/id_rsa_privateservers
fi
export TERM=xterm-256color
export ANSIBLE_NOCOWS=1


# GPG
#[ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
#if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#  export GPG_AGENT_INFO
#else
#  eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
#fi

[ -f ~/.profile-private ] && source ~/.profile-private
[ -f ~/.profile-starship ] && source ~/.profile-starship


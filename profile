#!/bin/bash

# BASH COLORS
RED='\033[0;31m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

sourceFile () { test -f "$1" && source "$1" || echo "${ORANGE}W: $1 not found, skipping ...${NC}" }

# JAVA
# export JAVA_HOME=$(/usr/libexec/java_home)
# export JAVA_TOOL_OPTIONS='-Djava.awt.headless=true'
# export GRADLE_HOME="/usr/local/opt/gradle-2.14.1"
# launchctl setenv JAVA_HOME "$JAVA_HOME"

# APPLE SILICON
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'

# GOLANG
###EEEexport GOROOT=/usr/local/go
#export GOPATH="$HOME/go"
export PATH=$HOME/go/bin:$PATH
#alias gosrc="cd $GOPATH/src/github.com/sgeisbacher"
gocover() { go test -v -coverprofile=/tmp/cover.out "$1" && go tool cover -html=/tmp/cover.out -o /tmp/coverage.html && open /tmp/coverage.html }

# RUST
#sourceFile $HOME/.cargo/env

# NODE
#export NODE_PATH=`npm root -g`

# PATH
export PATH="/opt/homebrew/opt/node@12/bin:$PATH"
GNUCOREUTILS="/opt/homebrew/opt/coreutils/libexec/gnubin"
GNUBINUTILS="/opt/homebrew/opt/binutils/bin"
GNUFINDUTILS="/opt/homebrew/opt/findutils/libexec/gnubin"
GNUGREPUTILS="/opt/homebrew/opt/grep/libexec/gnubin"
export PATH="$GNUGREPUTILS:$GNUBINUTILS:$GNUFINDUTILS:$GNUCOREUTILS:$PATH:$GRADLE_HOME/bin"
export PATH="$PATH:/sbin:/usr/local/bin:$HOME/bin"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# MISC CODING STUFF
export REACT_DEVTOOLS_PATH="/Users/stefan/Library/Application Support/Google/Chrome/Default/Extensions/fmkadmapgofadopljbjfkapdkoienihi/2.5.0_0"
export ANSIBLE_ROLES_PATH="/etc/ansible/roles:~/.ansible/roles"
# export PATH=$(pyenv root)/shims:$PATH

# ALIASES
alias reload_zsh='source $HOME/.zshrc'
alias 1pwd='gopass show -c 1pwd-masterpwd && open /Applications/1Password\ 7.app'
alias onepwd='1pwd'
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'
alias vimrc='vim $HOME/.vimrc'
alias nvimrc='cd $HOME/.config/nvim/ && nvim'
alias zshrc='vim $HOME/.zshrc.local'
alias profile='vim $HOME/.profile'
alias gst="git status -sb"
alias gdev="git checkout develop"
alias gfetch="git fetch --prune"
alias gpull="git pull --ff-only"
alias gpush="git push"
gbnew() { git checkout -b feature/$1 }
alias gporigin="git push -u origin HEAD"
alias gcd="_() { git log --left-right --graph --cherry-pick --oneline ${1}...${2} }; _"
alias gdiff="git diff"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glg="glog"
alias gco="git checkout"
alias gcom="git commit --no-verify"
alias gresetlocks="git status -s | cut -d' ' -f3 | egrep '(package-lock.json|yarn.lock)' | xargs -r git checkout --"
alias gclose="npx zx $HOME/dotfiles/scripts/git-shortcuts/index.mjs"
alias fdisks='fdisk -l | grep "Disk /"'
alias listenports='lsof -nPi | grep -i listen'
alias ssh='LANG="en_US.UTF-8" LC_CTYPE="en_US.UTF-8" LC_ALL="en_US.UTF-8" /usr/bin/ssh'
alias d='date +%Y-%m-%d'
alias vi='vim'
alias nmapsshsrvs='nmap -oG - -p 22 --open -sV'
alias mysqlclient='docker run -ti alpine /bin/sh -c "apk --update add mysql-client && /bin/sh"'
alias kc='kubectl config use-context'
alias k='kubectl'
alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
kubegetallenvvalues() { 
    kubectl get deployments -o=jsonpath="{range .items[*]}{.metadata.name}{'\t'}{.spec.template.spec.containers[0].env[?(@.name=='$1')].value}{'\n'}{end}"
}

video_speed_up() {
    ffmpeg -i "$1" -vf "setpts=0.33*PTS" "$2"
}
brew_version() {
    brew info --json $1 | jq -r '.[].versioned_formulae[]'
}

alias restic_nas='restic -r sftp:fileserver.grz:/srv/storage/fileserver/restic/stefan -p ~/.restic-passwd'
alias restic_htz='restic -r sftp:u151603@u151603.your-storagebox.de:stefan -p ~/.restic-passwd'
alias restic_aws='AWS_ACCESS_KEY_ID=${RESTIC_AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${RESTIC_AWS_SECRET_ACCESS_KEY} restic -r s3:https://s3.amazonaws.com/sgeisbacher-bkp/restic -p ~/.restic-passwd'
alias restic_franz='eval $(gopass network/restic/franz-cmd)'

alias fridgeFetch='curl https://jg734d2sub.execute-api.eu-central-1.amazonaws.com/dev/fetchAndStore'

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
echo "checking for ssh-key..."
if test -f "~/.ssh/id_rsa_privateservers"; then
	if ! (ssh-add -l | grep -q 'privateservers') ; then
		echo "adding id_rsa_privateservers to ssh-agent ..."
		ssh-add ~/.ssh/id_rsa_privateservers
	fi
fi
export TERM=xterm-256color
export ANSIBLE_NOCOWS=1


# GPG
# [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
# if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#   export GPG_AGENT_INFO
# else
#   eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
# fi

[ -f ~/dotfiles/profile-private ] && source ~/dotfiles/profile-private
[ -f ~/dotfiles/profile-starship ] && source ~/dotfiles/profile-starship

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

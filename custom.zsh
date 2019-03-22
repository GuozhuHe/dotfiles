export SSH_KEY_PATH="~/.ssh/rsa_id"

export PATH="/usr/local/sbin:$PATH"

export CLICOLOR=1

ZSH_THEME="steeef"

DEFAULT_USER="heguozhu"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy/mm/dd"

if [ `uname -s` = "Linux" ]; then
    plugins=(
        git
        golang
        httpie
        zsh-syntax-highlighting
        colored-man-pages
    )
elif [ `uname -s` = "Darwin" ]; then
    plugins=(
        git
        osx
        brew
        brew-cask
        golang
        httpie
        zsh-syntax-highlighting
        colored-man-pages
    )
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LANG=en_US.UTF-8
fi

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Go Settings
export GOPATH=~/code/go
mkdir -p $GOPATH
export PATH=$PATH:$GOPATH/bin
# End

# Proxy Settings
function proxy() {
    export ALL_PROXY=socks5://127.0.0.1:1086
}

function direct() {
    unset ALL_PROXY
}
alias ip="curl https://ip.cn"
# End

# Python Settings
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# End

# Git
alias glum='git pull upstream master'
alias glom='git pull origin master'
alias gpom='git push origin master'
alias gpo='git push origin'
alias glu='git pull upstream'
# End
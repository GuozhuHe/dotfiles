export SSH_KEY_PATH="~/.ssh/rsa_id"

# ZSH_THEME="half-life"
# ZSH_THEME="ys"
# ZSH_THEME="jispwoso"
# ZSH_THEME="lukerandall"
ZSH_THEME="steeef"

DEFAULT_USER="heguozhu"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy/mm/dd"

# my git config
alias glum='git pull upstream master'
alias glom='git pull origin master'
alias gpom='git push origin master'
alias gpo='git push origin'
alias glu='git pull upstream'
# end

export CLICOLOR=1
if [ `uname -s` = "Linux" ]; then
    plugins=(git autojump golang httpie)
elif [ `uname -s` = "Darwin" ]; then
    plugins=(git osx autojump brew brew-cask golang)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    export LANG=en_US.UTF-8
fi

source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Go Settings
export GOPATH=~/code/go
mkdir -p $GOPATH

# End

export PATH=$PATH:$GOPATH/bin

# Proxy Settings

function proxy() {
    export http_proxy=http://localhost:8118;export https_proxy=http://localhost:8118
}

function direct() {
    unset http_proxy;
    unset https_proxy;
}

# plugins
plugins=(
    git
    zsh-syntax-highlighting
)

# End

# Python Settings

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# virtualenv wrapper

VIRTUALENVWRAPPER_BIN=virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
mkdir -p $WORKON_HOME

if which $VIRTUALENVWRAPPER_BIN > /dev/null; then
    source $VIRTUALENVWRAPPER_BIN
fi

# End

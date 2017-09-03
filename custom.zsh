export SSH_KEY_PATH="~/.ssh/rsa_id"

# ZSH_THEME="half-life"
ZSH_THEME="ys"

# PROMPT=$'%{$purple%}%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%} in %{$limegreen%}%~%{$reset_color%}$(ruby_prompt_info " with%{$fg[red]%} " v g "%{$reset_color%}")$vcs_info_msg_0_%{$orange%}%{$reset_color%} λ%{$reset_color%} '

DEFAULT_USER="heguozhu"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy/mm/dd"

# my git config
alias glum='git pull upstream master'
alias glom='git pull origin master'
alias gpom='git push origin master'
alias gpo='git pull origin'
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

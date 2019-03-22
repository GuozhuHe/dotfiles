TARGETS=prepare git zsh vim tmux

ZSH_CONF_NAME=${USER}.zsh

GIT=~/.gitconfig
TMUX=~/.tmux.conf
ZSH=~/.oh-my-zsh
ZSH_CONF=~/.oh-my-zsh/custom/${ZSH_CONF_NAME}
VIM=~/.vimrc ~/.vim

all: $(TARGETS)

prepare: $(PREPARE)
git: $(GIT)
tmux: $(TMUX)
zsh: $(ZSH) $(ZSH_CONF)
vim: $(VIM)

$(PREPARE):
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
	brew install tmux
	brew install iterm2
	brew install pyenv
	brew install pyenv-virtualenv

$(GIT): gitconfig
	cp gitconfig $(GIT)

$(ZSH):
	git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
	cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

$(ZSH_CONF): custom.zsh
	cp custom.zsh $(ZSH_CONF)

$(VIM): vimrc
	rm -rf ~/.vimrc ~/.vim
	mkdir ~/.vim
	cp vimrc ~/.vimrc
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

$(TMUX): tmux.conf
	cp tmux.conf $(TMUX)

.PHONY: clean

clean:
	-rm -rf $(GIT) $(TMUX) $(VIM) $(ZSH) ./zshrc


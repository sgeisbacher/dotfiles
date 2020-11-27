install:
	echo 'todo'

install-vim:
	ln -s ~/dotfiles/vi/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

install-zsh:
	ln -s ~/dotfiles/zsh/zshrc.local ~/.zshrc.local

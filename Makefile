install:
	echo 'todo'

install-vim:
	ln -s ~/dotfiles/vi/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

install-nvim:
	ln -s ~/dotfiles/nvim ~/.config/nvim
	nvim +PlugInstall

install-zsh:
	ln -s ~/dotfiles/profile ~/.profile
	ln -s ~/dotfiles/zsh/zshrc.local ~/.zshrc.local

install:
	echo 'todo'

install-vim:
	ln -s ~/dotfiles/vi/vimrc ~/.vimrc
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

install-nvim-deps:
	npm install -g typescript-language-server
	npm install -g graphql-language-service-server
	npm install -g graphql-language-service-cli
	npm install -g diagnostic-languageserver
	npm install -g eslint_d
	npm install -g prettier

install-nvim-debian:
	apt-get install -y silversearcher-ag

install-nvim: 
	mkdir -p ~/.config
	ln -sf ~/dotfiles/nvim ~/.config/nvim
	sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	nvim +PlugInstall

install-zsh:
	ln -s ~/dotfiles/profile ~/.profile
	ln -s ~/dotfiles/zsh/zshrc.local ~/.zshrc.local

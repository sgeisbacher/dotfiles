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

install-zsh:
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	ln -s ~/dotfiles/profile ~/.profile
	ln -s ~/dotfiles/zsh/zshrc.local ~/.zshrc.local

install-starship-prompt:
	ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

	brew tap homebrew/cask-fonts
	brew install --cask font-fira-code-nerd-font

	echo "++++++++++++++++++++++++++++++++++++++++++++++\n\n    comment the following in .zshrc:\n 2541    # Finally enable one of the prompts.\n 2542    if [[ -n $GRML_CHROOT ]]; then\n 2543        prompt grml-chroot\n 2544    elif [[ $GRMLPROMPT -gt 0 ]]; then\n 2545        prompt grml-large\n 2546    else\n 2547        prompt grml\n 2548    fi\n\n++++++++++++++++++++++++++++++++++++++++++++++\n\n https://github.com/starship/starship/issues/2525#issuecomment-809968562"


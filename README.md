vim config
===

### Installation

1. Pull 

	```
	cd ~
	git clone git@github.com:divisoryang/vim.git .vim
	cd .vim
	git submodule init & update
	```

2. Install

	Open Gvim and type ```:BundleInstall```  
	You need to compile YouCompleteMe after BundleInstall
	
		cd ~/.vim/bundle/YouCompleteMe ; ./install
		
	ps. CMake is required for YouCompleteMe installation, Font that I use is Inconsolata.
	
3. Add tmp folder

		mkdir ~/.tmp
		
		
4. Go auto completion

	refer to ```https://github.com/nsf/gocode```
	
	brief installation procedure: 
	
		cd ~/tmp
		git clone https://github.com/nsf/gocode
		cd gocode
		go build .
		cp gocode $GOBIN/
		cd vim
		./update.sh
	
	In my computer, GO installed in ~/src/go, just replace this path with yours in .vimrc
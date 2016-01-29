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
	After Bundles Installed, run :GoInstallBinaries, install Go dependences for go-vim  
	You need to compile YouCompleteMe after BundleInstall
	
		cd ~/.vim/bundle/YouCompleteMe ; ./install
		
	ps. CMake is required for YouCompleteMe installation, Font that I use is Inconsolata.
	
3. Add tmp folder

		mkdir ~/.tmp
		

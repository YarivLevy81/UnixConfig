#!/bin/bash



set -e

function main {

	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install curl
	sudo apt-get install vim

	# Install pathogen - vim package manager
	echo "Installing Pathogen.."
	mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	# Install NERDTRee - vim tree 
	echo "Installing NERDtree.."
	git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
	
	echo "Installing Lightline.."	
	# Install Lightline - informator for vim
 	git clone https://github.com/itchyny/lightline.vim ~/.vim/bundle/lightline.vim
    
	echo "Install Gruvbox.."
    	# Install Gruvbox - vim theme
    	git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox

	if [-f ~/.vimrc]; then
		cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim ~/.vim/colors/

	fi	
	cp .vimrc ~/.
    
    	if [-f ~/.bashrc]; then
	    mv ~/.bashrc ~/.bashrc.tmp
    	fi
	cp .bashrc ~/.

    	mkdir ~/.vim/colors
    	cp ~/.vim/bundle/gruvbox/colors/gruvbox.vim ~/.vim/colors/
}

main "$@"

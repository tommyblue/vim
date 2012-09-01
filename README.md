# Il mio VIM

In questo repository trovate le configurazioni del mio Vim. Per utilizzarlo clonate il repository:

    git clone git@github.com:tommyblue/vim.git ~/.vim/

aggiornate i moduli git:

    cd ~/.vim/
    git submodule init
    git submodule update

Aprite vim e lanciate `:BundleInstall` per installare il necessario dopodichè create il file `~/.vimrc` con questo contenuto:

	  source ~/.vim/vimrc

Se usate gVim o MacVim è necessario anche creare il file `~/.gvimrc` con:

    source ~/.vim/gvimrc

Per installare SuperTab bisogna scaricare il file `vba` da [http://www.vim.org/scripts/script.php?script_id=1643](http://www.vim.org/scripts/script.php?script_id=1643) aprirlo con Vim e farne il source con:

    :so %

Per le istruzioni su come compilare i vari plugin (in particolare Command-T che potrebbe causare un Segmentation Fault di Vim se non compilato), seguite [le istruzioni nel mio blog](http://tommyblue.it/2012/09/01/passare-a-vim-grazie-ad-emacs).

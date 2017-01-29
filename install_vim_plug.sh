curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "call plug#begin('~/.vim/plugged')" >> ~/.vimrc
echo "Plug 'scrooloose/nerdtree'" >> ~/.vimrc
echo "Plug 'Nopik/vim-nerdtree-direnter'" >> ~/.vimrc
echo "Plug 'jistr/vim-nerdtree-tabs'" >> ~/.vimrc
echo "Plug 'Xuyuanp/nerdtree-git-plugin'" >> ~/.vimrc
#echo ""Plug 'vim-scripts/taglist.vim'" >> ~/.vimrc
echo "Plug 'majutsushi/tagbar'" >> ~/.vimrc
echo "Plug 'vim-scripts/Emmet.vim'" >> ~/.vimrc
echo "Plug 'bling/vim-airline'" >> ~/.vimrc
echo "Plug 'kien/ctrlp.vim'" >> ~/.vimrc
echo "Plug 'tpope/vim-fugitive'" >> ~/.vimrc
echo "Plug 'davidhalter/jedi-vim'" >> ~/.vimrc
echo "Plug 'airblade/vim-gitgutter'" >> ~/.vimrc
echo "Plug 'Yggdroot/indentLine'" >> ~/.vimrc
echo "Plug 'Valloric/YouCompleteMe'" >> ~/.vimrc
echo "Plug 'honza/vim-snippets'" >> ~/.vimrc
echo "Plug 'SirVer/ultisnips'" >> ~/.vimrc
echo "Plug 'junegunn/vim-easy-align'" >> ~/.vimrc
echo "Plug 'scrooloose/syntastic'" >> ~/.vimrc
#echo ""Plug 'python-mode/python-mode'" >> ~/.vimrc
echo "call plug#end()" >> ~/.vimrc


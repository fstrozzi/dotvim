git clone https://github.com/fstrozzi/dotvim ~/.vim
cd ~/.vim
git submodule init
git submodule update
git submodule foreach git checkout master
ln -s ~/.vim/vimrc ~/.vimrc
cd


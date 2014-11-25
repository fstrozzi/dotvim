DotVim
------

Personal VIM configurations, plugins and themes

Quick Install
-------

```shell
curl -sSL https://raw.githubusercontent.com/fstrozzi/dotvim/master/install.sh | bash
```

Manual Install
-------

```shell
git clone https://github.com/fstrozzi/dotvim ~/.vim

cd ~/.vim

git submodule init

git submodule update

git submodule foreach git checkout master

ln -s ~/.vim/vimrc ~/.vimrc


```

# dotfiles
```sh  
for dir in .config/; do 
    ln -s $dir ~/.config/$dir
done

ln -s gitignore ~/.gitignore
#ln -s gitconfig ~/.gitconfig
```

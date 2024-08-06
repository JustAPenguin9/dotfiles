# my config files

## setup

```sh
cd $HOME
git clone https://github.com/JustAPenguin9/dotfiles
cd dotfiles

stow .
```

also run this after the fact
```sh
git config --global core.excludesFile ~/.config/git/ignore
```

## teardown

```sh
cd $HOME/dotfiles
stow -D .
```

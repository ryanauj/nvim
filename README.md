# nvim
Personal Neovim Configuration Directory `~/.config/nvim`

# Install 

## Make backup of current nvim folder

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

## Clean neovim folders (Optional but recommended)

```sh
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

## Install Packer
Run packer [installation instructions](https://github.com/wbthomason/packer.nvim#quickstart)

## Clone this repo

```sh
git clone --depth 1 https://github.com/ryanauj/nvim.git ~/.config/nvim
```

# TODOS
- Run install packer and run packer sync with script on nvim first load

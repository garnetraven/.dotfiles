# Corbin's dotfiles

## Installation
<b>Warning:</b> If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git

You can clone the repository wherever you want. (I like to keep it in ~/.dotfiles acting as the symlink)

### Prerequisites

1. Install git

```
sudo apt install git
```

2. Install wget or curl

```
sudo apt instatll wget
```

```
sudo apt install curl
```

3. Install gnu stow

```
sudo apt install stow
```

### Setup

1. Git clone the repo.

   ```
   git clone https://github.com/garnetraven/.dotfiles.git
   ```

2. Install Neovim nightly
   
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim
```

3. Install Tmux

```
sudo apt install tmux
```

4. Install Zsh + OhMyZsh

```
sudo apt install zsh
```

`curl`

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

`wget`

```
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
   
5. Install PowerLevel10k

`install recommended fonts`

```
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS\ NF\ Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS\ NF\ Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS\ NF\ Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS\ NF\ Bold\ Italic.ttf
```

Configure fonts

`Ubuntu`

```
mkdir ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
fc-cache -fv
```

`install PowerLevel10k`

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```

6. stow your config

```
cd ~/.dotfiles
stow .
```


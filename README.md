# Deps
* nvim
* ripgrep
* nodejs
* python3
* vim-plug
* pynvim
* tmux

# Installation
1. Install pynvim - `python3 -m pip install --user --upgrade pynvim`
2. 
a) Install vim-plug `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
b) install zsh-autosuggestions `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
c) install zsh-syntax-highlighting `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
3. Replace `~/.config/nvim/init.vim`
4. Run `:PlusInstall`

# To Do
* Create install script
* version control all configs in same project

# Deps
* ripgrep
* tmux
* nodejs
    * neovim 
* python3
    * pynvim
* nvim
    * vim-plug

# Installation
1. Install pynvim - `python3 -m pip install --user --upgrade pynvim`
2. install node neovim - `npm install -g neovim`
3. Install vim-plug `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
4. Replace `~/.config/nvim/init.vim`
5. Run `:PlusInstall`

# zsh
1. `brew install zsh`
2. install ohmyzsh - `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"` 
3. install zsh-autosuggestions - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
4. install zsh-syntax-highlighting - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
5. In ~/.zshrc - `plugins=(git␣zsh-autosuggestions␣zsh-syntax-highlighting)`

# To Do
* Create install script
* version control all configs in same project

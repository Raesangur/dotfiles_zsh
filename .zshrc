# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Clear screen
clear

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Deal with locale
LC_CTYPE=en_US.UTF-8
LC_ALL=en_US.UTF-8

# zsh theme
#ZSH_THEME="nanotech"
source ~/dotfiles/zsh/prompt

# Disable % eof
unsetopt prompt_cr prompt_sp

# Date format
HIST_STAMPS="yyyy-mm-dd"

# zsh plugins
plugins=(
# plugins softwares
docker
git
mvn
node
npm
python


# plugins tools
emoji
web-search

# plugins misc
sudo
)

# Apply zsh config
source $ZSH/oh-my-zsh.sh


# User configuration
PATH=${PATH}:~/.local/bin
export PATH=$PATH:$HOME/ardupilot/Tools/autotest
export PATH=$PATH:~/.local/.bin/gcc-arm-none-eabi-10-2020-q4-major/bin
export PATH=/opt/avr8-gnu-toolchain-linux_x86_64/bin:$PATH
export PATH=/usr/lib/ccache:$PATH

export DISPLAY=:0

PATH=${PATH}:~/.local/bin:~/scripts
PATH=${PATH}:~/.cargo/bin
export PATH

# Set Software Aliases
source ~/dotfiles/zsh/alias

# ESP-IDF
alias get_idf='. $HOME/esp/esp-idf/export.sh ; . $HOME/esp/rust-build/export-esp.sh'

# Setup ctrl+backspace & ctrl+delete to work in terminal
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# Setup shortcut to wine 'C:\' folder
hash -d wine=/home/pascal/.wine/drive_c

# Adding function pathadd to add a folder to path if it doesn't already exists
# https://superuser.com/a/39995
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Display welcome message on shell startup
#~/scripts/welcome.sh
source ~/dotfiles/zsh/welcome
source ~/dotfiles/zsh/updates

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/root/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/root/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/root/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/root/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

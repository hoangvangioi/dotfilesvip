export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="uysal"

plugins=(
        git 
        archlinux 
        rust 
        python 
        colored-man-pages
        ros
        flutter
        vscode
        flutter 
        extract 
        web-search 
        git-extras 
        docker 
        zsh-autosuggestions 
        zsh-syntax-highlighting 
        zsh-completions 
        zsh-autocomplete 
        sudo 
        copyfile
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Ibus bamboo
export GTK_IM_MODULE=xim
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT4_IM_MODULE=ibus
export CLUTTER_IM_MODULE=ibus
export GLFW_IM_MODULE=ibus
ibus-daemon -drx

source /opt/ros/iron/setup.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/alireza/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/alireza/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alireza/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/alireza/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export PS1=">> "
alias clc="clear"
# tmux setup for vim colour scheme:
#alias tmux="TERM=screen-256color-bce tmux"
#set -g default-terminal "xterm"

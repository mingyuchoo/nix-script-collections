umask 022


if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]
then
    source "$HOME/.bashrc"
fi


export HISTSIZE=10000
export HISTFILESIZE=10000
export EDITOR=emacs


PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.emacs.d/bin"
export PATH

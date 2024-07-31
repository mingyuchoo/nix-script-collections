umask 022


if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi


export HISTSIZE=10000
export HISTFILESIZE=10000

#export EDITOR=emacs
export EDITOR=nvim


PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.emacs.d/bin:$PATH"
PATH="$HOME/.nix-profile/bin:$PATH"
export PATH



if [ -r '/home/mgch/.opam/opam-init/init.sh' ] ; then
    . '/home/mgch/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
fi

eval "$(opam env)"


# eval "$(direnv hook bash)"



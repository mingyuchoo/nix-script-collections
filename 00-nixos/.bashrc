[[ $- != *i* ]] && return


stty erase ^H


PS1='[\u@\h \W]\$ '


alias df='df -h'
alias dir='ls --color=auto'
alias ls='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'



function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

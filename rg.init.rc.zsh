
if (( $+commands[rg] )); then
    function rg() {
        =rg --no-ignore-vcs --pretty --hidden --no-ignore-messages --follow --no-messages "$@"
    }
    function rgl() {
        rg "$@" | less -RFX
    }
fi


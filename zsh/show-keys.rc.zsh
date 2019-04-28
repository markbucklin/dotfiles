function echo_color() {
    local color="$1"
    printf "${color}$2\033[0m\n"
}
function show_keys() {
    echo_color "\033[0;90m" "c-f  Move forward"
    echo_color "\033[0;90m" "c-b  Move backward"
    echo_color "\033[0;90m" "c-p  Move up"
    echo_color "\033[0;90m" "c-n  Move down"
    echo_color "\033[0;90m" "c-a  Jump to beginning of line"
    echo_color "\033[0;90m" "c-e  Jump to end of line"
    echo_color "\033[0;90m" "c-d  Delete forward"
    echo_color "\033[0;90m" "c-h  Delete backward"
    echo_color "\033[0;90m" "c-k  Delete forward to end of line"
    echo_color "\033[0;90m" "c-u  Delete entire line"
    # todo: map to current keybindkings
}
show_keys

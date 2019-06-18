# vim: set ft=zsh ts=2 sw=2 et:
setopt promptsubst
autoload -Uz add-zsh-hook
# autoload -Uz promptinit && promptinit
autoload -Uz vcs_info
autoload -Uz prompt
MODE_CURSOR_VICMD="green steady underline"
MODE_CURSOR_VIINS="red blinking bar"
MODE_CURSOR_SEARCH="yellow steady block"
# MODE_INDICATOR_VIINS='%F{15}[%F{9}  INS  %F{15}]%f%K{black}'
# MODE_INDICATOR_VICMD='%F{15}[%F{10}  CMD  %F{15}]%f%K{black}'
# MODE_INDICATOR_REPLACE='%F{15}[%F{5}REPLACE%F{15}]%f%K{black}'
# MODE_INDICATOR_SEARCH='%F{15}[%F{14}SEARCH %F{15}]%f%K{black}'
# MODE_INDICATOR_VISUAL='%F{15}[%F{11}  VIS  %F{15}]%f%K{black}'
# MODE_INDICATOR_VLINE='%F{15}[%F{13}VISLINE%F{15}]%f%K{black}'
MODE_INDICATOR_VIINS='%K{124}%F{black} VIINS %f%k'
MODE_INDICATOR_VICMD='%K{28}%F{black} VICMD %f%k'
MODE_INDICATOR_REPLACE='%K{5}%F{black}REPLACE%f%k'
MODE_INDICATOR_SEARCH='%K{14}%F{black} SEARCH%f%k'
MODE_INDICATOR_VISUAL='%K{11}%F{black} VISUAL%f%k'
MODE_INDICATOR_VLINE='%K{13}%F{black} VLINE %f%k'

# Version control info in prompt
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
precmd () { vcs_info }

PS1='
%B${MODE_INDICATOR_PROMPT}%b %F{4}%n%F{7}@%F{4}%m: %74<..<%F{red}%B%~%b%f ${vcs_info_msg_0_}
%B%F{green}%(!,#,$)%f%b '
RPS1=' %F{white}%K{black}%B %D{%a %b %d} %D{%I:%M:%S%P}'

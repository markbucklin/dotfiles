
bindkey -M viins "jj" vi-cmd-mode
# bindkey -M viins "kj" vi-cmd-mode
bindkey -M viins "^P" up-line-or-history
bindkey -M viins "^N" down-line-or-history
bindkey -M viins "<M-l>" history-beginning-search-backward
bindkey -M viins "<M-L>" history-beginning-search-forward
bindkey -M viins ",,l" end-of-line
bindkey -M viins ",,h" beginning-of-line
bindkey -M viins ",,j" down-line
bindkey -M viins ",,k" up-line
bindkey -M vicmd ",,l" end-of-line
bindkey -M vicmd ",,h" beginning-of-line
bindkey -M vicmd ",,j" down-line
bindkey -M vicmd ",,k" up-line
bindkey -M visual ",,l" end-of-line
bindkey -M visual ",,h" beginning-of-line
bindkey -M visual ",,j" down-line
bindkey -M visual ",,k" up-line



# bindkey -M viins "" accept-line-and-down-history

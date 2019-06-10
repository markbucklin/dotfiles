# Bind Common FZF Widget Keybindings
# export FZF_COMPLETION_TRIGGER='**'

for m in viins vicmd; do
    bindkey -M "$m" '^@' list-choices
    bindkey -M "$m" "^X^L" list-choices
    bindkey -M "$m" "^X^O" list-expand
    bindkey -M "$m" "^X^M" menu-select
    bindkey -M "$m" "^X^J" menu-complete
    bindkey -M "$m" "^X^C" expand-cmd-path
    bindkey -M "$m" "^X^k" reverse-menu-complete
    bindkey -M "$m" "^X^H" expand-history
    bindkey -M "$m" "^X^[h" history-incremental-pattern-search-backward
    bindkey -M "$m" "^X^[H" history-incremental-pattern-search-forward



    # bindkey -M "$m" '^R' fzf-history-widget
    bindkey -M "$m" '^[R' fzf-history-widget
    bindkey -M "$m" '^[T' fzf-file-widget
    bindkey -M "$m" '^[C' fzf-cd-widget
    # bindkey -M "$m" '^I' expand-or-complete

    bindkey -M "$m" '^\ch' _complete_help
    bindkey -M "$m" '^\fh' _correct_filename
    bindkey -M "$m" '^\wh' _correct_word
    bindkey -M "$m" '^\hcn' _history-complete-newer
    bindkey -M "$m" '^\hco' _history-complete-older
    bindkey -M "$m" '^\^\' accept-and-menu-complete
    bindkey -M "$m" '^\wl' complete-word
    bindkey -M "$m" '^\oc' expand-or-complete
    bindkey -M "$m" '^\op' expand-or-complete-prefix
    bindkey -M "$m" '^\mc' menu-complete
    bindkey -M "$m" '^\meoc' menu-expand-or-complete
    bindkey -M "$m" '^\rmc' reverse-menu-complete
done
bindkey -M menuselect '^j' vi-down-line-or-history
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M viins "^[O" vi-cmd-mode
bindkey -M viins "^[oj" accept-line-and-down-history
bindkey -M viins "^[ogl" end-of-line
bindkey -M viins "^[ogh" beginning-of-line

# use function in 'zsh-vim-mode' plugin to define a couple extra keybindings
# vim-mode-bindkey vicmd -- fzf-locate-widget '^[i'
# bindkey -M "$m" ',,^I' fzf-completion
# bindkey -M "$m" '^I' fzf-completion
# vim-mode-bindkey viins visual -- vi-cmd-mode '^[i'

# toggle between vi-cmd and vi-ins using ALT+I
bindkey -M vicmd '^[i' vi-insert
bindkey -M viins '^[i' vi-cmd-mode
bindkey -M visual '^[i' vi-cmd-mode

# control j to open line below in vi insert mode
bindkey -M viins '^J' vi-open-line-below

# quickly open previous line for editing at tail end or beginning
bindkey -M viins -s '^[L' '\ek$A \egel'
bindkey -M viins -s ',.' '\ekA'
bindkey -M viins -s '^[H' '\ek^cW'

# bindkey -M viins -s ',,kh' '^[ik^'
# bindkey -M viins -s ',,kj' '^[ik^W'
# bindkey -M viins -s ',,kk' '^[ik$B'
# bindkey -M viins -s ',,kl' '^[ik$'
# bindkey -M viins -s ',,kv' '^[ik$vB'

# vim-mode-bindkey       vicmd -- accept-line-and-down-history '^o'
vim-mode-bindkey vicmd visual -- end-of-line 'gl'
vim-mode-bindkey vicmd visual -- beginning-of-line 'gh'

# vim-mode-bindkey viins vicmd -- fzf-completion '^i'
vim-mode-bindkey viins vicmd -- fzf-cd-widget ',,c'
vim-mode-bindkey viins vicmd -- fzf-file-widget ',,t'
vim-mode-bindkey viins vicmd -- fzf-locate-widget ',,l'
vim-mode-bindkey viins vicmd -- fzf-history-widget ',,r'

# remap some commands to leader-sequence
vim-mode-bindkey viins vicmd -- fzf-insert-directory ',,id'
vim-mode-bindkey viins vicmd -- fzf-insert-files ',,if'
vim-mode-bindkey viins vicmd -- fzf-insert-history ',,ih'
vim-mode-bindkey viins vicmd -- fzf-insert-named-directory ',,ind'
vim-mode-bindkey viins vicmd -- fzf-change-directory ',,,cd'
vim-mode-bindkey viins vicmd -- fzf-change-named-directory ',,cnd'
vim-mode-bindkey viins vicmd -- fzf-change-recent-directory ',,crd'
vim-mode-bindkey viins vicmd -- fzf-docker-kill-containers ',,dkc'
vim-mode-bindkey viins vicmd -- fzf-docker-logs-container ',,dlc'
vim-mode-bindkey viins vicmd -- fzf-docker-remove-containers ',,drc'
vim-mode-bindkey viins vicmd -- fzf-docker-remove-images ',,dri'
vim-mode-bindkey viins vicmd -- fzf-docker-remove-volumes ',,drv'
vim-mode-bindkey viins vicmd -- fzf-docker-start-containers ',,dsc'
vim-mode-bindkey viins vicmd -- fzf-docker-stop-containers ',,dsc'
vim-mode-bindkey viins vicmd -- fzf-edit-dotfiles ',,edf'
vim-mode-bindkey viins vicmd -- fzf-edit-files ',,ef'
vim-mode-bindkey viins vicmd -- fzf-exec-ssh ',,essh'
vim-mode-bindkey viins vicmd -- fzf-git-add-files ',,gaf'
vim-mode-bindkey viins vicmd -- fzf-git-change-repository ',,gcr'
vim-mode-bindkey viins vicmd -- fzf-git-checkout-branch ',,gcb'
vim-mode-bindkey viins vicmd -- fzf-git-checkout-branch ',,gco'
vim-mode-bindkey viins vicmd -- fzf-git-delete-branches ',,gdb'
vim-mode-bindkey viins vicmd -- fzf-github-close-issue ',,gclo'
vim-mode-bindkey viins vicmd -- fzf-github-comment-issue ',,gcomi'
vim-mode-bindkey viins vicmd -- fzf-github-edit-issue ',,gei'
vim-mode-bindkey viins vicmd -- fzf-github-open-issue ',,goi'
vim-mode-bindkey viins vicmd -- fzf-github-show-issue ',,gsi'
vim-mode-bindkey viins vicmd -- fzf-kill-processes ',,kp'
vim-mode-bindkey viins vicmd -- fzf-select-docker-widget ',,sd'
vim-mode-bindkey viins vicmd -- fzf-select-git-widget ',,sg'
vim-mode-bindkey viins vicmd -- fzf-select-github-widget ',,sh'
vim-mode-bindkey viins vicmd -- fzf-select-widget ',,^s'

vim-mode-bindkey viins vicmd -- describe-key-briefly ',,hk'
vim-mode-bindkey viins vicmd -- run-help ',,hm'
vim-mode-bindkey viins vicmd -- which-command ',,hw'

# type help with current command and repaste on next line
bindkey -M viins -s ',,hh' '\eyyA  --help^M^[iPA'
# bindkey -M vicmd -s ',,hh' 'yyA  --help^M^[iPA'

# keybindings for exiting insert mode
# bindkey -M viins "jj" vi-cmd-mode
# bindkey -M viins ",." vi-cmd-mode
# bindkey -M viins  "^[i" vi-cmd-mode

# bindkey -M viins "^P" up-line-or-history
# bindkey -M viins "^N" down-line-or-history

# bindkey -M viins "<M-l>" history-beginning-search-backward
# bindkey -M viins "<M-L>" history-beginning-search-forward

# bindkey -M viins ",,l" end-of-line
# bindkey -M viins ",,h" beginning-of-line
# bindkey -M viins ",,j" down-line
# bindkey -M viins ",,k" up-line
# bindkey -M visual ",,l" end-of-line
# bindkey -M visual ",,h" beginning-of-line
# bindkey -M visual ",,j" down-line
# bindkey -M visual ",,k" up-line

# bindkey -M vicmd "gl" end-of-line
# bindkey -M vicmd "gh" beginning-of-line
# bindkey -M visual "gl" end-of-line
# bindkey -M visual "gh" beginning-of-line

# bindkey -M viins "^j" vi-cmd-mode
# bindkey -M visual "^j" vi-cmd-mode

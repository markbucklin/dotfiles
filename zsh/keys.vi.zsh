# Bind Common FZF Widget Keybindings

for m in viins vicmd; do
    bindkey -M "$m" '^@' expand-or-complete
    bindkey -M "$m" "^X^L" list-choices
    bindkey -M "$m" "^X^O" list-expand
    bindkey -M "$m" "^X^M" menu-select
    bindkey -M "$m" "^X^J" menu-complete
    bindkey -M "$m" "^X^C" expand-cmd-path
    bindkey -M "$m" "^X^k" reverse-menu-complete
    bindkey -M "$m" "^X^H" expand-history
    bindkey -M "$m" "^X^[h" history-incremental-pattern-search-backward
    bindkey -M "$m" "^X^[H" history-incremental-pattern-search-forward

    bindkey -M "$m" '^[m' accept-line-and-down-history
    bindkey -M "$m" "^['" quote-line
    bindkey -M "$m" "^[\"" quote-region

    # FZF Widgets
    bindkey -M "$m" '^I' fzf-completion
    # bindkey -M "$m" '^I' expand-or-complete
    # bindkey -M "$m" '^[;^[c' fzf-cd-widget
    # bindkey -M "$m" '^[;^[t' fzf-file-widget
    # bindkey -M "$m"  '^[;^[l' fzf-locate-widget
    # bindkey -M "$m"  '^[;^[r' fzf-history-widget
    # alt+shift+R T or C in addition to ctrl+ bindings
    bindkey -M "$m" '^[R' fzf-history-widget
    bindkey -M "$m" '^[T' fzf-file-widget
    bindkey -M "$m" '^[C' fzf-cd-widget
    bindkey -M "$m" '^[I' fzf-locate-widget

    bindkey -M "$m" '^[;^[;' accept-and-menu-complete
    bindkey -M "$m" '^[;ch' _complete_help
    bindkey -M "$m" '^[;fh' _correct_filename
    bindkey -M "$m" '^[;wh' _correct_word
    # bindkey -M "$m" '^[;hcn' _history-complete-newer
    # bindkey -M "$m" '^[;hco' _history-complete-older
    bindkey -M "$m" '^[;wl' complete-word
    bindkey -M "$m" '^[;oc' expand-or-complete
    bindkey -M "$m" '^[;op' expand-or-complete-prefix
    bindkey -M "$m" '^[;mc' menu-complete
    bindkey -M "$m" '^[;meoc' menu-expand-or-complete
    bindkey -M "$m" '^[;rmc' reverse-menu-complete
    bindkey -M "$m"  '^[;hk' describe-key-briefly
    bindkey -M "$m" '^[;hh' run-help
    bindkey -M "$m" '^[;hw' which-command
    bindkey -M "$m" -s '^[;^[h' '\eyyA  --help^M^[iPA'

done

# Menuselect mode bindings
bindkey -M menuselect "^H" list-expand
bindkey -M menuselect "^J" vi-down-line-or-history
bindkey -M menuselect "^K" vi-up-line-or-history
bindkey -M menuselect "^L" accept-line
bindkey -M menuselect "^O" accept-and-menu-complete

# ^[^J

# bindkey -M viins "^[O" vi-cmd-mode
# bindkey -M viins "^Ogl" end-of-line
# bindkey -M viins "^Ogh" beginning-of-line
bindkey -M viins "^Ol" vi-end-of-line
bindkey -M viins "^Oh" vi-beginning-of-line
bindkey -M viins "^Oj" vi-down-line-or-history
bindkey -M viins "^Ok" vi-up-line-or-history

# use function in 'zsh-vim-mode' plugin to define a couple extra keybindings
# vim-mode-bindkey vicmd -- fzf-locate-widget '^[i'
# bindkey -M "$m" '^\\^I' fzf-completion
# bindkey -M "$m" '^I' fzf-completion
# vim-mode-bindkey viins visual -- vi-cmd-mode '^[i'

# toggle between vi-cmd and vi-ins using ALT+I
bindkey -M vicmd '^[i' vi-insert
bindkey -M viins '^[i' vi-cmd-mode
bindkey -M visual '^[i' vi-cmd-mode

# control j to open line below in vi insert mode
bindkey -M viins '^J' vi-open-line-below

# quickly open previous line for editing at tail end or beginning
# bindkey -M viins -s '^O^@' '\ek$A \egel'
bindkey -M viins -s '^O^@' '\ekA^@'
bindkey -M viins -s '^O^O' '\ek'
# bindkey -M viins -s '^OH' '\ek^cW'

# bindkey -M viins -s '^\\kh' '^[ik^'
# bindkey -M viins -s '^\\kj' '^[ik^W'
# bindkey -M viins -s '^\\kk' '^[ik$B'
# bindkey -M viins -s '^\\kl' '^[ik$'
# bindkey -M viins -s '^\\kv' '^[ik$vB'

# vim-mode-bindkey       vicmd -- accept-line-and-down-history '^o'
for m in vicmd visual viopp; do
    bindkey -M "$m" 'gl' end-of-line
    bindkey -M "$m" 'gh' beginning-of-line
done

# Set KEYTIMEOUT (default 40=400 milliseconds)
KEYTIMEOUT=50

# remap some commands to leader-sequence
# for m in visual viins; do
# done

# type help with current command and repaste on next line
# bindkey -M viins -s '^\\^h^h' '\eyyA  --help^M^[iPA'
# bindkey -M vicmd -s '^\\hh' 'yyA  --help^M^[iPA'


# bindkey -M viins "^P" up-line-or-history
# bindkey -M viins "^N" down-line-or-history

# bindkey -M viins "<M-l>" history-beginning-search-backward
# bindkey -M viins "<M-L>" history-beginning-search-forward


    # bindkey -M "$m" '^\\id' fzf-insert-directory
    # bindkey -M "$m" '^\\if' fzf-insert-files
    # bindkey -M "$m" '^\\ih' fzf-insert-history
    # bindkey -M "$m" '^\\ind' fzf-insert-named-directory
    # bindkey -M "$m" '^\\,cd' fzf-change-directory
    # bindkey -M "$m" '^\\cnd' fzf-change-named-directory
    # bindkey -M "$m" '^\\crd' fzf-change-recent-directory
    # bindkey -M "$m" '^\\dkc' fzf-docker-kill-containers
    # bindkey -M "$m" '^\\dlc' fzf-docker-logs-container
    # bindkey -M "$m" '^\\drc' fzf-docker-remove-containers
    # bindkey -M "$m" '^\\dri' fzf-docker-remove-images
    # bindkey -M "$m" '^\\drv' fzf-docker-remove-volumes
    # bindkey -M "$m" '^\\dsc' fzf-docker-start-containers
    # bindkey -M "$m" '^\\dsc' fzf-docker-stop-containers
    # bindkey -M "$m" '^\\edf' fzf-edit-dotfiles
    # bindkey -M "$m" '^\\ef' fzf-edit-files
    # bindkey -M "$m" '^\\essh' fzf-exec-ssh
    # bindkey -M "$m" '^\\gaf' fzf-git-add-files
    # bindkey -M "$m" '^\\gcr' fzf-git-change-repository
    # bindkey -M "$m" '^\\gcb' fzf-git-checkout-branch
    # bindkey -M "$m" '^\\gco' fzf-git-checkout-branch
    # bindkey -M "$m" '^\\gdb' fzf-git-delete-branches
    # bindkey -M "$m" '^\\gclo' fzf-github-close-issue
    # bindkey -M "$m" '^\\gcomi' fzf-github-comment-issue
    # bindkey -M "$m" '^\\gei' fzf-github-edit-issue
    # bindkey -M "$m" '^\\goi' fzf-github-open-issue
    # bindkey -M "$m" '^\\gsi' fzf-github-show-issue
    # bindkey -M "$m" '^\\kp' fzf-kill-processes
    # bindkey -M "$m" '^\\sd' fzf-select-docker-widget
    # bindkey -M "$m" '^\\sg' fzf-select-git-widget
    # bindkey -M "$m" '^\\sh' fzf-select-github-widget
    # bindkey -M "$m" '^\\^s' fzf-select-widget



# Bind Common FZF Widget Keybindings
export FZF_COMPLETION_TRIGGER=''
for m in viins vicmd
do
    bindkey -M "$m" '^R' fzf-history-widget
    bindkey -M "$m" '^T' fzf-file-widget
    bindkey -M "$m" '^[c' fzf-cd-widget
    bindkey -M "$m" '^[i' fzf-locate-widget
    bindkey -M "$m" '^I' expand-or-complete
    bindkey -M "$m" '^@^@' fzf-completion
    # bindkey -M "$m" '^I' fzf-completion
done
bindkey -M menuselect '^j' 'vi-down-line-or-history'
bindkey -M menuselect '^k' 'vi-up-line-or-history'

# use function in 'zsh-vim-mode' plugin to define a couple extra keybindings
vim-mode-bindkey viins visual -- vi-cmd-mode '^j'
vim-mode-bindkey viins visual -- vi-cmd-mode '^[i'

# vim-mode-bindkey       vicmd -- accept-line-and-down-history '^o'
vim-mode-bindkey vicmd visual -- end-of-line 'gl'
vim-mode-bindkey vicmd visual -- beginning-of-line 'gh'

# vim-mode-bindkey viins vicmd -- fzf-completion '^i'
vim-mode-bindkey viins vicmd -- fzf-cd-widget '^@,c'
vim-mode-bindkey viins vicmd -- fzf-file-widget '^@,t'
vim-mode-bindkey viins vicmd -- fzf-locate-widget '^@,i'
vim-mode-bindkey viins vicmd -- fzf-history-widget '^@,r'

# remap some commands to leader-sequence
vim-mode-bindkey viins vicmd -- fzf-insert-directory '^@id'
vim-mode-bindkey viins vicmd -- fzf-insert-files '^@if'
vim-mode-bindkey viins vicmd -- fzf-insert-history '^@ih'
vim-mode-bindkey viins vicmd -- fzf-insert-named-directory '^@ind'
vim-mode-bindkey viins vicmd -- fzf-change-directory '^@cd'
vim-mode-bindkey viins vicmd -- fzf-change-named-directory '^@cnd'
vim-mode-bindkey viins vicmd -- fzf-change-recent-directory '^@crd'
vim-mode-bindkey viins vicmd -- fzf-docker-kill-containers '^@dkc'
vim-mode-bindkey viins vicmd -- fzf-docker-logs-container '^@dlc'
vim-mode-bindkey viins vicmd -- fzf-docker-remove-containers '^@drc'
vim-mode-bindkey viins vicmd -- fzf-docker-remove-images '^@dri'
vim-mode-bindkey viins vicmd -- fzf-docker-remove-volumes '^@drv'
vim-mode-bindkey viins vicmd -- fzf-docker-start-containers '^@dsc'
vim-mode-bindkey viins vicmd -- fzf-docker-stop-containers '^@dsc'
vim-mode-bindkey viins vicmd -- fzf-edit-dotfiles '^@edf'
vim-mode-bindkey viins vicmd -- fzf-edit-files '^@ef'
vim-mode-bindkey viins vicmd -- fzf-exec-ssh '^@essh'
vim-mode-bindkey viins vicmd -- fzf-git-add-files '^@gaf'
vim-mode-bindkey viins vicmd -- fzf-git-change-repository '^@gcr'
vim-mode-bindkey viins vicmd -- fzf-git-checkout-branch '^@gcb'
vim-mode-bindkey viins vicmd -- fzf-git-delete-branches '^@gdb'
vim-mode-bindkey viins vicmd -- fzf-github-close-issue '^@gclo'
vim-mode-bindkey viins vicmd -- fzf-github-comment-issue '^@gcomi'
vim-mode-bindkey viins vicmd -- fzf-github-edit-issue '^@gei'
vim-mode-bindkey viins vicmd -- fzf-github-open-issue '^@goi'
vim-mode-bindkey viins vicmd -- fzf-github-show-issue '^@gsi'
vim-mode-bindkey viins vicmd -- fzf-kill-processes '^@kp'
vim-mode-bindkey viins vicmd -- fzf-select-docker-widget '^@sd'
vim-mode-bindkey viins vicmd -- fzf-select-git-widget '^@sg'
vim-mode-bindkey viins vicmd -- fzf-select-github-widget '^@sh'
vim-mode-bindkey viins vicmd -- fzf-select-widget '^@^s'

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


# bindkey -M viins "^o" accept-line-and-down-history
# bindkey -M viins "^j" vi-cmd-mode
# bindkey -M visual "^j" vi-cmd-mode

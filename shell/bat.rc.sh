
# Colored Output

# bat
# bat --theme "Monokai Extended Bright" --pager "/bin/less -R" --color always --language .bash_aliases aliases.sh
export BAT_PAGER="$LESS"
export BAT_STYLE='auto'
export BAT_THEME='Monokai Extended Bright'

#bat-select-theme()
#{
	#themes=("$(bat --list-themes)")
	#BAT_THEME=$(echo $themes[@] | fzf )
#}
# alias cat=ccat
# ccat

# todo
# "highlight -O ansi -l %s"
# '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file ||  (highlight -O ansi -l {} ||  coderay {} || rougify {} || cat {}) 2> /dev/null | head
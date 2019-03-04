# location of snippets, folder created in step 2 or custom location
snippets_dir=~/.multisnippet

# edit single line snippet
cfg-snippetrc() { $EDITOR ~/.snippetrc ;}

# edit multiline snippet
cfg-multisnippetrc() { $EDITOR $snippets_dir/"$(ls $snippets_dir | fzf -e -i)" ;}

#create new multiline snippet
multisnippet() { $EDITOR $snippets_dir/"$1" ;}

fzf-snippet() {
	selected="$(cat ~/.snippetrc | sed '/^$/d' | sort -n | fzf -e -i )"
	# remove tags, leading and trailing spaces, also no newline
	echo "$selected" | sed -e s/\;\;\.\*\$// | sed 's/^[ \t]*//;s/[ \t]*$//' | tr -d '\n' | xclip -selection clipboard
}

fzf-multisnippet() {
	# merge filename and tags into single line
	results=$(for FILE in $snippets_dir/*
	do
		getname=$(basename $FILE)
		gettags=$(head -n 1 $FILE)

		echo "$getname \t $gettags"

	done)

	# copy content into clipboard without tags
	filename=$(echo "$(echo $results | fzf -e -i )" | cut -d' ' -f 1)
	sed 1d $snippets_dir/$filename | xclip -selection clipboard
}

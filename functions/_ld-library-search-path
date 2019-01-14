
function library-search-path() {
	ld --verbose | grep SEARCH_DIR | sed -E 's/("\); |"\);|)(SEARCH_DIR\("=?|$)/\n/g' | head -n -1 | tail -n +2
	}


function playdir -a directory_name shuffle depth -d "Play a directory of audio files"
	if test -z "$directory_name";
		echo 'Usage: playdir <directory> <shuffle? (yes/no)> depth'
		return
	end

	if not test -d "$directory_name";
		echo "$directory_name not a directory"
		return
	end

	# NOTE: there should be a better way to do this
	# FIXME: fd breaks on SICK folder with japanese text
	# set cmd "fd -e 'mp3' -e 'flac' -e 'wav' --full-path '$directory_name'"
	set cmd "find '$directory_name'"

	if test -n "$depth";
		set cmd "$cmd -depth -maxdepth $depth"
	end

	set cmd "$cmd -name '*.mp3' -o -name '*.flac' -o -name '*.wav'"

	if test -n "$shuffle" -a "$shuffle" != "no";
		set cmd "$cmd | shuf"
	else
		set cmd "$cmd | sort"
	end

	echo "tracklist:"
	for f in (eval $cmd);
		echo -e "\t$(basename $f)"
	end

	echo ""

	for f in (eval $cmd);
		playfile "$f"
		echo ""
	end
end

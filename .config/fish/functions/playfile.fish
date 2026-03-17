function playfile -a file_name volume -d "Play an audio file"
	if test -z "'$file_name'";
		echo 'Usage: playfile <file> <volume>'
		return
	end

	if test -d "'$file_name'";
		echo "$file_name not a file"
		return
	end
	# NOTE: `"$volume" -ne "$volume"` tests whether $volume is numeric
	if test -z "$volume"; set volume 15; end
	if test "$volume" -ne "$volume";
		echo "$volume not a number"
		return
	end

	echo "Now playing at volume level $volume: $(basename $file_name)"
	ffplay -v 0 -nodisp -autoexit -volume "$volume" "$file_name"
	wait
end

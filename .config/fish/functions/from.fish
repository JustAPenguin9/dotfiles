function from -a file -d "Copy a file from ~/Templates, related to 'use'"
	if test -z "$file";
		echo -e "Usage: from <file>"
		return
	end

	cp ~/Templates/"$file" .
end

complete -c use -x -a '(ls ~/Templates)'
complete -c use -s c -l copy

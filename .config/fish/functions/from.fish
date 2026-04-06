function from -a file -d "Copy a file from ~/Templates, related to 'use'"
	if test -z "$file";
		echo -e "Usage: from <file>"
		return
	end

	cp ~/Templates/"$file" .
end

complete -c from -x -a '(command ls -A ~/Templates)'

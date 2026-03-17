function use -a file -d "Symlink a file from ~/Templates, related to 'from'"
	if test -z "$file";
		echo -e "Usage: use <file>"
		return
	end

	ln -s ~/Templates/"$file" .
end

complete -c use -x -a '(ls ~/Templates)'
complete -c use -s c -l copy

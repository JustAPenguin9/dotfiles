function saveurl -a file_name -a url -d "Save a url to a file"
	if [ (count $argv) -ne 2 ]
		echo 'Usage: <file name> <url>'
		return
	end

	if test -e "$file_name.url"; or test -d "$file_name.url";
		echo "Can not name the link $file_name.url as a file or directory already exists"
		return
	end

	echo "[InternetShortcut]" >> "$file_name.url"
	echo "URL=$url" >> "$file_name.url"
end

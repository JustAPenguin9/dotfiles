function su -d "Make su use fish instead of bash"
	command su --shell=/usr/bin/fish $argv
end

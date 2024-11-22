# NOTE: this was one of the first fish scripts i wrote, it might not work all the time
function edit
	if [ (count $argv) -lt 1 ]
		echo 'file or folder needed'
		return
	end

	# file in current dir
	if [ (dirname $argv[1]) = '.' ]
		nvim $argv[1]
		return
	end
	
	# directory
	if test -d $argv[1]
		pushd $argv[1]
		nvim .
		popd
	# file in different dir
	else
		pushd (dirname $argv[1])
		nvim $argv[1]
		popd
	end
end

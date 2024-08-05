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
		cd $argv[1]
		nvim .
	# file in different dir
	else
		cd (dirname $argv[1])
		nvim $argv[1]
	end
	prevd
end

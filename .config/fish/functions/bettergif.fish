function bettergif -a input -a runtime -d "Save a looping webp"
	if [ (count $argv) -lt 2 ]
		echo 'Usage: <input> <runtime in seconds>'
		return
	end

	# TODO: move the real basename commnd into it's own function
	ffmpeg -t "$runtime" -i "$input" -vf "fps=24" -loop 0 "$(basename $input | sed 's/\.[^.]*$//')-loop.webp"
end

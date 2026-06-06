function snapshot-rm -a path -d "Remove a file/folder from all ~/.snapshots relative to the HOME directory"

	read -l -P "Are you sure you want to delete ~/$path in all snapshots? [y/N]: " confirm

	switch (string lower "$confirm")
		case y yes
			echo "Proceeding"
		case '*'
			return 0
	end


	for snap in ~/.snapshots/*;
		set -l full_path "$snap/snapshot/$path"
		if not test -e "$full_path";
			echo "Not in $snap"
			continue # path not in snapshot
		end

		if not sudo btrfs property set "$snap/snapshot" ro false
			echo "Failed to set $snap/snapshot to read-write"
			return 1
		end

		#NOTE: dangerous
		if rm -rf "$full_path";
			echo "Removed $full_path"
		else
			echo "Failed to delete $full_path"
		end

		if not sudo btrfs property set "$snap/snapshot" ro true
			echo "Failed to set $snap/snapshot back to read-only"
			return 1
		end
	end
	echo "Done"
end

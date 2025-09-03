# based off of https://github.com/danhper/fish-ssh-agent
function start_ssh_agent -d "Start a new ssh agent if none exists"
	if test -z "$SSH_ENV"
		set -xg SSH_ENV $HOME/.ssh/environment
	end

	if test -z "$SSH_AGENT_PID"
		ssh-agent -c | head -n 2 > "$SSH_ENV"
		source "$SSH_ENV"
	end

	ssh-add
end

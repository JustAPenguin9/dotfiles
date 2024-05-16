# remove default greeting
set -g fish_greeting

### SET ENVIORNMENT
set TERM "xterm-256color"
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

# configs
set -gx XDG_CONFIG_HOME $HOME/.config

### ENVIORNMENT VARIABLES
set -gx EDITOR /usr/bin/nvim

# npm variables
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin $HOME/.emacs.d/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

### COLOURS
set -g fish_color_command 61afef
set -g fish_color_error e06c75
set -g fish_color_quote 98c379
set -g fish_color_autosuggestion abb2bf # too bright darker grey needed
set -g fish_color_redirection c678dd
set -g fish_color_end e06c75
set -g fish_color_operator e5c07b # yellow can be aqua 56b6c2 instead

### FUNCTIONS
# make su also use fish instead of bash
function su
	command su --shell=/usr/bin/fish $argv
end

### AKIASES
alias ls "lsd -A --group-dirs first"
# alias rm "rm -i"
# alias cp "cp -i"
# alias mv "mv -i"

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
abbr n edit

alias fishconf      "edit ~/.config/fish/config.fish"
alias kittyconf     "edit ~/.config/kitty/kitty.conf"
alias nvimconf      "edit ~/.config/nvim/"
alias vimconf       "edit ~/.vimrc"
alias alacrittyconf "edit ~/.config/alacritty/alacritty.yml"
alias qtileconf     "edit ~/.config/qtile/config.py"

abbr pause "playerctl pause"
abbr play  "playerctl play"

alias tl "task list"
alias ta "task add"
alias te "task edit"
alias td "task done"

abbr ytdl "yt-dlp --all-subs --embed-subs --write-description --write-info-json"

# dirs
alias gocode "cd /home/stephen/Projects/code"

### ABBREVIATIONS
abbr e exit
abbr cls clear
abbr find fd
abbr ht htop
abbr bt btop
abbr emacsc emacsclient -c -a 'emacs'

abbr update "sudo pacman -Syu"
abbr img "jp2a --color-depth=8"
abbr pipes "pipes-rs -r .5 -t .1"

abbr sshpi "ssh pi@192.168.2.11"

abbr ipconfig "curl ifconfig.me"

### starship
starship init fish | source

#abbr testdb  "mysql testing -u Fubuki -p"
#abbr akyuudb "mysql akyuu_records -u Fubuki -h 192.168.2.11 -p"

### AUTORUN
#task list

# Created by `pipx` on 2024-01-29 02:38:48
set PATH $PATH /home/stephen/.local/bin

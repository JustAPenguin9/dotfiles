# remove default greeting
set -g fish_greeting

### SET ENVIRONMENT
set TERM "xterm-256color"
set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
set -gx EDITOR /usr/bin/nvim
set PATH $PATH $HOME/.emacs.d/bin

# XDG
set -gx XDG_CONFIG_HOME $HOME/.config

# npm variables
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH

### COLOURS
set -g fish_color_command 61afef
set -g fish_color_error e06c75
set -g fish_color_quote 98c379
set -g fish_color_autosuggestion abb2bf # too bright darker grey needed
set -g fish_color_redirection c678dd
set -g fish_color_end e06c75
set -g fish_color_operator e5c07b # yellow can be aqua 56b6c2 instead

### ALIASES
alias ls "lsd -A --group-dirs first"
# alias rm "rm -i"
# alias cp "cp -i"
# alias mv "mv -i"

# config files
alias fishconf      "edit ~/.config/fish/config.fish"
alias kittyconf     "edit ~/.config/kitty/kitty.conf"
alias nvimconf      "edit ~/.config/nvim/"
alias vimconf       "edit ~/.vimrc"
alias alacrittyconf "edit ~/.config/alacritty/alacritty.yml"
alias qtileconf     "edit ~/.config/qtile/config.py"


### ABBREVIATIONS
abbr update "sudo pacman -Syu"
abbr n edit
abbr e exit
abbr :q exit # habit
abbr cls clear # also habit

# util
abbr ytarchive "yt-dlp --all-subs --embed-subs --write-description --write-info-json"
abbr pubip "curl ifconfig.me"

# apps
abbr find fd
abbr ht htop
abbr bt btop
abbr emacsc emacsclient -c -a 'emacs'

# ssh
abbr sshpi "ssh pi@192.168.2.11"

# dirs
abbr gocode "cd /home/$USER/Projects/code"

# git
abbr gs git status
abbr gc git commit
# abbr gm git commit -m # conflicts with GraphicsMagick
abbr gl git log --oneline
abbr ga git add
abbr gu git add -u
abbr gb git switch
abbr gr git restore
abbr gd git diff

# playerctl
abbr pause "playerctl pause"
abbr play "playerctl play"

# task warrior
abbr tl "task list"
abbr ta "task add"
abbr te "task edit"
abbr td "task done"

### STARTUP
starship init fish | source
#task list


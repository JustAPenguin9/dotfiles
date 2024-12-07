# remove default greeting
set -g fish_greeting
alias sourcefish "source ~/.config/fish/config.fish"

### SET ENVIRONMENT
set TERM "xterm-256color"
# set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
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
# alias rm "rm -i"
# alias cp "cp -i"
# alias mv "mv -i"

# old app new app
alias ls "lsd -A --group-dirs first"
alias find fd
alias grep rg

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
abbr ht htop
abbr bt btop
abbr emacsc emacsclient -c -a 'emacs'

# ssh
# abbr sshpi "ssh pi@192.168.2.11"

# git
abbr gs git status
abbr gp git pull
abbr gpr git pull --rebase
abbr gf git fetch

abbr gl git log
abbr glo git log --oneline
abbr gls git shortlog

abbr gri git rebase -i --autosquash
abbr grc git rebase --continue

abbr gb git branch
abbr gbl git branch -la
abbr gbs git switch
abbr gbd git branch -d

abbr gc git commit
abbr gcf git commit -f
abbr gcm git commit -m
abbr gca git commit --amend --no-edit

abbr ga git add
abbr gau git add -u
abbr gaa git add -A

abbr gr git restore
abbr grs git restore --staged
abbr gd git diff
abbr gds git diff --staged
abbr gdw git diff --word-diff
abbr gdws git diff --word-diff --staged

# playerctl
abbr pause "playerctl pause"
abbr play "playerctl play"

# task warrior
abbr tl "task list"
abbr ta "task add"
abbr te "task edit"
abbr td "task done"

### STARTUP requires starship and zoxide
starship init fish | source
zoxide init fish | source
#task list


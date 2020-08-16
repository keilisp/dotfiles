#ALIASES
#vim
alias v="nvim"
alias vv="nvim -u 'NONE'"
alias vim="nvim"
alias sv="sudoedit"

# pacman/yay
alias del='yay -R'
alias upd="yay -Syu"
alias i="yay -S"
alias srch="yay -Q | grep"
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'

# grub
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias grub-customizer="gksu grub-customizer"

# ls/exa
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

# mongodb
alias mongod='mongod --port 27017 --auth --dbpath $HOME/progs/db/mongodb'

# systemctl
alias SS="sudo systemctl"

# doom-emacs
alias doom='~/.emacs.d/bin/doom'

# system stuff
alias cp="cp -i" # confirm before overwriting something
alias gpgrecv="gpg --keyserver pool.sks-keyservers.net --recb-keys"
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias ka='killall'
alias g='git'
alias more=less
alias cfa='nvim $HOME/.config/awesome/rc.lua'
alias cfv='nvim $HOME/.vimrc'
alias cfb='nvim $HOME/.bashrc'
alias cff='nvim $HOME/.config/fish/conf.d/omf.fish'
alias cfz='nvim $HOME/.zshrc'
alias lc='betterlockscreen -l'
alias se='fzf | xargs -r -I % $EDITOR %'
alias pf='systemctl poweroff'
alias rb='systemctl reboot'
# utils
alias neofetch='neofetch --ascii $HOME/pix/ascii/arch-test.txt'
alias ytv='youtube-dl -o "~/vids/%(title)s.%(ext)s"'                       #Download video link
alias yta='youtube-dl -o "~/musx/%(title)s.%(ext)s" -x --audio-format mp3' #Download only audio
alias passmenu="passmenu -nb '#3b4252' -sf '#88c0d0' -sb '#4c566a' -nf '#a89984' -fn 'Mononoki Nerd Font:bold:pixelsize=13'"
# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias redditWall='node $HOME/scripts/nodeRedditDownloader/wallpaperDownloader -d -t day -p new -l 100 -mw 1920 -mh 1080 -s'

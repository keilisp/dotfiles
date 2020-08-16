#                    _ _
# _ __ ___   ___  __| (_) ___   ___ _ __ ___
#| '_ ` _ \ / _ \/ _` | |/ _ \ / __| '__/ _ \
#| | | | | |  __/ (_| | | (_) | (__| | |  __/
#|_| |_| |_|\___|\__,_|_|\___/ \___|_|  \___|
#
#

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


# Path to your oh-my-zsh installation.
export ZSH="/home/mediocre/.oh-my-zsh"
### EXPORTS ###

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# Env vars
export EDITOR='nvim'
export VISUAL='nvim'
export FZF_DEFAULT_OPTS='--layout=reverse --height 40%'

# OWN SCRIPTS
# add all subdirs to PATH
# export PATH="$PATH:$(du "$HOME/scripts/" | cut -f2 | tr '/n' ':' | sed 's/:*$//')"
export PATH=$PATH:$(du $HOME/scripts/ | grep -v 'node_modules\|.git\|.log' | cut -f2 | tr '\n' ':' | sed 's/:*$//')


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="oxide"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  colorize
  cp
  # zsh-abbr
  abbrev-alias
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Fix backspace bug
bindkey "^?" backward-delete-char

#Change cursor shape for vi modes
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
	[[ $1 = 'block' ]]; then
	  echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] ||
	  [[ ${KEYMAP} == viins ]] ||
	  [[ ${KEYMAP} == '' ]] ||
	  [[ $1 == 'beam' ]]; then
		  echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
zle -K viins #initiane `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
echo -ne "\e[5 q"
}

zle -N zle-line-init

echo -ne '\e[5 q' #Use beam share cursor on startup

preexec() { echo -ne '\e[5 q' ;} #Use beam shape cursor for aech new prompt

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# if [ -f ~/.bash_aliases ]; then
#   . ~/.bash_aliases
# fi

# ALIASES
# ls/exa
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
# grep
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
#utils
alias neofetch='neofetch --w3m $HOME/pix/wallpapers/Art/Other/planets.jpg'
# alias neofetch='neofetch --ascii $HOME/pix/ascii/arch-test.txt'
alias passmenu="passmenu -nb '#3b4252' -sf '#88c0d0' -sb '#4c566a' -nf '#a89984' -fn 'Mononoki Nerd Font:bold:pixelsize=13'"
alias ytv='youtube-dl -o "~/vids/%(title)s.%(ext)s"' #Download video link
alias yta='youtube-dl -o "~/musx/%(title)s.%(ext)s" -x --audio-format mp3' #Download only audio
#system stuff
alias se='fzf | xargs -r -I % $EDITOR %'
# yay/pacman
alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'


# INIT ABBR
abbrev-alias -i

#ABBRS
#vim
abbrev-alias -ge v="nvim"
abbrev-alias -ge vv="nvim -u 'NONE'"
abbrev-alias -ge vim="nvim"
abbrev-alias -ge sv="sudoedit"
# pacman/yay
abbrev-alias -ge del='yay -R'
abbrev-alias -ge upd="yay -Syu"
abbrev-alias -ge i="yay -S"
abbrev-alias -ge srch="yay -Q | grep"
# grub
abbrev-alias -ge update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
abbrev-alias -ge grub-customizer="gksu grub-customizer"
# mongodb
abbrev-alias -ge mongod='mongod --port 27017 --auth --dbpath $HOME/progs/db/mongodb'
# systemctl
abbrev-alias -ge SS="sudo systemctl"
# doom-gemacs
abbrev-alias -ge doom='~/.emacs.d/bin/doom'
# system stuff
abbrev-alias -ge cp="cp -i"                          # confirm before overwriting something
abbrev-alias -ge gpgrecv="gpg --keyserver pool.sks-keyservers.net --recb-keys"
abbrev-alias -ge df='df -h'                          # human-readable sizes
abbrev-alias -ge free='free -m'                      # show sizes in MB
abbrev-alias -ge ka='killall'
abbrev-alias -ge g='git'
abbrev-alias -ge lc='betterlockscreen -l'
abbrev-alias -ge more=less
abbrev-alias -ge cfa='nvim $HOME/.config/awesome/rc.lua'
abbrev-alias -ge cfv='nvim $HOME/.vimrc'
abbrev-alias -ge cfb='nvim $HOME/.bashrc'
abbrev-alias -ge cff='nvim $HOME/.config/fish/conf.d/omf.fish'
abbrev-alias -ge cfz='nvim $HOME/.zshrc'
abbrev-alias -ge pf='systemctl poweroff'
abbrev-alias -ge rb='systemctl reboot'
# utils

# the terminal rickroll
abbrev-alias -ge rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
abbrev-alias -ge redditWall='node $HOME/scripts/nodeRedditDownloader/wallpaperDownloader -d -t day -p new -l 100 -mw 1920 -mh 1080 -s'

# Autocomplete autosuggestion
bindkey '^ ' autosuggest-accept

### BASH INSULTER ###
if [ -f /etc/bash.command-not-found ]; then
  . /etc/bash.command-not-found
fi

### RANDOM COLOR SCRIPT ###
/opt/shell-color-scripts/colorscript.sh random

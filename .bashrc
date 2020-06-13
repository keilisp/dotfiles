#                    _ _
# _ __ ___   ___  __| (_) ___   ___ _ __ ___
#| '_ ` _ \ / _ \/ _` | |/ _ \ / __| '__/ _ \
#| | | | | |  __/ (_| | | (_) | (__| | |  __/
#|_| |_| |_|\___|\__,_|_|\___/ \___|_|  \___|
#
#

[[ $- != *i* ]] && return

colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
	  # background colors
	  for bgc in {40..47}; do
		fgc=${fgc#37} # white
		bgc=${bgc#40} # black

		vals="${fgc:+$fgc;}${bgc}"
		vals=${vals%%;}

		seq0="${vals:+\e[${vals}m}"
		printf "  %-9s" "${seq0:-(default)}"
		printf " ${seq0}TEXT\e[m"
		printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
	  done
	  echo; echo
	done
  }

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
	PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
	;;
  screen*)
	PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
	;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
  && type -P dircolors >/dev/null \
  && match_lhs=$(dircolors --print-database)
  [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

  if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then if [[ -f ~/.dir_colors ]] ; then eval $(dircolors -b ~/.dir_colors)
	elif [[ -f /etc/DIR_COLORS ]] ; then
	  eval $(dircolors -b /etc/DIR_COLORS)
	fi
	fi

	if [[ ${EUID} == 0 ]] ; then
	  PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
	  # PS1="\[\033[s\033[0;0H\033[0;41m\033[K\033[1;33m\t\033[0m\033[u\]<\u@\h \W>\$ "
	  # PS1=" \A \W\[\033[01;32m\] \$:\[\033[00m\] "
	  PS1=" \A \[\033[0;34m\]\W\[\033[01;32m\] \$\[\033[0m\]: "

	fi

	# Aliases
	if [ -f ~/.bash_aliases ]; then
	  . ~/.bash_aliases
	fi

	# ALIASES
	# # vim
	# alias v="nvim"
	# alias vim="nvim"
	# alias sv="sudo vim"

	# # pacman/yay
	# alias del='yay -R'
	# alias upd="yay -Syu"
	# alias i="yay -S"
	# alias srch="yay -Q | grep"
	# alias autoremove='sudo pacman -Rcns $(pacman -Qdtq)'

	# # grub
	# alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
	# alias grub-customizer="gksu grub-customizer"

	# # ls/exa
	# alias ls='exa -al --color=always --group-directories-first' # my preferred listing
	# alias la='exa -a --color=always --group-directories-first'  # all files and dirs
	# alias ll='exa -l --color=always --group-directories-first'  # long format
	# alias lt='exa -aT --color=always --group-directories-first' # tree listing

	# # grep
	# alias grep='grep --colour=auto'
	# alias egrep='egrep --colour=auto'
	# alias fgrep='fgrep --colour=auto'

	# # mongodb
	# alias mongod='mongod --port 27017 --auth --dbpath $HOME/db/mongodb/'

	# # systemctl
	# alias SS="sudo systemctl"

	# # doom-emacs
	# alias doom='~/.emacs.d/bin/doom sync'

	# # system stuff
	# alias cp="cp -i"                          # confirm before overwriting something
	# alias df='df -h'                          # human-readable sizes
	# alias free='free -m'                      # show sizes in MB
	# alias ka='killall'
	# alias g='git'
	# alias more=less
	# alias cfa='nvim $HOME/.config/awesome/rc.lua'
	# alias cfv='nvim $HOME/.vimrc'
	# alias cfb='nvim $HOME/.bashrc'
	# alias cff='nvim $HOME/.config/fish/conf.d/omf.fish'
	# alias se='fzf | xargs -r -I % $EDITOR %'
	# alias pf='systemctl poweroff'
	# alias rb='systemctl reboot'
	# # utils
	# alias neofetch='neofetch --ascii $HOME/pix/ascii/arch-test.txt'
	# alias ytv='youtube-dl -o "~/vids/%(title)s.%(ext)s"' #Download video link
	# alias yta='youtube-dl -o "~/musx/%(title)s.%(ext)s" -x --audio-format mp3' #Download only audio
	# # the terminal rickroll
	# alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
	# alias redditWall='node $HOME/scripts/nodeRedditDownloader/wallpaperDownloader -d -t day -p new -l 100 -mw 1920 -mh 1080 -s'

	# books
	# alias rpf='zathura ~/dox/books/fizyka_formula_zno.pdf'
	# alias rlt='zathura ~/dox/books/Komandnaia_stroka_Linux.pdf'

  else
	if [[ ${EUID} == 0 ]] ; then
	  # show root@ when we don't have colors
	  PS1='\u@\h \W \$ '
	else
	  PS1='\u@\h \w \$ '
	fi
  fi

  unset use_color safe_term match_lhs sh
  xhost +local:root > /dev/null 2>&1

  complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
	case $1 in
	  *.tar.bz2)   tar xjf $1   ;;
	  *.tar.gz)    tar xzf $1   ;;
	  *.bz2)       bunzip2 $1   ;;
	  *.rar)       unrar x $1     ;;
	  *.gz)        gunzip $1    ;;
	  *.tar)       tar xf $1    ;;
	  *.tbz2)      tar xjf $1   ;;
	  *.tgz)       tar xzf $1   ;;
	  *.zip)       unzip $1     ;;
	  *.Z)         uncompress $1;;
	  *.7z)        7z x $1      ;;
	  *)           echo "'$1' cannot be extracted via ex()" ;;
	esac
  else
	echo "'$1' is not a valid file"
  fi
}

# Disable ctrl-s and ctrl-q
stty -ixon
# Allows to cd into directory merely by typing the directory name
shopt -s autocd

# Vim mode
# set -o vi

### EXPORTS ###

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# default apps
export EDITOR='nvim'
export VISUAL='nvim'

# OWN SCRIPTS
# export PATH=$PATH$( find $HOME/scripts/ -type d -printf ":%p" )
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/scripts/watchvids
export PATH=$PATH:$HOME/scripts/nodeRedditDownloader
export PATH=$PATH:$HOME/scripts/audiosplit

##############

### BASH INSULTER ###
if [ -f /etc/bash.command-not-found ]; then
  . /etc/bash.command-not-found
fi

### RANDOM COLOR SCRIPT ###
/opt/shell-color-scripts/colorscript.sh random


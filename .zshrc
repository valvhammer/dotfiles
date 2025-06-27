# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hammogo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PS1="%B%F{1}[%F{3}%n%F{2}@%F{4}%m %F{5}%~%F{1}]%F{7} $ %b%f"
export PATH=$PATH:"/home/hammer/.local/share/Steam/steamapps/common/Blender":"/home/hammer/dev/thirdparty/osxcross/target/bin":"/home/hammer/opt/djgpp/bin"
export status_command=i3bar
export PYTHONDONTWRITEBYTECODE=1
export _JAVA_AWT_WM_NONREPARENTING=1

setopt +o nomatch

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ls="lsd"
alias cat="bat"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -F'


# more alias
alias move='mv'
alias copy='cp'
alias md='mkdir'
alias rd='rmdir'
alias python='python3'
alias setbg='feh --bg-fill' # change if you want to
alias feh='feh --scale'
alias todos='grep -rn TODO: ; grep -rn todo: '


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

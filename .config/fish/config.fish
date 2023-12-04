if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Alias

## config alias used to commit changes to config files
alias config='/usr/bin/git --git-dir=/home/nkb/.cfg/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME'

## cat -> batcat
alias cat="batcat"

## ls -> eza
alias ls="eza --icons --hyperlink -F"
alias tree="ls -T"
alias lsg="ls --git-ignore"

## ps -> procs
alias ps="procs"

## top -> bottom
alias top="bottom"
alias htop="bottom"
alias ytop="bottom"

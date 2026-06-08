# ~/.config/fish/config.fish
# Portable fish configuration managed by Ansible

#-----------------
# Custom greeting
#-----------------
function fish_greeting
    echo ''
    echo '   O      /`·.¸'
    echo '  o      /¸...¸`:·'
    echo '   o ¸.·´  ¸   `·.¸.·´)'
    echo '    : © ):´;      ¸  {'
    echo '     `·.¸ `·  ¸.·´\\`·¸)'
    echo '         `\\\\´´\\¸.·´'
    echo ''
end

#-----------------------
# Environment variables
#-----------------------
# Text editor
set -gx EDITOR nano
set -gx VISUAL nano

#------------------
# PATH adjustments
#------------------
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

if test -d ~/.npm-global/bin
    if not contains -- ~/.npm-global/bin #PATH
        set -p PATH ~/.npm-global/bin
    end
end

#---------
# Aliases
#---------
# Directory listings
alias ls='eza -al --color=always --group-directories-first --icons'
alias la='eza -a --color=always --group-directories-first --icons'
alias ll='eza -l --color=always --group-directories-first --icons'
alias lt='eza -aT --color=always --group-directories-first --icons'

# Common utility aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias wget='wget -c'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias tarnow='tar -acf'
alias untar='tar -zxvf'

#---------------------------------------
# Bang-bang (!!) and last-argument (!$)
#---------------------------------------
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

if [ "$fish_key_bindings" = "fish_vi_key_bindings" ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

#-------------------------
# OS-Specific Adjustments
#-------------------------
if test -f /etc/arch-release
    # Arch Linux family specific fish configuration
    # Format man pages with bat
    set -gx MANROFFOPT "-c"
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
else if test -f /etc/debian_version
    # Debian family specific fish configuration
    # The bat package installs as batcat on Debian/Ubuntu
    alias bat=batcat

    # The fd-find package installs as fdfind on Debian/Ubuntu
    alias fd=fdfind

    # Format man pages with batcat
    set -gx MANROFFOPT "-c"
    set -gx MANPAGER "sh -c 'col -bx | batcat -l man -p'"
end

#-----------------
# Please Function
#-----------------
# Run command with sudo, or run previous command with sudo if no arguments are given (like sudo !!)
function please
    if test (count $argv) -eq 0
        eval sudo $history[1]
    else
        sudo $argv
    end
end
alias pls=please
alias plz=please
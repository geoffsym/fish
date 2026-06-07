# ~/.config/fish/conf.d/debian.fish
# Debian family specific fish configuration

# Only load on Debian-based systems
if not test -f /etc/debian_version
    return
end

# The bat package installs as batcat on Debian/Ubuntu
alias bat=batcat

# The fd-find package installs as fdfind on Debian/Ubuntu
alias fd=fdfind

# Format man pages with batcat
set -gx MANROFFOPT "-c"
set -gx MANPAGER "sh -c 'col -bx | batcat -l man -p'"

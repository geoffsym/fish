# ~/.config/fish/conf.d/arch.fish
# Arch Linux family specific fish configuration

# Only load on Arch-based systems
if not test -f /etc/arch-release
    return
end

# Format man pages with bat
set -gx MANROFFOPT "-c"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

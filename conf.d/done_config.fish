# Local configuration to bring back CachyOS system-wide 'done' plugin
# This file is loaded automatically by fish on this machine only

if test -f /usr/share/cachyos-fish-config/conf.d/done.fish
    source /usr/share/cachyos-fish-config/conf.d/done.fish
    set -g __done_min_cmd_duration 10000
    set -g __done_notification_urgency_level low
end

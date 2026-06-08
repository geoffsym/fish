# Geoff's Fish Configuration

This is my personal fish shell configuration, set up for portability across machines.

## Plugins

I use [fisher](https://github.com/jorgebucaran/fisher) to manage these plugins:

- [sponge](https://github.com/meaningful-ooo/sponge)
- [pure](https://github.com/pure-fish/pure)
- [autopair.fish](https://github.com/jorgebucaran/autopair.fish)

## Installation

To set up this configuration on a new machine:

1. Clone this repository to `~/.config/fish`.
2. Bootstrap Fisher by sourcing the bundled function:
   ```fish
   source ~/.config/fish/functions/fisher.fish && fisher update
   ```
   *(On startup, the configuration automatically registers `jorgebucaran/fisher` in your shell's `_fisher_plugins` universal variable, preventing any conflicts during updates).*

## Key Features

- Custom greeting
- Environment variables and PATH adjustments
- Useful aliases (eza, grep, wget, etc.)
  - Conditionally display eza icons if the env var NERD_FONT is set
  - OS-specific aliases for Arch and Debian families
- `please` function for sudo-ing previous commands easily

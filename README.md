# Geoff's Fish Configuration

This is my personal fish shell configuration, set up for portability across machines.

## Plugins

I use [fisher](https://github.com/jorgebucaran/fisher) to manage these plugins:

- [sponge](https://github.com/meaningful-ooo/sponge)
- [pure](https://github.com/pure-fish/pure)
- [autopair.fish](https://github.com/jorgebucaran/autopair.fish)

## Key Features

- Custom greeting
- Environment variables and PATH adjustments
- Useful aliases (eza, grep, wget, etc.)
  - Conditionally display eza icons if the env var NERD_FONT is set
  - OS-specific aliases for Arch and Debian families
- `please` function for sudo-ing previous commands easily

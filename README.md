## About
The repo contains most of the dot and config files that I use day to
day. A short list of the services I use:
  - Terminal: Alacritty
  - Shell: Fish and Bash
  - Windows Manager: i3
  - Editor: neovim
  - Status Bar: polybar

I tend to use the gruvbox hard dark theme for most services. If you want
to use a different theme, I would reference [base-16](https://github.com/chriskempson/base16).

There are branches for my different setups. The primary difference
between them is the polybar setup. My desktop setup has two monitors
while my laptop tends to only have one. 99% of the setup between these
branches is the same.

## How to use
Every services has its own directory. Inside that directory are three
bash scripts: `setup.sh`, `gather.sh`, and `get_deps.sh`. These put
config files where they need to go, collect any changes to known config
files, and download and install any dependencies that are needed,
respectively.

These scripts can be ran individually or all together via the scripts of
the same name at the root of this repo.

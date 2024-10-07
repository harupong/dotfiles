[private]
@default: help

# show help message
@help:
    echo "Usage: just <recipe>"
    echo ""
    just --list

# stow all of my dotfiles
stow-all:
   stow --verbose */

# stow a package
stow PKG:
   stow --verbose {{PKG}}

# dry-run stow all of my dotfiles
dry-stow-all:
   stow --verbose --simulate  */

# dry-run stow a package
dry-stow PKG:
   stow --verbose --simulate {{PKG}}


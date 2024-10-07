# Load completions
autoload -U compinit && compinit

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

setopt interactivecomments # enable comments in shell

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
eval "$(/opt/homebrew/bin/brew shellenv)"
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions $fpath)

# Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# Python related
PATH=$(python3 -m site --user-base)/bin:$PATH; export PATH

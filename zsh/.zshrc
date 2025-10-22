# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="xiong-chiamiov-plus"

plugins=( 
    git
    dnf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# check the dnf plugins commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dnf


# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
~/pokemon-go-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -la'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias server='ssh corby@192.168.178.5 -p 1337'
alias coding='cd /mnt/data/files/coding/'
alias lrz='ssh porc@lxhalle.in.tum.de'
alias c='clear'
alias py='python'
alias uni='cd /mnt/data/files/coding/uni'

export SYSTEMC_HOME=/usr/local/bin/systemc
export GOPATH=$HOME/go # Or wherever your GOPATH is set
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/.cargo/bin
export PATH="$HOME/.local/bin:$PATH"
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/corby/.opam/opam-init/init.zsh' ]] || source '/home/corby/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

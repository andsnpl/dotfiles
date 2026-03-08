eval "$(~/.local/bin/mise activate zsh)"

chpwd() {
	eza -la
}

chpwd

bindkey -e
 
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='bat -l man -p'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source <(fzf --zsh)
eval "$(starship init zsh)"

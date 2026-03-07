eval "$(~/.local/bin/mise activate zsh)"

chpwd() {
	eza -la
}

chpwd

bindkey -e
 
export EDITOR=nvim
export VISUAL=nvim

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source <(fzf --zsh)
eval "$(starship init zsh)"

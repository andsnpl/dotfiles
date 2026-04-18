# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*'

# History
HISTFILE=~/.local/share/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd

# Shell settings
bindkey -e

# mise
eval "$(~/.local/bin/mise activate zsh)"

# homebrew (optional)
if [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
fi

# Editor / pager
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='bat -l man -p'

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt / completion tools
source <(fzf --zsh)
eval "$(starship init zsh)"

# Auto ls on cd
chpwd() {
	eza -la
}
chpwd

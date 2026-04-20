export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.local/bin:$PNPM_HOME:$HOME/.cargo/bin:$HOME/.local/share/mise/shims:$PATH"
export SSH_AUTH_SOCK="${SSH_AUTH_SOCK:-"$XDG_RUNTIME_DIR/ssh-agent.socket"}"
export SHELL="$(which zsh)"

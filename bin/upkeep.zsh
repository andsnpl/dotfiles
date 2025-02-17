source ~/.zshrc

echo "[$(date -j +'%Y-%m-%dT%T%z')] Updating Oh My Zsh"
echo "----------"
# run in subshell to avoid issues with `exec` at end of update
(omz update)
echo "----------\n"

echo "[$(date -j +'%Y-%m-%dT%T%z')] Updating Homebrew packages"
echo "----------"
brew update
brew upgrade
brew cleanup
echo "----------\n"

echo "[$(date -j +'%Y-%m-%dT%T%z')] Updating programming languages with Mise"
echo "----------"
mise upgrade
echo "----------\n"

echo "[$(date -j +'%Y-%m-%dT%T%z')] Updating Rust toolchain"
echo "----------"
rustup update
echo "----------\n"

echo "[$(date -j +'%Y-%m-%dT%T%z')] Updating Node packages"
echo "----------"
npm update -g
echo "----------\n"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
sudo pacman -S conky zsh neovim python2-neovim python3-neovim ctags python-twisted python2-twisted curl wget cmake base-devel clang sakura docky intel-ucode
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pip install argparse
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
multirust update nightly
multirust update stable
multirust default nightly
cp ".zshrc" "$HOME/.zshrc" -f
cp ".conkyrc" "$HOME/.conkyrc" -f
mkdir -p "$HOME/.local/nvim"
cp "init.vim" "$HOME/.local/nvim/init.vim"
git clone "https://github.com/Valloric/YouCompleteMe" "$HOME/.local/nvim/plugged/YouCompleteMe"
cd "$HOME/.local/nvim/plugged/YouCompleteMe"
python2 ./install.sh --clang-complete --racer-complete
cd "$HOME"
# Run :PlugInstall after completion in nvim

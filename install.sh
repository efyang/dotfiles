DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
sudo pacman -S conky zsh neovim python2-neovim python-neovim ctags python-twisted python2-twisted curl wget cmake base-devel clang sakura docky intel-ucode sddm i3lock i3status
yaourt -S firefox-developer freshplayerplugin sddm-numix-theme-git i3-gaps-next-git dmenu2
sudo ln -s /usr/lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service --force
sudo sh -c "sddm --example-config > /etc/sddm.conf"
sudo sh -c 'printf "[Theme]\nCurrent=numix\n" >> /etc/sddm.conf'
git config --global user.name "Edward Yang"
git config --global user.email "edward.yang6771@gmail.com"
git config --global push.default simple
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone "https://github.com/bhilburn/powerlevel9k" "$HOME/.oh-my-zsh/custom/powerlevel9k"
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
git submodule update --init --recursive
python2 ./install.py --clang-complete --racer-complete
cd "$HOME"
# Run :PlugInstall after completion in nvim

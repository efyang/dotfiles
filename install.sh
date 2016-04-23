DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
printf "\n"
CONTINUE=false
while ! $CONTINUE
do
    if [[ "$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep state)" == *"discharging"* ]]; then
        BAT_STATE=false
    else
        BAT_STATE=true
    fi
    wget -q --tries=10 --timeout=20 --spider http://google.com > /dev/null
    if [[ $? -ne 0 ]]; then
        NET_STATE=false
    else
        NET_STATE=true
    fi
    
    if $NET_STATE; then
        NET_INDICATOR="✓"
    else
        NET_INDICATOR="✗"
    fi
    
    if $BAT_STATE; then
        BAT_INDICATOR="✓"
    else
        BAT_INDICATOR="✗"
    fi

    printf "\r\e[1A"
    printf "Connected to power: $BAT_INDICATOR\n"
    printf "Connected to internet: $NET_INDICATOR"

    if $NET_STATE && $BAT_STATE; then
        CONTINUE=true
        printf "\n"
    else
        sleep 1
    fi
done
echo -n "Git name: "
read $NAME
echo -n "Git email: "
read $EMAIL
sudo dirmngr &
sudo pacman-key --refresh-keys
sudo pacman -S conky zsh neovim python2-neovim python-neovim ctags python-twisted python2-twisted curl wget cmake base-devel clang sakura docky intel-ucode sddm i3lock i3status ibus ibus-sunpinyin graphviz jq ttf-droid ttf-fira-mono ttf-fira-sans adobe-source-han-sans-cn-fonts xfce4-goodies xarchiver gvfs gvfs-smb intellij-idea-community-edition mate-system-monitor clementine flashplugin qalculate-gtk gtk-theme-arc deluge calligra-krita gimp xclip ninja python2-pip python-pip --noconfirm
gpg --keyserver http://pgp.mit.edu --recv-keys 0x4E2C6E8793298290
CC=/usr/bin/clang CXX=/usr/bin/clang++ yaourt -S firefox-developer freshplayerplugin sddm-numix-theme-git i3-gaps-next-git dmenu2 albert atom-editor-bin libtinfo skippy-xd-git sublime-text-dev photoqt bomi xfluxd tor-browser-en thermald xfluxd --noconfirm
sudo ln -s /usr/lib/systemd/system/sddm.service /etc/systemd/system/display-manager.service --force
sudo systemctl start thermald
sudo systemctl enable thermald
sudo systemctl enable xfluxd
sudo sh -c "sddm --example-config > /etc/sddm.conf"
sudo sh -c 'printf "[Theme]\nCurrent=numix\n" >> /etc/sddm.conf'
sudo pacman -Rns pragha light-locker lightdm light-locker-settings lightdm-webkit2-greeter
sudo timedatectl set-ntp true
systemctl --user enable xfluxd
\cp -R ".config/" "$HOME/.config"
\cp -R "backgrounds" "$HOME/Pictures/backgrounds"
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global push.default simple
sudo pip install argparse
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh
multirust update 
multirust default nightly
cargo install cargo-check
cargo install cargo-edit
cargo install cargo-graph
\cp ".zshrc" "$HOME/.zshrc"
git clone "https://github.com/zagortenay333/Harmattan" "$HOME/Harmattan"
\cp -R "$HOME/Harmattan/.harmattan-assets/" "$HOME/.harmattan-assets/"
\cp ".conkyrc" "$HOME/.conkyrc"
git clone "https://github.com/Valloric/YouCompleteMe.git" "$HOME/.config/nvim/plugged/YouCompleteMe"
cd "$HOME/.config/nvim/plugged/YouCompleteMe"
git submodule update --init --recursive
python2 ./install.py --clang-complete --racer-complete
cd "$HOME"
if xinput list | grep -Fq "Synaptics"
then
    echo "synclient PalmDetect=1" >> "$HOME/.profile"
fi
git clone "https://github.com/bhilburn/powerlevel9k" "$HOME/.oh-my-zsh/custom/powerlevel9k"
read LAT LON <<< $(
for word in $(wget -qO- http://ip-api.com/line/\?fields\=lat,lon)
do
    echo $word
done
)
sudo echo "# Your X screen
DISPLAY=:0

# Your current latitude
LAT=$LAT

# Your current longitude
LON=$LON

# The desired colour temperature
TEMP=3400" > /etc/xfluxd.conf
sudo systemctl start xfluxd
# clear unused
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
sudo pacman -Scc --noconfirm
nvim -c "PlugInstall | R | R | R | :q | :q"
echo "zsh" >> "$HOME/.bashrc"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

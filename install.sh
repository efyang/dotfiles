#!/usr/bin/env bash
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
read NAME
echo -n "Git email: "
read EMAIL

# Prevent sudo timeout
sudo -v # ask for sudo password up-front
while true; do
  # Update user's timestamp without running a command
  sudo -nv; sleep 1m
  # Exit when the parent process is not running any more. In fact this loop
  # would be killed anyway after being an orphan(when the parent process
  # exits). But this ensures that and probably exit sooner.
  kill -0 $$ 2>/dev/null || exit
done &

sudo dirmngr &
sudo pacman-key --refresh-keys
sudo pacman -S conky zsh neovim python2-neovim python-neovim ctags python-twisted python2-twisted curl wget cmake base-devel clang sakura docky intel-ucode i3lock i3status ibus ibus-sunpinyin graphviz jq ttf-droid ttf-fira-mono ttf-fira-sans adobe-source-han-sans-cn-fonts xfce4-goodies xarchiver gvfs gvfs-smb intellij-idea-community-edition mate-system-monitor clementine flashplugin qalculate-gtk gtk-theme-arc deluge krita gimp xclip ninja python2-pip python-pip mesa-demos xorg-drivers redshift adobe-source-code-pro-fonts reflector networkmanager-openconnect screenfetch screenlets rsync --noconfirm
gpg --keyserver http://pgp.mit.edu --recv-keys 0x4E2C6E8793298290
sudo pacman -Rns pragha numix-icon-theme numix-icon-theme-square --noconfirm
yaourt -S firefox-developer freshplayerplugin i3-gaps-next-git dmenu2 albert atom-editor-bin libtinfo skippy-xd-git sublime-text-dev photoqt tor-browser-en thermald gtk-theme-adapta-git lightdm-webkit-theme-material-git numix-circle-icon-theme-git --noconfirm
sudo ln -s /usr/lib/libtinfo.so /usr/lib/libtinfo.so.5
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo systemctl start thermald
sudo systemctl enable thermald
sudo timedatectl set-ntp true
rsync -av "scripts/" "$HOME/scripts/"
rsync -av ".config/" "$HOME/.config/"
mkdir -p "$HOME/.config/nvim"
\cp ".config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
mkdir "$HOME/Pictures/backgrounds"
tar -xvf "backgrounds.tar.xz" --overwrite-dir -C "$HOME/Pictures/"
sudo mkdir "/var/lib/AccountsService/wallpapers"
sudo tar -xvf "lightdm-wallpapers.tar.xz" --overwrite-dir -C "/var/lib/AccountsService/"
sudo rsync -av "/var/lib/AccountsService/lightdm-wallpapers/" "/var/lib/AccountsService/wallpapers/"
sudo rm -rf "/var/lib/AccountsService/lightdm-wallpapers"
echo "Icon=/usr/share/lightdm-webkit/themes/material/assets/ui/avatar.png" | sudo tee "/var/lib/AccountsService/users/$USER" > /dev/null
sudo \cp "lightdm-webkit2-greeter.conf" "/etc/lightdm/lightdm-webkit2-greeter.conf"
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global push.default simple
sudo pip install argparse
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup install nightly
rustup default nightly
cargo install cargo-check
cargo install cargo-edit
cargo install cargo-graph
cargo install clippy
curl "http://dl.dafont.com/dl/?f=sansation" -o sansation.zip >/dev/null
unzip sansation.zip -d "$HOME/.fonts"
rm -f sansation.zip
\cp ".zshrc" "$HOME/.zshrc"
git clone "https://github.com/zagortenay333/Harmattan" "$HOME/Harmattan"
rm -rf "$HOME/Harmattan"
\cp -R "$HOME/Harmattan/.harmattan-assets/" "$HOME/.harmattan-assets/"
\cp -R ".screenlets/" "$HOME/.screenlets/"
\cp ".conkyrc" "$HOME/.conkyrc"
git clone "https://github.com/Valloric/YouCompleteMe.git" "$HOME/.config/nvim/plugged/YouCompleteMe"
cd "$HOME/.config/nvim/plugged/YouCompleteMe"
git submodule update --init --recursive
RAM="${${${$(cat /proc/meminfo | grep MemTotal)%kB*}#MemTotal:}// /}"
if [ "$RAM" -lt 4194304 ]; then
    export YCM_CORES=2
fi
python2 ./install.py --clang-complete --racer-complete
cd "$HOME"
if xinput list | grep -Fq "Synaptics"
then
    echo "synclient PalmDetect=1" >> "$HOME/.profile"
fi
git clone "https://github.com/bhilburn/powerlevel9k" "$HOME/.oh-my-zsh/custom/powerlevel9k"
# clear unused
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
sudo pacman -Scc --noconfirm
nvim -c "PlugInstall | :q | :q"

# gen ssh key for github
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

git clone "https://raw.github.com/robbyrussell/oh-my-zsh/"
rsync -av "./oh-my-zsh/" "$HOME/.oh-my-zsh/"
rm -rf "./oh-my-zsh"
chsh -s "/usr/bin/zsh"

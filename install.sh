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
sudo pacman -Syu
sudo pacman -S conky zsh neovim python2-neovim python-neovim ctags python-twisted python2-twisted curl wget cmake base-devel clang docky intel-ucode i3lock i3status ibus ibus-sunpinyin graphviz jq ttf-droid ttf-fira-mono ttf-fira-sans adobe-source-han-sans-cn-fonts xfce4-goodies gvfs gvfs-smb intellij-idea-community-edition mate-system-monitor clementine flashplugin qalculate-gtk arc-gtk-theme deluge krita gimp xclip ninja python2-pip python-pip mesa-demos xorg-drivers redshift adobe-source-code-pro-fonts reflector networkmanager-openconnect screenfetch screenlets rsync gparted python-pyqt5 audacity bless ripgrep cheese fftw gource lshw networkmanager-openconnect networkmanager-openvpn opencv asciinema rustfmt tokei python-jedi python2-jedi openal numix-icon-theme-circle python-xdg python-gobject librsvg gtk3-print-backends peek puddletag vlc wavemon tree compton --noconfirm
gpg --keyserver http://pgp.mit.edu --recv-keys 0x4E2C6E8793298290
gpg --recv-key B6C8F98282B944E3B0D5C2530FC3042E345AD05D
gpg --recv-key BBBEBDBB24C6F355
gpg --recv-key D1483FA6C3C07136
sudo pacman -Rns pragha --noconfirm
sudo pacman -Rns numix-icon-theme numix-icon-theme-square --noconfirm
yaourt -S firefox-developer i3-gaps-next-git dmenu2 aur/albert atom-editor-bin skippy-xd-git sublime-text-dev photoqt tor-browser-en thermald lightdm-webkit-theme-material-git gtk-arc-flatabulous-theme-git discord-canary downgrade kwplayer screencloud xfce4-volumed-pulse jdownloader2 tilp ttf-emojione-color firefox-nightly ttf-ms-fonts yakyak --noconfirm
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo systemctl start thermald
sudo systemctl enable thermald
sudo timedatectl set-ntp true
xfce4-panel --quit
pkill xfconfd
rm -rf "$HOME/.config/xfce4"
rsync -av "scripts/" "$HOME/scripts/"
rsync -av ".config/" "$HOME/.config/"
xfce4-panel &
mkdir -p "$HOME/.config/nvim"
\cp ".config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
mkdir "$HOME/Pictures/backgrounds"
tar -xvf "backgrounds.tar.xz" --overwrite-dir -C "$HOME/Pictures/"
sudo mkdir "/var/lib/AccountsService/wallpapers"
sudo tar -xvf "lightdm-wallpapers.tar.xz" --overwrite-dir -C "/var/lib/AccountsService/"
sudo rsync -av "/var/lib/AccountsService/lightdm-wallpapers/" "/var/lib/AccountsService/wallpapers/"
sudo rm -rf "/var/lib/AccountsService/lightdm-wallpapers"
sudo cp "efyang.png" "/var/lib/AccountsService/icons/efyang.png"
echo "Icon=/var/lib/AccountsService/icons/$USER.png" | sudo tee -a "/var/lib/AccountsService/users/$USER" > /dev/null
sudo \cp "lightdm-webkit2-greeter.conf" "/etc/lightdm/lightdm-webkit2-greeter.conf"
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global push.default simple
sudo pip install argparse
wget "https://raw.githubusercontent.com/Cldfire/ayu-rs/master/css/rustdoc.css" -O "$HOME/scripts/rustdoc_ayu.css"
curl https://sh.rustup.rs -sSf | sh -s -- -y
source $HOME/.cargo/env
rustup install nightly
rustup default nightly
rustup component add rust-analysis
rustup component add rust-src
rustup component add rls-preview
cargo install sccache
cargo install cargo-edit
cargo install cargo-graph
cargo install cargo-modules
cargo install cargo-tree
cargo install cargo-update
cargo install clippy
cargo install exa
ln -s "$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/share/doc/rust/html/" "$HOME/Documents/rust-docs"
curl "http://dl.dafont.com/dl/?f=sansation" -o sansation.zip >/dev/null
curl "https://fonts.google.com/download?family=Poiret%20One" -o poiretone.zip >/dev/null
unzip sansation.zip -d "$HOME/.fonts"
unzip poiretone.zip -d "$HOME/.fonts"
rm -f sansation.zip
rm -f poiretone.zip
\cp ".zshrc" "$HOME/.zshrc"
\cp ".ctags" "$HOME/.ctags"
git clone "https://github.com/zagortenay333/conky-Vision" "$HOME/conky-Vision"
\cp -R "$HOME/conky-Vision/.conky-vision-icons/" "$HOME/.conky-vision-icons/"
rm -rf "$HOME/conky-Vision"
\cp -R ".screenlets/" "$HOME/.screenlets/"
\cp ".conkyrc" "$HOME/.conkyrc"
#git clone "https://github.com/Valloric/YouCompleteMe.git" "$HOME/.config/nvim/plugged/YouCompleteMe"
#cd "$HOME/.config/nvim/plugged/YouCompleteMe"
sed -ie "s/\/home\/efyang/\/home\/$USER/g" "$HOME/.config/nvim/init.vim"
#git submodule update --init --recursive
#RAM="${${${$(cat /proc/meminfo | grep MemTotal)%kB*}#MemTotal:}// /}"
#if [ "$RAM" -lt 4194304 ]; then
    #export YCM_CORES=2
#fi
#python2 ./install.py --clang-complete --racer-complete
cd "$HOME"
if xinput list | grep -Fq "Synaptics"
then
    echo "synclient PalmDetect=1" >> "$HOME/.profile"
fi
git clone "https://github.com/bhilburn/powerlevel9k" "$HOME/.oh-my-zsh/custom/powerlevel9k"
# clear unused
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
sudo pacman -Scc --noconfirm
# gen ssh key for github
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
ibus-daemon &
photoqt --start-in-tray &
git clone "https://github.com/robbyrussell/oh-my-zsh/"
rsync -av "./oh-my-zsh/" "$HOME/.oh-my-zsh/"
rm -rf "./oh-my-zsh"
nvim +PlugInstall +UpdateRemotePlugins +qa
rm -rf ~/.cache/sessions
mkdir -p ~/projects
chsh -s "/usr/bin/zsh"

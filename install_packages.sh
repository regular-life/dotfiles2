#!/bin/bash

# RUN THIS SCRIPT FROM A USER WITH A SUDOERS ENTRY
os_name=$(grep '^NAME=' /etc/os-release | grep -o '".*"' | tr -d '"')

install_cmd () {
  if [[ $os_name = "void" ]];  then
    void install $1
  fi
  if [[ $os_name = "Arch Linux" ]];  then
    yay -S $1
  fi
}

# add new user and add it to sudo group
add_user () {
  pacman -S sudo
  read -p "Enter username: " username
  useradd -m -G audio,wheel,video -s /bin/bash $username 
  passwd $username  
  echo '$username ALL=(ALL:ALL) ALL' >> /etc/sudoers
}

# install zsh and ohmyzsh
install_ohmyzsh () {
  install_cmd "zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  chsh -s /bin/zsh
  install_cmd zsh-autosuggestions zsh-syntax-highlighting 
}

# install x and x related stuff
install_xorg () {
    install_cmd "xorg xbindkeys xsel xdotool"
  if [[ $os_name = "void" ]];  then
    install_cmd "xinit"
  fi
  if [[ $os_name = "Arch Linux" ]];  then
    install_cmd "xorg-xinit"
  fi
}

# install audio related stuff
install_audio () {
  install_cmd "alsa-utils pulseaudio mpd volctl mpdris2 mpdas playerctl"
  sudo usermod -a -G audio $USER
}

# install dwm
install_dwm () {
  if ! [[ -d "$PWD/dwm-flexipatch" ]]; then
    echo "dwm-flexipatch submodule not found"
  else
    cd $PWD/dwm-flexipatch
    sudo make clean install
  fi 
}

# install st 
install_st () {
   if ! [[ -d "$PWD/st-flexipatch" ]]; then
    echo "st-flexipatch submodule not found"
  else
    cd $PWD/st-flexipatch
    sudo make clean install
  fi 
}

# install dmnenu 
install_dmenu () {
   if ! [[ -d "$PWD/dmenu-flexipatch" ]]; then
    echo "dmenu-flexipatch submodule not found"
  else
    cd $PWD/dmenu-flexipatch
    sudo make clean install
  fi 
}

# install yay
install_yay () {
  pacman -S --needed git base-devel
  su -l $username  --command="
  sudo -S echo
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  "
}

# install some basic useful apps
install_apps () {
  install_cmd "firefox"
  install_cmd "vlc mpv cava ncmpcpp"  # multimedia
  install_cmd "htop dunst pcmanfm lxappearance newsboat android"  # utilities

  if [[ $os_name = "Arch Linux" ]]; then
    install_cmd "vscodium-bin sublime-text-4 android-file-transfer android-tools"
  elif [[ $os_name = "void" ]]; then
    install_cmd "vscode sublime-text4 android-file-transfer-linux android-tools"   # dev stuff
  fi

  install_cmd "dhcpcd iwd NetworkManager network-manager-applet"
  
  if [[ $os_name = "Arch Linux" ]]; then
    install_cmd "sublime-text-4 android-file-transfer android-tools"
  elif [[ $os_name = "void" ]]; then
    install_cmd "sublime-text4 android-file-transfer-linux android-tools"
  fi
}       # dev stuff


#######
if [[ $os_name = "Arch Linux" ]]; then
   install_yay 
fi
install_xorg
install_ohmyzsh
install_audio
install_dwm
install_apps


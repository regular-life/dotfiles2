# RUN THIS SCRIPT FROM A USER WITH A SUDOERS ENTRY
install_cmd () {
  if [[ $os_name = "void" ]];  then
    void install $1
  fi
  if [[ $os_name = "Arch Linux" ]];  then
    yay -S $1
  fi
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
  els
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

# install zsh and ohmyzsh
install_ohmyzsh () {
  user_check
  install_cmd "zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  install_cmd zsh-autosuggestions zsh-syntax-highlighting 
}
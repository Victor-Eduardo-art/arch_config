#!/bin/bash



# Config pacman
   sudo pacman -Syyu

   sudo pacman -S pacman-contrib
   sudo systemctl enable paccache.timer

# Install AUR 
   sudo pacman -S --needed base-devel git
   mkdir Programs
   cd Programs
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si

# Config user folders
   sudo pacman -S xdg-user-dirs
   xdg-user-dirs-update

# Install MIcrocode Intel
   sudo pacman -S intel-ucode

# Config Firewall
   sudo pacman -S ufw
   sudo ufw enable
   sudo systemctl enable ufw.service
   sudo ufw status verbose
   sudo pacman -S less

# Config Git
   git config --global init.defaultBranch <name>
   git config --global user.email "vcladara@gmail.com"
   git config --global user.name "Victor Eduardo"

# Config Rofi theme
   cd ~
   sudo pacman -S rofi
   git clone --depth=1 https://github.com/adi1090x/rofi.git
   cd rofi
   chmod +x setup.sh
   ./setup.sh

   cp launcher.sh .config/rofi/launchers/type-6/
   
# set wallpaper
   sudo pacman -S feh
   cp maxresdefault.jpg Pictures/
   feh --bg-scale Pictures/maxresdefault.jpg

# Config poybar
   sudo pacman -S polybar
   sudo yay -S networkmanager-dmenu-git
   sudo yay -S pywal
   sudo pacman -S calc

   # install themes
      git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
      cd polybar-themes
      chmod +x setup.sh
      /setup.sh
      cp -r forest ~/.config/polybar

# Config GRUB
  sudo cp grub /etc/default/
  sudo grub-mkconfig -o /boot/grub/grub.cfg

# move file configuration
   sudo cp 30-touchpad.conf /etc/X11/xorg.conf.d/
   sudo cp pacman.conf /etc/
   sudo cp i3wm/config .config/i3/

# INstall programs 
   sudo pacman -S geany
   sudo pacman -S thunar

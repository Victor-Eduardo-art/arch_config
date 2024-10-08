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

# Config Git
   git config --global init.defaultBranch <name>
   git config --global user.email "vcladara@gmail.com"
   git config --global user.name "Victor Eduardo"

# Config GRUB
  sudo mv grub /etc/default/
  sudo grub-mkconfig -o /boot/grub/grub.cfg

# move file configuration
   sudo mv 30-touchpad.conf /etc/X11/xorg.conf.d/
   sudo mv pacman.conf /etc/

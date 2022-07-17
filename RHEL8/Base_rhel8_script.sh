#!/usr/bin/env bash
#THE FOLLOWING SCRIPT WILL RUN ON RHEL8 GIVEN THE USB IS NAMED: rhelscripts AND THE USERNAME IS: nik
clear
#check to see if file exists on the usb beforehand as a check for the usb
if [[ -e /run/media/nik/rhelscripts/RHEL8/neofetch-7.1.0/test.txt ]]; then
  echo "test file exists on usb"
  echo "...Copying files from usb to Nik's home dir."
  sudo cp -R /run/media/nik/rhelscripts/RHEL8/neofetch-7.1.0/ /home/nik
  echo "...Changing directories now to home/nik/neofetch-7.1.0/"
  cd /home/nik/neofetch-7.1.0/
  echo "running 'make install'"
  sudo make install
  echo "...Changing directory to /home/nik"
  cd /home/nik
  echo "...Cleaning up neofetch directory."
  sudo rm -r home/nik/neofetch-7.1.0/
  echo 'neofetch' | sudo tee -a /home/nik/.bashrc
  echo "...Copying files from usb to Nik's picture dir."
  sudo cp /run/media/nik/rhelscripts/RHEL8/*.jpg /home/nik/Pictures
  echo "...Downloading and installing EPEL8"
  sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y
  echo "...Enabling the codeready-builder-for-rhel-8-*-rpms repository"
  sudo subscription-manager repos --enable "codeready-builder-for-rhel-8-$(arch)-rpms"
  sudo yum update libmodulemd -y
  echo ...Installing "make"
  sudo yum install make -y
  echo ...Installing "automake"
  sudo yum install automake -y
  echo "...Installing NTFS-3G"
  sudo yum install ntfs-3g -y
  echo "...Installing Nmap"
  sudo yum install nmap -y
  echo "...Installing transmission"
  sudo yum install transmission -y
  echo "...Installing tor"
  sudo yum install tor -y
  echo "...installing libreoffice-writer "
  sudo yum install libreoffice-writer -y
  echo "...Installing Rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh	 
  echo "Script is now finished."
else
  echo "The test file does not exist in the usb...exiting."
fi




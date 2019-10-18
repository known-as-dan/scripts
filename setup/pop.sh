# Colors
GREEN=`tput setaf 2`
RED=`tput setaf 1`

BOLD=`tput bold`

RESET=`tput sgr0`

function message {
	echo "${BOLD}${GREEN}${1}${RESET}"
}

function alert {
	echo "${BOLD}${RED}${1}${RESET}"
}

# Updating sources
message " => Updating sources."
sudo apt update

# Updating packages
message " => Updating packages."
sudo apt upgrade -y

# Installing Nvidia driver
message " => Installing Nvidia driver."
sudo apt install nvidia-driver-435

# Installing Gnome-Tweak-Tool
message " => Installing Gnome-Tweak-Tool."
sudo apt install gnome-tweak-tool

# Installing Google Chrome
message " => Installing Google Chrome."
chrome_path = "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
file_name = "google-chrome-stable_current_amd64.deb"
wget $chrome_path
sudo dpkg -i $file_name
rm $file_name

# Installing Spotify
message " => Installing Spotify."
sudo apt install spotify-client

# Installing Timeshift
message " => Installing Timeshift."
sudo apt install timeshift

# Removing all unnecessary packages
message " => Removing all unnecessary packages."
sudo apt autoremove -y

# Rebooting
alert " => Rebooting..."
alert "You have 10 seconds to stop this using the 'ctrl + c' key-combination(KeyboardInterrupt)!"
sleep 10s
reboot

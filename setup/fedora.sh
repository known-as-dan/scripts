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

# Adding RPM Fusion repositories
message " => Adding RPM Fusion repositories."
# Free
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# Non-Free
sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm


# Updating packages
message " => Updating packages."
sudo dnf update

# Installing Nvidia driver
message " => Installing Nvidia driver."
sudo dnf install akmod-nvidia.x86_64 -y

# Installing Gnome-Tweak-Tool
message " => Installing Gnome-Tweak-Tool."
sudo dnf install gnome-tweak-tool -y

# Installing Google Chrome
message " => Installing Google Chrome."
sudo dnf install fedora-workstation-repositories -y
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install google-chrome-stable -y

# Setting up flatpak
message " => Setting up flatpak(Adding flathub)."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Installing Spotify
message " => Installing Spotify."
flatpak install flathub com.spotify.Client

# Installing Timeshift
message " => Installing Timeshift."
sudo dnf install timeshift -y

# Removing all unnecessary packages
message " => Removing all unnecessary packages."
sudo dnf autoremove -y

# Rebooting
alert " => Rebooting..."
alert "You have 10 seconds to stop this using the 'ctrl + c' key-combination(KeyboardInterrupt)!"
sleep 10s
reboot

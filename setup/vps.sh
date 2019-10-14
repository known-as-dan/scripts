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

# Creating main user
username="cloud"

message " => Creating user: '${username}'."

adduser ${username}

# Giving user sudo privileges
message " => Giving user 'sudo' privileges to '${username}'."

usermod -aG sudo ${username}

# Transfering current SSH key to new user
message " => Transfering current SSH key to new user."
rsync --archive --chown=${username}:${username} ~/.ssh /home/${username}

# Setting up basic firewall
message " => Setting up basic firewall using UFW."

message " => Allowing 'OpenSSH' through firewall."
ufw allow OpenSSH

message " => Enabling firewall."
ufw enable

alert " => Listing firewall status, please inspect..."
ufw status
alert " => Resuming in 5 seconds..."
sleep 5s

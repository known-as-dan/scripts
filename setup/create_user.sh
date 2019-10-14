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
username=$1
username_length=${#username}

if [username_length <= 0]; then
	alert "Invalid username!"
	return

message " => Creating user: '${username}'."

adduser ${username}

# Transfering current SSH key to new user
message " => Transfering current SSH key to new user."
rsync --archive --chown=${username}:${username} ~/.ssh /home/${username}

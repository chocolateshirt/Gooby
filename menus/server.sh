#!/bin/bash

MENU="Maintain Server"
source /opt/GooPlex/menus/variables.sh

# Menu Options

PATCHES(){
	PERFORM="apply"
	TASK="patches"
	source /opt/GooPlex/install/server/${TASK}-${PERFORM}.sh
}

TZONE(){
	PERFORM="manage"
	TASK="timezone"
	source /opt/GooPlex/install/server/${TASK}-${PERFORM}.sh
}

UPGRADE(){
	PERFORM="upgrade"
	TASK="OS"
	source /opt/GooPlex/install/server/${TASK}-${PERFORM}.sh
}

QUIT(){
	exit
}

# Display menu

show_menus() {
	clear
	echo " ${YELLOW}"
	MENUSTART
	echo " ${YELLOW}A${STD} - Update Server with Latest Patches"
	echo " ${YELLOW}B${STD} - Set Timezone"
	echo " ${YELLOW}C${STD} - Server Upgrade - Danger zone!"
	echo " ${WHITE}Z${STD} - EXIT to Main Menu"
	echo " ${YELLOW}"
	MENUEND
}

# Read Choices

read_options(){
	local choice
	read -n 1 -s -r -p "Choose option: " choice
	case $choice in
		[Aa]) PATCHES ;;
		[Bb]) TZONE ;;
		[Cc]) UPGRADE ;;
		[Zz]) QUIT ;;
		*) echo "${LRED}Please select a valid option${STD}" && sleep 2
	esac
}

MENUFINALIZE

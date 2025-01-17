#!/bin/bash
# ██████╗ ███╗   ███╗███╗   ██╗ ██████╗ ██╗
# ██╔══██╗████╗ ████║████╗  ██║██╔═══██╗██║
# ██║  ██║██╔████╔██║██╔██╗ ██║██║   ██║██║
# ██║  ██║██║╚██╔╝██║██║╚██╗██║██║▄▄ ██║██║
# ██████╔╝██║ ╚═╝ ██║██║ ╚████║╚██████╔╝██║
# ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚══▀▀═╝ ╚═╝
#     DIVI Masternode Quick Installer
#
# Modified for DIVI by NotJustCoins, based off of Nodemaster by Marsmensch
#
# version: 	0.9.9
# date:    	09/18/2019
# function:	part of the masternode scripts, source the proper config file
#
#                                                                      
# 	Instructions:
#               Run this script and wait. After a while you should have a working
#               masternode setup where only the private keys need to be added.
#
#	Platforms: 	
#               - Linux Ubuntu 16.04 LTS ONLY on a Vultr VPS (its by far the cheapest option)
#               - Generic Ubuntu support will be added at a later point in time
#
#	System requirements:
#               - A vultr micro instance works for up to 5 masternodes 
#				- Activate the free IPv6 option
#

function source_config() {
	if [ -f ${SETUP_CONF_FILE} ]; then
		echo "read default config"	
		source config/default.env
		echo "Script version ${SCRIPT_VERSION}, you picked: ${1}"
		echo "apply config file for ${1}"		
		source "${SETUP_CONF_FILE}"

		echo "running installer script"		
		source scripts/masternode_install.sh ${1}
	else
		echo "required file ${SETUP_CONF_FILE} does not exist, abort!"
		exit 1   
	fi
}

SETUP_CONF_FILE="config/${1}/${1}.env"
SETUP_MNODES_COUNT=${2}
CRYPTOS=`ls -l config/ | egrep '^d' | awk '{print $9}'`

# put in main at a later point in time
if (( $# < 1 ));
then
  echo "Please provide a shortname to install a masternode: ..."
  echo "************************************"
  echo "Supported crypto projects:"
  echo "${CRYPTOS}"
  echo "************************************"
  exit 1
fi

source_config ${1}
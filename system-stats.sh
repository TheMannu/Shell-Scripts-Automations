#!/bin/bash
#Purpose : To display the system stats with improved visuals and alerts.
#Author : DevSafia
#Date : 27 February 2023

# Color Codes
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Welcome Banner
echo -e "${CYAN} ******************************************* SHELL SCRIPTING *************************************** ${RESET}"
echo -e "${GREEN} Hello Doston! Kise ho aap sab? ${RESET}"
sleep 2

# Input User Name
echo -e "${YELLOW} Please enter your name: ${RESET}"
read name
echo -e "${CYAN} Hi $name, Your system stats are as follows: ${RESET}"
sleep 1
echo -e "${CYAN} *************************************************************** ${RESET}"

# Display Current Date and Time
echo -e "${CYAN} ******************************* CURRENT DATE AND TIME ****************************** ${RESET}"
date | awk '{print " Today is: " $3 "st - " $2 " ; Day = " $1 " ; Time: " $4 }'
echo

# Disk Space Information
echo -e "${CYAN} *************************************** DISK SPACE AVAILABLE ****************************** ${RESET}"
df_output=$(df -H | xargs | awk '{ print $10 "/" $9 }')
free_space=$(echo $df_output | awk -F"/" '{print $1+0}')
used_space=$(echo $df_output | awk -F"/" '{print $2+0}')

if (( free_space < 20 )); then
  echo -e "${RED} Warning: Low Disk Space! Free/Used: $df_output :GB ${RESET}"
else
  echo -e "${GREEN} Disk Space Available: Free/Used: $df_output :GB ${RESET}"
fi
echo

# User Uptime
echo -e "${CYAN} ***************************** USER UPTIME ****************************** ${RESET}"
uptime_output=$(uptime | awk -F", " '{print $1}')
echo -e "${GREEN} $uptime_output ${RESET}"
echo

# Last 3 Login Details
echo -e "${CYAN} ******************************* LAST 3 LOGIN DETAILS ****************************** ${RESET}"
last | head -3
echo

# Currently Connected Users
echo -e "${CYAN} ****************************************** CURRENTLY CONNECTED *************************************** ${RESET}"
w
echo

# End Banner
echo -e "${CYAN} *************************************************** END ************************************************************ ${RESET}"

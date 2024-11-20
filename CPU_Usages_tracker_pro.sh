#!/bin/bash
# Purpose: Log CPU usage along with other system details in a human-readable format.
# Author: AshwaniKumar
# Date: Updated for clarity and aesthetics.

# Define the output file
output_file="cpu_usage_log.txt"

# Define color codes for aesthetics
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

# Add a header for the log file if it doesn't exist
if [ ! -f "$output_file" ]; then
    echo -e "${CYAN}Creating a new log file: $output_file${RESET}"
    echo -e "----------------------------------" > "$output_file"
    echo -e "CPU Usage Log - $(date)" >> "$output_file"
    echo -e "----------------------------------" >> "$output_file"
fi

# Capture CPU usage using top command and parse it for readability
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# Log CPU usage with a timestamp
echo -e "${CYAN}Logging CPU usage...${RESET}"
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
echo "$timestamp - CPU Usage: $cpu_usage%" >> "$output_file"

# Display a human-readable output
echo -e "${GREEN}Logged successfully:${RESET}"
echo -e "${YELLOW}Timestamp: $timestamp${RESET}"
if ((cpu_usage > 80)); then
    echo -e "${RED}Warning: High CPU usage detected - $cpu_usage%!${RESET}"
else
    echo -e "${GREEN}CPU usage is normal - $cpu_usage%.${RESET}"
fi

# Provide a summary of system details for additional context
echo -e "${CYAN}System Details:${RESET}"
echo -e "${YELLOW}Hostname: $(hostname)${RESET}"
echo -e "${YELLOW}Operating System: $(cat /etc/os-release | grep '^PRETTY_NAME' | cut -d= -f2 | tr -d '\"')${RESET}"
echo -e "${YELLOW}Kernel Version: $(uname -r)${RESET}"
echo -e "${YELLOW}Uptime: $(uptime -p)${RESET}"
echo -e "${YELLOW}Current Users: $(who | wc -l)${RESET}"

# End the script with a friendly message
echo -e "${CYAN}----------------------------------${RESET}"
echo -e "${GREEN}Log entry added to $output_file. Have a great day!${RESET}"
echo -e "${CYAN}----------------------------------${RESET}"

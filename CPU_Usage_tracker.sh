#!/bin/bash
# Purpose: Log CPU usage in a structured format.
# Author: Your Name
# Date: 2024-11-20

# Define the output file
output_file="cpu_usage_log.txt"

# Capture CPU usage using top command
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}' | cut -d. -f1)

# Log CPU usage with a timestamp
echo "$(date '+%Y-%m-%d %H:%M:%S') - CPU Usage: $cpu_usage%" >> "$output_file"

# Output a message to the console
echo "CPU usage logged: $cpu_usage%"

# Optional: Alert if CPU usage is high
if (( cpu_usage > 80 )); then
    echo "Warning: High CPU usage detected - $cpu_usage%"
fi

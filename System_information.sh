#!/bin/bash
output_file="system_info.txt"
echo "System Information:" >
"$output_file"
echo "___________" >> "$output_file"
echo "Hostname: $(hostname)" >>
"$output_file"
echo "OS: >> "$output_file"
echo "Memory: $(free-h)" >>
"$output_file"
echo "Disk Space: $(df-h)" >>
"$output_file"
echo "System info saved to $output_file."

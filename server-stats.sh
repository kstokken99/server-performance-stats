#!/bin/bash

section_header() {
    echo -e "\n===== $1 ====="
}

section_header "CPU Usage"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}')
echo "Total CPU Usage: $cpu_usage"

section_header "Memory Usage"

free -m | awk 'NR==2{printf "Total: %s MB | Used: %s MB | Free: %s MB | Usage: %.2f%%\n", $2, $3, $4, $3*100/$2}'

section_header "Disk Usage"

df -h / | awk 'NR==2{printf "Total: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5}'

section_header "Top 5 Processes by CPU"

ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -6

section_header "Top 5 Processes by Memory"

ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -6
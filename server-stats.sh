#!/bin/bash

section_header() {
    echo -e "\n =====$1====="
}

section_header "CPU Usage"

cpu_usage=$(top -l 1 | grep "CPU usage" | awk '{print $3 + $5 "%"}')
echo "Total CPU Usage: $cpu_usage"
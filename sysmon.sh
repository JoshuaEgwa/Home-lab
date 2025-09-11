#!/bin/bash

# This is a color coded system monitoring script for Linux systems.
# It provides real-time information about system resources such as CPU, memory, disk usage, and network activity.
# The script uses ANSI escape codes to color the output for better readability.

echo "HELLO World" 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo "Bug point check" # this console log was outputed

# Function to display CPU usage
display_cpu_usage() {
    echo "log cpu" #this log was not outputed which makes me now believe that the script is faling in this function
    echo -e "${CYAN}=== CPU Usage ===${NC}"     
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print "CPU Usage: " 100 - $1"%"}'
    echo
}

# Function to display memory usage
display_memory_usage() {
    echo -e "${GREEN}=== Memory Usage ===${NC}"
    free -h | awk 'NR==2{printf "Memory Usage: %s/%s (%.2f%%)\n", $3,$2,$3*100/$2 }'
    echo
}


main(){
    echo -e "${YELLOW}=== System Monitor ===${NC}"
        display_cpu_usage
        display_memory_usage
}

echo "Running System monitor"
main 
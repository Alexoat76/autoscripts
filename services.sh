#!/usr/bin/env zsh

#################################################################

# IMPLEMENTATION:
#     Script name:    Services
#     Author:         Alex O. Arévalo T.
#     Date:           2023-07-18
#     Version:        v0.1.9
#     License:        GNU General Public License

#################################################################

# DEBUG OPTION:
# Uncomment to check your syntax, without execution.
# set -n
# Uncomment to debug this shell script
# set -x

#################################################################

# SCRIPT: services.sh
# DESCRIPTION:
#     This script automates the management of services in the system.
#     It provides a user-friendly menu to check the status, start, stop,
#     restart, or reload services.
#
#     The script displays the system information and available services,
#     allowing the user to select a service and perform actions on it.

#################################################################

# NOTE: This script is designed to run in Zsh, but it is also
# compatible with Bash. However, it is recommended to run the script
# in Zsh for optimal performance and expected behavior.

#################################################################
#
# USAGE:
#   ./services.sh [OPTIONS]
#
# OPTIONS:
#   -g, --generateReport    Generate a complete report for script actions
#   -h, --help              Show this help message and exit
#   -v, --version           Display version information
#
# EXAMPLES:
#  ./services.sh
#  ./services.sh -g
#  ./services.sh -h
#  ./services.sh -v
#
#################################################################
# SETUP:
#################################################################

#################################################################
# CONFIGURATION:
#################################################################

# Color configuration
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

# System information
system=$(uname)
user=$(whoami)
date=$(date)
scriptName="services.sh"
version="v0.1.9"
location=$(pwd)

#################################################################
# FUNCTION DEFINITIONS:
#################################################################

# Displays the header information
displayHeader() {

  echo -e "${YELLOW}"
    echo "System: $system"
    echo "User: $user"
    echo "Date: $date"
    echo "Script name: $scriptName"
    echo "Version: $version"
    echo "Location: $location"
    echo "Author: Alex O. Arévalo T."
    echo "License: GNU General Public License"
    echo -e "${RESET}"
    sleep 1s
}

# Displays the available services
displayServices() {
  echo -e "${YELLOW}\nAvailable Services:${RESET}\n"
    sudo service --status-all
}

# Prompts the user for a service selection
promptService() {
    echo -e "${YELLOW}\nWhich service would you like to manage? (Enter service name or 'q' to quit)${RESET}"
    echo -e "${GREEN}"
    read -r service
    echo -e "${RESET}"

    if [[ "$service" == "q" ]]; then
        exit 0
    fi
}

# Prompts the user for an action selection
promptAction() {
    while true; do
        echo -e "${YELLOW}"
        echo "What action would you like to perform on '$service'?\n"
        echo "Please select an option:"
        echo "1. Start"
        echo "2. Stop"
        echo "3. Restart"
        echo "4. Reload"
        echo "0. Quit"
        echo ""
        read -r action
        echo -e "${RESET}"

        case $action in
            1) actionText="Start"; sudo service "$service" start; break;;
            2) actionText="Stop"; sudo service "$service" stop; break;;
            3) actionText="Restart"; sudo service "$service" restart; break;;
            4) actionText="Reload"; sudo service "$service" reload; break;;
            0) exit 0;;
            *)
                echo -e "${RED}Invalid option. Please try again.${RESET}"
                ;;
        esac
    done
}

# Generates a report of the script actions
generateReport() {
    local datetime=$(date +"%Y%m%d_%H%M%S")
    local reportFileName="service_report_$datetime.txt"
    local reportPath="$location/$reportFileName"

    # Check if the service name is provided as an argument
    if [[ -z "$service" ]]; then
        echo -e "${RED}Error: Service name not provided.${RESET}"
        exit 1
    fi

    echo -e "${YELLOW}\nGenerating report:${RESET}"
    echo "Report filename: ${GREEN}$reportFileName ${RESET}"

    # Generate the report content
    local reportContent=""
    reportContent+="\n\tServices Script Report"
    reportContent+="\n======================================\n"
    reportContent+="System:       $system\n"
    reportContent+="User:         $user\n"
    reportContent+="Date:         $date\n"
    reportContent+="Script name:  $scriptName\n"
    reportContent+="Version:      $version\n"
    reportContent+="Location:     $location\n"
    reportContent+="\n"
    reportContent+="Service:      $service\n"
    reportContent+="Status:       $actionText\n"

    # Save the report content to the file
    echo -e "$reportContent" >"$reportPath"

    echo -e "${GREEN}\nReport generated successfully.${RESET}"
    echo "Report path: $reportPath"
}

# Displays the usage information
displayUsage() {
    echo -e "${YELLOW}\nUsage:${RESET}"
    echo "${GREEN}./service.sh${RESET} ${YELLOW}[OPTIONS]${RESET}\n"
    echo -e "${YELLOW}Options:${RESET}"
    echo "-g, --generateReport    Generate a report of the script actions."
    echo "-h, --help              Display this usage information."
    echo "-v, --version           Display the script version."
    echo -e "${YELLOW}\nExamples:${RESET}"
    echo -e "  ${GREEN}./services.sh${RESET}"
    echo -e "  ${GREEN}./services.sh${RESET} -g"
    echo -e "  ${GREEN}./services.sh${RESET} -h"
    echo -e "  ${GREEN}./services.sh${RESET} -v"
}

#================================================================
# MAIN SCRIPT
#================================================================

# Enable error handling and strict variable checking
set -o errexit
set -o pipefail
set -o nounset

generateReport=false

# Check if a valid option is provided
while [[ $# -gt 0 ]]; do
  case $1 in
    --help | -h)
      displayUsage
      exit 0
      ;;
    --version | -v)
      echo "Script version: $version"
      exit 0
      ;;
    --generateReport | -g)
      generateReport=true
      ;;
    *)
      echo -e "${RED}Invalid option. Please see the usage:${RESET}"
      displayUsage
      exit 1
      ;;
  esac
  shift
done

# Display the header information
displayHeader

# Display the available services
displayServices

# Prompt for service selection
promptService

# Perform action on the selected service
promptAction

# Generate report if enabled
if [ "$generateReport" = true ]; then
  generateReport
fi


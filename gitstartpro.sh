#!/usr/bin/env zsh

#################################################################

# IMPLEMENTATION:
#     Script name:    Gitstartpro
#     Author:         Alex O. Arévalo T.
#     Date:           2023-06-21
#     Version:        v0.2.1
#     License:        GNU General Public License

#################################################################

# DEBUG OPTION:
# Uncomment to check your syntax, without execution.
# set -n
# Uncomment to debug this shell script
# set -x

#################################################################

# SCRIPT: gitstartpro.sh
# DESCRIPTION:
#   This script automates the process of creating a Git repository. It creates
#   a directory, adds a README file, initializes a Git repository, and performs
#   Git commands (`add`, `commit`, and `push`) to upload the repository to GitHub.
#   It also supports sending email notifications and generating a report of the script actions.

#################################################################

# NOTE: This script is designed to run in Zsh, but it is also
# compatible with Bash. However, it is recommended to run the script
# in Zsh for optimal performance and expected behavior.

#################################################################
#
# USAGE:
#   ./gitstartpro.sh [OPTIONS]
#
# OPTIONS:
#   -d, --dir-name        Specify the name of the directory to create (default: 'my_project')
#   -g, --generate-report Generate a complete report for script actions
#   -h, --help            Show this help message and exit
#   -r, --recipients      Specify email recipients for notification
#   -u, --github-username Specify the GitHub username
#   -v, --version         Display version information
#
# EXAMPLES:
#   ./gitstartpro.sh
#       Error: The -u or --github-username option is required.
#
#   ./gitstartpro.sh -d my_project -u myusername -r user1@example.com -g
#
#   ./gitstartpro.sh --dir-name my_project --github-username myusername --recipients user1@example.com --generate-report
#
# NOTE:
#   The script requires the following commands to be available in the system:
#   date, git, ls, mkdir, neomutt, pwd, ssh, tee, uname, whoami.
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

#################################################################
# FUNCTION DEFINITIONS:
#################################################################

# Function to check the availability of required commands
check_required_commands() {
  local commands=("date" "git" "ls" "mkdir" "neomutt" "pwd" "ssh" "tee" "uname" "whoami")
  local missing_commands=()

  for command in "${commands[@]}"; do
    if ! command -v "$command" >/dev/null 2>&1; then
      missing_commands+=("$command")
    fi
  done

  if [[ ${#missing_commands[@]} -gt 0 ]]; then
    echo -e "${RED}The following required commands are missing:${RESET}"
    for missing_command in "${missing_commands[@]}"; do
      echo -e "${RED}- $missing_command${RESET}"
    done
    echo -e "${RED}Please install them and try again.${RESET}"
    exit 1
  fi
}

# Function to create a directory
create_directory() {
  local dir_name=$1
  if [ ! -d "$dir_name" ]; then
    echo -e "${GREEN}\n >>> Creating directory: $dir_name ${RESET}"
    sleep 1s
    mkdir "$dir_name"
    echo -e "${YELLOW}\n Directory '$dir_name' successfully created! \n ${RESET}"
  else
    echo -e "${RED}\n Directory '$dir_name' already exists... Exiting. \n ${RESET}"
    exit 1
  fi
}

# Function to create README.md file
create_readme_file() {
  if [ ! -f "README.md" ]; then
    echo -e "${GREEN} >>> Creating README.md ${RESET}"
    sleep 1s
    echo "# README" > README.md
    echo -e "${YELLOW}\n README.md successfully created! \n ${RESET}"
  else
    echo -e "${RED}\n README.md already exists... Exiting. \n ${RESET}"
    exit 1
  fi
}

# Function to initialize Git repository
initialize_git_repository() {
  echo -e "${GREEN} >>> Initializing Git repository ${RESET}"
  sleep 1s
  #eval "$(ssh-agent -s)" # Use with ssh connection
  #ssh-add ~/.ssh/github_key  # Use with ssh connection
  git init
  echo -e "${YELLOW}\n Git repository initialized! \n ${RESET}"
}

# Function to add files to Git
add_files_to_git() {
  echo -e "${GREEN} >>> Adding files to Git ${RESET}"
  sleep 1s
  git add .
  echo -e "${YELLOW}\n Files added to Git! \n ${RESET}"
}

# Function to commit changes in Git
commit_changes_in_git() {
  echo -e "${GREEN} >>> Committing changes in Git ${RESET}"
  sleep 1s
  commit_output=$(git commit -m "First commit :heavy_check_mark:" 2>&1)
  git branch -M main
  echo -e "${YELLOW}\n Changes committed in Git! \n ${RESET}"
}

# Function to push Git repository to GitHub
push_to_github() {
  echo -e "${GREEN} >>> Pushing to GitHub ${RESET}"
  sleep 1s

  echo -e "${GREEN} >>> Constructing repository URL ${RESET}"
  repository_url="https://github.com/$github_username/$dir_name.git"
  #repository_url="git@github.com:$github_username/$dir_name.git" # Use with ssh connection
  echo -e "${YELLOW}\n Repository URL: $repository_url \n ${RESET}"

# Push the repository to GitHub
  git remote add origin "$repository_url"
  git push -u origin main
  echo ""

# Capture the output of git status command
  status_output=$(git status 2>&1)

  echo -e "${GREEN} >>> Repository successfully uploaded to GitHub! \n ${RESET}"
}

# Function to send an email notification using neomutt
send_email_notification() {
  local recipients=$1
  local subject=$2
  local body=$3

  echo -e "${GREEN} >>> Sending email notification \n ${RESET}"
  sleep 1s

  # Send email using neomutt
  echo -e "$body" | neomutt -s "$subject" -- "$recipients"

  echo -e "${YELLOW}\n Email notification sent! ${RESET}"
}

# Function to generate a report
generate_report() {
  local current_time=$(date +"%Y%m%d_%H%M%S")
  local report_file="gitstartpro_report_${current_time}.txt"
  echo ""
  echo -e "${GREEN} >>> Generating report: $report_file \n ${RESET}"

  echo -e "\n\tGitStartpro Report" > "$report_file"
  echo -e "=============================" >> "$report_file"
  echo -e "System: $(uname)" | tee -a "$report_file"
  echo -e "User: $(whoami)" | tee -a "$report_file"
  echo -e "Today is: $(date)" | tee -a "$report_file"
  echo -e "Script name: gitstartpro" | tee -a "$report_file"
  echo -e "Location: $(pwd)" | tee -a "$report_file"
  echo -e "Version script: v0.2.1" | tee -a "$report_file"
  echo -e "\n" >> "$report_file"

  echo -e "1. Git Repository Information" >> "$report_file"
  echo -e "=============================" >> "$report_file"
  echo "Directory name: $dir_name" | tee -a "$report_file"
  if [ -d "$dir_name" ]; then
    echo "Directory $dir_name already exists... Exiting." | tee -a "$report_file"
  else
    echo "Directory $dir_name successfully created!" | tee -a "$report_file"
  fi
  echo -e "\nDirectory Listing:" | tee -a "$report_file"
  ls -la | tee -a "$report_file"
  echo -e "\n" >> "$report_file"

  echo -e "2. Execution Status" >> "$report_file"
  echo -e "=============================" >> "$report_file"
  echo "$commit_output" | tee -a "$report_file"
  echo "$status_output" | tee -a "$report_file"
  echo -e "\n" >> "$report_file"

  echo -e "3. Script Actions" >> "$report_file"
  echo -e "=============================" >> "$report_file"
  echo -e "Creating directory: $dir_name" >> "$report_file"
  echo -e "Creating README.md" >> "$report_file"
  echo -e "Initializing Git repository" >> "$report_file"
  echo -e "Adding README.md file to Git" >> "$report_file"
  echo -e "Committing changes in Git" >> "$report_file"
  echo -e "Pushing to GitHub" >> "$report_file"
  echo -e "* Creating report file if is require" >> "$report_file"
  echo -e "* Sending email notification if is require" >> "$report_file"
  echo -e "${GREEN}\n Report generated: $report_file \n ${RESET}"
}

# Function to display usage information
usage() {
  echo -e "${YELLOW}\nUsage:${RESET}"
  echo -e "  ${GREEN}./gitstartpro.sh${RESET} ${YELLOW}[OPTIONS]${RESET}\n"
  echo -e "${YELLOW}Options:${RESET}"
  echo -e "  -d, --dir-name\tSpecify the name of the directory to create (${GREEN}default:${RESET} 'my_project')"
  echo -e "  -h, --help\t\tShow this help message and exit"
  echo -e "  -r, --recipients\tSpecify email recipients for notification"
  echo -e "  -u, --github-username\tSpecify the GitHub username"
  echo -e "  -v, --version\t\tDisplay version information"
  echo -e "  -g, --generate-report\tGenerate a complete report for script actions \n"
  echo -e "${YELLOW}Examples:${RESET}"
  echo -e "  ${GREEN}./gitstartpro.sh ${RESET}"
  echo -e "  ${RED}\tError: The -u or --github-username/myusername option is required.${RESET} \n"
  echo -e "  ${GREEN}./gitstartpro.sh ${RESET}-d my_project -u myusername -r user1@example.com -g"
  echo -e "  ${GREEN}./gitstartpro.sh ${RESET}--dir-name my_project --github-username myusername --recipients user1@example.com --generate-report"
  echo -e "${YELLOW}\nNOTE:${RESET}"
  echo -e "  The script requires the following commands to be available in the system:"
  echo -e "  ${GREEN}\tdate, git, ls, mkdir, neomutt, pwd, ssh, tee, uname, whoami${RESET}"
}

# Function to display the version of the script
display_version() {
  echo "${YELLOW}\nScript name:${RESET} Gitstartpro"
  echo "${YELLOW}Version:${RESET} v0.2.1"
  echo "${YELLOW}Author:${RESET} Alex O. Arévalo T."
  echo "${YELLOW}License:${RESET} GNU General Public License"
}

#################################################################
# MAIN:
#################################################################

# Check the availability of required commands
check_required_commands

# Default values
dir_name="my_project"
github_username=""
recipients=""
generate_report=false

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      usage
      exit 0
      ;;
    -v|--version)
      display_version
      exit 0
      ;;
    -d|--dir-name)
      shift
      dir_name=$1
      ;;
    -u|--github-username)
      shift
      github_username=$1
      ;;
    -r|--recipients)
      shift
      recipients=$1
      ;;
    -g|--generate-report)
      generate_report=true
      ;;
    *)
      echo -e "${RED}Invalid option: $1${RESET}"
      usage
      exit 1
      ;;
  esac
  shift
done

# Check if github-username is provided
if [ -z "$github_username" ]; then
  echo -e "${RED}\nError: The -u or --github-username option is required.${RESET}"
  usage
  exit 1
fi

# Prompt for recipient if not specified
if [ -z "$recipients" ]; then
  echo -n "${YELLOW}\n Enter email recipient(s): \n"${RESET}
  echo ""
  read recipients
fi

# Create a directory
create_directory "$dir_name"

# Move into the directory
cd "$dir_name"

# Create README.md file
create_readme_file

# Initialize Git repository
initialize_git_repository

# Add files to Git
add_files_to_git

# Commit changes in Git
commit_changes_in_git

# Push Git repository to GitHub
push_to_github

# Check if recipients are provided
if [ -z "$recipients" ]; then
  echo -e "${YELLOW}\n Notification not sent. No recipients specified.${RESET}"
else
  # Send email notification
  email_subject="Git repository created: $dir_name"
  email_body="A new Git repository has been created in the directory: $dir_name\n"
  email_body+="GitHub username: $github_username\n"
  email_body+="Directory path: $(pwd)\n"
  send_email_notification "$recipients" "$email_subject" "$email_body"
fi

# Generate report if enabled
if [ "$generate_report" = true ]; then
  generate_report
fi

echo -e "${GREEN} >>> Gitstartpro script completed successfully!${RESET}"

# Exit with status code 0 to indicate successful execution
exit 0

#################################################################

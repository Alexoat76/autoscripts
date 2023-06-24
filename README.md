# Autoscripts


## Gitstartpro

*`Gitstartpro`* is a script that automates the process of creating a Git repository. It creates a directory, adds a README file, initializes a Git repository, and performs Git commands (`add`, `commit`, and `push`) to upload the repository to GitHub. It also supports sending email notifications and generating a report of the script actions.

The script provides various options to customize the repository creation process. You can specify the directory name, GitHub username, and email recipients for notifications, and generate a report to capture the script's actions.

## Features
- Creates a directory for the Git repository
- Adds a README file to the repository
- Initializes a Git repository
- Performs Git commands (`add`, `commit`, `push`) to upload the repository to GitHub
- Sends email notifications to specified recipients
- Generates a report capturing the script's actions

## Table of Contents
- **[Installation](#Installation)**
- **[Usage](#Usage)**
- **[Examples](#Examples)**
- **[License](#License)**

## Usage

Refer to the **[Usage](#usage)** section for detailed information on how to use the script.

## Examples

Refer to the **[Examples](#examples)** section, for example, usages of the script.

## Requirements

The script requires the following commands to be available in the system:

(`date`, `git`, `ls`, `mkdir`, `neomutt`, `pwd`, `ssh`, `tee`, `uname`, `whoami`)

Make sure these commands are installed and accessible in your system before running the script.

## Installation

1. Clone the repository:

  ```bash
git clone https://github.com/Alexoat76/autoscripts.git
```

2. Change to the script directory:

  ```bash
cd autoscripts
```

3. Make the script executable:

  ```bash
chmod +x gitstartpro.sh
```

4. Run the script with the desired options.

## Usage

The script can be executed with the following command:

```bash
./gitstartpro.sh [OPTIONS]
```
### Options:
```bash
  -d, --dir-name: Specify the name of the directory to create (default: 'my_project').
  -h, --help: Show the help message and exit.
  -r, --recipients: Specify email recipients for notification.
  -u, --github-username: Specify the GitHub username.
  -v, --version: Display version information.
  -g, --generate-report: Generate a complete report for script actions.
```
## License

This project is licensed under the MIT License. See the LICENSE file for details.

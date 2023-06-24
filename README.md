# Autoscripts


## `Gitstartpro`

*`Gitstartpro`* is a bash or zsh script that automates the process of creating a Git repository. It creates a directory, adds a README.md file, initializes a Git repository, and performs Git commands (`add`, `commit`, and `push`) to upload the repository to GitHub. It also supports sending email notifications and generating a report of the script actions.

The script provides various options to customize the repository creation process. You can specify the directory name, GitHub username, and email recipients for notifications (*`optional`*), and generate a report to capture the script's actions (*`optional`*).

## Features
- Interactive command-line interface for a user-friendly experience.
- Automatic creation of a directory with a customizable name.
- Generation of a README.md file in the repository.
- Git initialization, committing the initial changes, and pushing to GitHub.
- Report file generation with system and execution details.
- Option to send the report file via email with **[neomutt](https://seniormars.github.io/posts/neomutt/)**.

## Table of Contents
- **[Requirements](#Requirements)**
- **[Installation](#Installation)**
- **[Usage](#Usage)**
- **[Examples](#Examples)**
- **[License](#License)**

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

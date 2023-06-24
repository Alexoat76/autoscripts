# Autoscripts


## `Gitstartpro`

*`Gitstartpro`* is a powerful bash script that automates the process of creating a Git repository on GitHub. It provides a seamless workflow by handling the setup of a directory, the creation of a *`README.md`* file, and the execution of Git commands for repository initialization and upload. Additionally, it generates a detailed report file (`optional`) with essential information about the repository creation process. Optionally, the script can send the report file via email recipients for notifications.

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

```bash
./gitstartpro.sh [OPTIONS]
```

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

## Examples

1. Error for usage 
```bash
./gitstartpro.sh
       Error: The -u or --github-username option is required. 
```

2. Create a Git repository named 'my_project' for the GitHub user 'github-username':
```bash
./gitstartpro.sh -d my_project -u github-username
```
The script will ask in the next prompt again for the recipient to send the report message. If this has not been entered in the initial execution. Press enter to continue. 

3. Create a Git repository named 'my_project' for the GitHub user 'github-username' and send mail for the recipient(s) specified in this prompt, also creates a report (*`optional`*).

```bash
./gitstartpro.sh -d my_project -u github-username -r user1@example.com -g
```
same as above

```bash
./gitstartpro.sh --dir-name my_project --github-username github-username --recipients user1@example.com --generate-report
```


## License

This project is licensed under the MIT License. See the LICENSE file for details.

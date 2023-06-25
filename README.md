<p align="center">
<img src="https://img.shields.io/badge/LINUX-darkgreen.svg"/>
<img src="https://img.shields.io/badge/Git-orange.svg"/> 
<img src="https://img.shields.io/badge/Bash-ligthgreen.svg"/>
<img src="https://img.shields.io/badge/Zsh-blue.svg"/>
<img src="https://img.shields.io/badge/Vim-green.svg"/>
<img src="https://img.shields.io/badge/Markdown-black.svg"/><br>
</p>

---

# Autoscripts


## `Gitstartpro`

***[Gitstartpro](./gitstartpro.sh)*** is a powerful bash script that automates the process of creating a `Git` repository on **[GitHub](https://github.com/)**. It provides a seamless workflow by handling the setup of a directory, the creation of a *`README.md`* file, and the execution of Git commands for repository initialization and upload. Additionally, it generates a detailed report file (`optional`) with essential information about the repository creation process. Optionally, the script can send the report file via email recipients for notifications.

## Features
- Interactive command-line interface for a user-friendly experience.
- Automatic creation of a directory with a customizable name.
- Generation of a README.md file in the repository.
- Git initialization, committing the initial changes, and pushing to GitHub.
- Report file generation with system and execution details.
- Option to send the report file via email with **[neomutt](https://seniormars.github.io/posts/neomutt/)**.

## Getting Started :running:	
<div style="text-align: justify">
  
## Table of Contents
- **[Requirements](#Requirements)**
- **[Installation](#Installation)**
- **[Usage](#Usage)**
- **[Examples](#Examples)**
- **[License](#License)**
- **[Credits](#Credits)**

## Requirements

The script requires the following commands to be available in the system:

(`date`, `git`, `ls`, `mkdir`, `neomutt`, `pwd`, `ssh`, `tee`, `uname`, `whoami`)

Make sure these commands are installed and accessible in your system before running the script.

***NOTE:*** 
```javascript
This script is designed to run in Zsh, but it is also compatible with Bash. However, it is recommended to run the script
in Zsh for optimal performance and expected behavior.
```

## Installation :computer:

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

+ [x] 1\. Error for usage 
```bash
./gitstartpro.sh
       Error: The -u or --github-username option is required. 
```

+ [x] 2\. Create a Git repository named `my_project` for the GitHub user `github-username`:
```bash
./gitstartpro.sh -d my_project -u github-username
```
The script will ask in the next prompt again for the recipient to send the report message. If this has not been entered in the initial execution. Press *`enter`* to continue.

+ [x] 3\. Create a Git repository named `my_project` for the GitHub user `github-username` and send mail for the recipient(s) specified in this prompt, also generate a complete report for script actions: (`optional`).

```bash
./gitstartpro.sh -d my_project -u github-username -r user1@example.com -g
```
same as above

```bash
./gitstartpro.sh --dir-name my_project --github-username github-username --recipients user1@example.com --generate-report
```

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---
## Credits

### Author(s):blue_book:

Work is owned and maintained by:

Alex O. Arevalo T. 

alexoat76@gmail.com

[![M](https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Octicons-mark-github.svg/25px-Octicons-mark-github.svg.png)](https://github.com/Alexoat76)
[![M](https://upload.wikimedia.org/wikipedia/commons/thumb/c/ca/LinkedIn_logo_initials.png/25px-LinkedIn_logo_initials.png)](https://www.linkedin.com/in/Alexoat76/)

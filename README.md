<p align="center">
<img src="https://img.shields.io/badge/LINUX-darkgreen.svg"/>
<img src="https://img.shields.io/badge/Git-orange.svg"/> 
<img src="https://img.shields.io/badge/Bash-ligthgreen.svg"/>
<a href="https://ohmyz.sh/"><img src="https://img.shields.io/badge/Zsh-blue.svg"/>
<img src="https://img.shields.io/badge/Vim-green.svg"/>
<img src="https://img.shields.io/badge/Markdown-black.svg"/><br>
<a href="https://github.com/alexoat76/autoscripts/blob/main/LICENSE"><img src="https://img.shields.io/github/license/alexoat76/autoscripts?color=2b9348" alt="License Badge"/></a>
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

## Requirements :memo:

The script requires the following commands to be available in the system:

(`date`, `git`, `ls`, `mkdir`, `neomutt`, `pwd`, `ssh`, `tee`, `uname`, `whoami`)

Make sure these commands are installed and accessible in your system before running the script.

---
**![Static Badge](https://img.shields.io/badge/NOTE:-8A2BE2)**

*This script is designed to run in **[Zsh](https://ohmyz.sh/)**, but it is also compatible with Bash. However, it is recommended to run the script
in Zsh for optimal performance and expected behavior*.

---

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

## Usage :toolbox:

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

## Examples :eyes:

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

## License :page_with_curl:

This project is licensed under the MIT License. See the **[LICENSE](./LICENSE)** file for details.

---
## Credits :dart:

### Author(s):blue_book:

Work is owned and maintained by:

Alex Arévalo | alexoat76@gmail.com

<a href="https://www.gmail.com" >
<img src="https://github.com/Alexoat76/Alexoat76/blob/main/assets/icons8-gmail.svg" alt="gmail" width="35" height="60">
</a>
&nbsp;&nbsp;
<a href="https://www.linkedin.com/in/Alexoat76" >
<img src="https://github.com/Alexoat76/Alexoat76/blob/main/assets/icons8-linkedin.svg" alt="linkedin" width="40" height="60">
</a>
&nbsp;&nbsp;
<a href="https://twitter.com/Alexoat76" >
<img src="https://github.com/Alexoat76/Alexoat76/blob/main/assets/icons8-twitter.svg" alt="twitter" width="40" height="50">
</a>


<p align="center">
<img src="https://img.shields.io/badge/LINUX-darkgreen.svg"/>
<img src="https://img.shields.io/badge/Git-orange.svg"/> 
<img src="https://img.shields.io/badge/Bash-ligthgreen.svg"/>
<a href="https://ohmyz.sh/"><img src="https://img.shields.io/badge/Zsh-blue.svg"/>
<a href="https://learn.microsoft.com/en-us/powershell/"><img src="https://img.shields.io/badge/PowerShell-darkblue.svg"/>
<img src="https://img.shields.io/badge/Vim-green.svg"/>
<img src="https://img.shields.io/badge/Markdown-black.svg"/><br>
<a href="https://github.com/alexoat76/autoscripts/blob/main/LICENSE"><img src="https://img.shields.io/github/license/alexoat76/autoscripts?color=2b9348" alt="License Badge"/></a>
</p>

---

# Autoscripts:

<details  style="user-select: none;">
<summary>
  
## `Gitstartpro`

***[Gitstartpro](./gitstartpro.sh)*** is a powerful `Bash` **script** that automates the process of creating a `Git` repository on **[GitHub](https://github.com/)**. It provides a seamless workflow by handling the setup of a directory, the creation of a *`README.md`* file, and the execution of Git commands for repository initialization and upload. Additionally, it generates a detailed report file (`optional`) with essential information about the repository creation process. Optionally, the script can send the report file via email recipients for notifications.

</summary>

<p align='center'>
  
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

---
**![Static Badge](https://img.shields.io/badge/NOTE:-8A2BE2)**

*This script is designed to run in **[Zsh](https://ohmyz.sh/)**, but it is also compatible with Bash. However, it is recommended to run the script
in Zsh for optimal performance and expected behavior*.

---

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
</p>
</details>

<p align='center'>
<details  style="user-select: none;">
<summary>

## `Gstpropwsh`

***[Gstpropwsh](./gstpropwsh.ps1)*** is a `PowerShell` **script** automates the process of creating a `Git` repository and uploading it to **[GitHub](https://github.com/)**. It performs various Git commands to initialize the repository, `add` files, `commit` changes, and `push` to `GitHub`. Additionally, it supports generating a report of the actions performed.

</summary>

<p align='center'>
  
## Features
- Automated Git repository creation and setup.
- Seamless integration with GitHub for easy repository upload.
- Custom directory name for organizing projects.
- Automatic `README.md` file generation.
- Git initialization, committing the initial changes, and pushing to GitHub.
- Optional generation of detailed action report.

These features make the ***[Gstpropwsh](./gstpropwsh.sh)*** script a powerful tool for automating repository creation, streamlining Git operations, and enhancing collaboration with GitHub.

## Getting Started :running:	
<div style="text-align: justify">
  
## Table of Contents
- **[Requirements](#Requirements-1)**
- **[Installation](#Installation-1)**
- **[Usage](#Usage-1)**
- **[Examples](#Examples-1)**
- **[License](#License)**
- **[Credits](#Credits)**

## Requirements

The script requires the following commands to be available in the system:

- `PowerShell` *version 7.3* or higher.
- `Git` installed and configured on your system.
- Access to a `GitHub` account.

---
**![Static Badge](https://img.shields.io/badge/NOTE:-8A2BE2)**

*This script is designed to run in  **[PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3)**, but it is also compatible with other shells, such as `Command Prompt` or `Git Bash`.
However, it is recommended to run the script in PowerShell for optimal performance and expected behavior*.

---

## Installation

1. PowerShell Version:

Make sure you have PowerShell installed on your system.

  ```bash
Get-Host
```

2. Clone the repository:

  ```bash
git clone https://github.com/Alexoat76/autoscripts.git
```

3. Change to the script directory:

  ```bash
cd autoscripts
```

4. Run the script with the desired options.

```bash
.\gstpropwsh.ps1 -u <GitHubUsername> [-d <DirectoryName>] [-g] [-h] [-v]
```

## Usage

The script can be executed with the following command:

```bash
.\gstpropwsh.ps1 -u <GitHubUsername> [-d <DirectoryName>] [-g] [-h] [-v]
```

Replace <GitHubUsername> with your GitHub username. You can provide additional optional parameters as needed:

  ### Options:
  ```bash
    -d, --dir-name: Specify the name of the directory to create (Default:'MyDirectory').
    -g, --generate-report: Generate a complete report for script actions.
    -h, --help: Show the help message and exit.
    -u, --github-username: Specify the GitHub username.
    -v, --version:  Display the current script version.
  ```

## Examples

+ [x] 1\. Error for usage 
```bash
./gstpropwsh.ps1
       Error: The -u or --github-username option is required. 
```

+ [x] 2\. Create a Git repository named `MyDirectory` for the GitHub user `githubUsername`:
```bash
./gstpropwsh.ps1 -d MyDirectory -u githubUsername
```
The script will ask in the next prompt again for the recipient to send the report message. If this has not been entered in the initial execution. Press *`enter`* to continue.

+ [x] 3\. Create a Git repository named `MyDirectory` for the GitHub user `githubUsername` and also generate a complete report for script actions: (`optional`).

```bash
./gstpropwsh.ps1 -u githubUsername -d MyDirectory -g
```
same as above

```bash
./gstpropwsh.ps1 --githubUsername githubUsername --directoryName MyDirectory --generateReport
```
</p>
</details>

---

## License

This project is licensed under the **GNU** `General Public License`. See the **[LICENSE](./LICENSE)** file for details.

---
## Credits

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


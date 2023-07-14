<#
#################################################################

.NAME
    gstpropwsh.ps1

.SYNOPSIS
    Script to automate repository creation and upload to GitHub.

.DESCRIPTION
    This script automates the process of creating a Git Repository, It creates a directory, adds a README file,
    initializes a Git repository, and performs Git commands (`add`,`commit`, and `push`) to upload the repository to GitHub. 
    It also supports generating a report of the script actions.

.SYNTAX
    General:
    .\gstpropwsh.ps1 -u <GitHubUsername> [-d <DirectoryName>] [-g] [-h] [-v]

    Example for Displays the usage information:
    .\gstpropwsh.ps1 -h or -help

    Example for Creates a new project repository:
    .\gstpropwsh.ps1 -u YourGitHubUsername -d <Default: MyDirectory> -g
    .\gstpropwsh.ps1 -githubUsername YourGitHubUsername -directoryName <Default: MyDirectory> -generateReport

    Creates a new project / repository named MyProject, sets the GitHub username to YourGitHubUsername,
    and generates a report of the actions performed.

    Example of Bad Usage:
    .\gstpropwsh.ps1
        Error: The -u or --github-username option is required
        Usage: gstpropwsh.ps1 -u <GitHubUsername> [-d <DirectoryName>] [-g] [-h] [-v]

        Options:
          -d, --directoryName    Custom directory name. (Default: MyDirectory)
          -g, --generateReport   Generate a report of the actions performed.
          -h, --help             Display this usage information.
          -u, --githubUsername   Your GitHub username.
          -v, --version          Display the current script version.

.PARAMETER directoryName
    Custom directory name. Default: MyDirectory.

.PARAMETER generateReport
    Generate a report of the actions performed.

.PARAMETER help
    Display the usage information.

.PARAMETER githubUsername
    Your GitHub username.

.PARAMETER version
    Display the current script version.

.NOTES
    Author:   Alex O. Arévalo T.
    Version:  1.7
    Date:     2023-07-06
    License:  GNU General Public License

=======================

.IMPORTANT
    This script is designed to run in PowerShell, but it is also
    compatible with other shells, such as Command Prompt or Git Bash.
    However, it is recommended to run the script in PowerShell for optimal
    performance and expected behavior.
#>

#################################################################

# DEBUG OPTION:
# Uncomment to check your syntax, without execution.
# Invoke-ScriptAnalyzer -Path "gstpropwsh.ps1" -SyntaxCheckMode

# Uncomment to enable debugging in this script
# Set-PSDebug -Trace $true

# Uncomment to enable strict mode to enforce stricter rules for variable declaration and usage.
# Set-StrictMode -Version 3.0

#################################################################
# SETUP:
#################################################################

# Process the valid options
param (
    [Parameter(Mandatory=$false, HelpMessage="Your GitHub username.")]
    [Alias("u")]
    [string]$githubUsername,

    [Parameter(HelpMessage="Custom directory name.")]
    [Alias("d")]
    [string]$directoryName = "MyDirectory",

    [Parameter(HelpMessage="Generate a report of the actions performed.")]
    [Alias("g")]
    [switch]$generateReport,

    [Parameter(HelpMessage="Display the usage information.")]
    [Alias("h")]
    [switch]$help,

    [Parameter(HelpMessage="Display the current script version.")]
    [Alias("v")]
    [switch]$version
)

#################################################################
# FUNCTION DEFINITIONS:
#################################################################

# Function to show the usage information
function Show-Usage {
    Write-Host "Usage: $($MyInvocation.MyCommand.Name) -u <GitHubUsername> [-d <DirectoryName>] [-g] [-h] [-v]"
    Write-Host
    Write-Host "Options:"
    Write-Host "  -d, --directoryName    Custom directory name. (Default: MyDirectory)"
    Write-Host "  -g, --generateReport   Generate a report of the actions performed."
    Write-Host "  -h, --help             Display this usage information."
    Write-Host "  -u, --githubUsername   Your GitHub username."
    Write-Host "  -v, --version          Display the current script version."
    Write-Host
}

# Check if the help option is provided
if ($help -or $MyInvocation.Line.Contains("--help")) {
    Show-Usage
    exit 0
}

# Check if the version option is provided
if ($version -or $MyInvocation.Line.Contains("--version")) {
    Write-Host "Version: 1.7"
    exit 0
}

# Check if no flags or parameters are provided
if (-not $PSBoundParameters) {
    Write-Host "Invalid option. Please check the provided flags." -ForegroundColor Red
    Show-Usage
    exit 1
}

# Check if the GitHub username is provided
if ([string]::IsNullOrWhiteSpace($githubUsername)) {
    Write-Host "Error: The -u or --githubUsername option is required" -ForegroundColor Red
    Show-Usage
    exit 1
}

# Function to create a directory
function Create-Directory {
    param (
        [string]$dirName
    )

    if (-not (Test-Path $dirName -PathType Container)) {
        Write-Host "`n >>> Creating directory: $dirName" -ForegroundColor Green
        Start-Sleep -Seconds 1
        New-Item -ItemType Directory -Path $dirName | Out-Null
        Write-Host "`n Directory '$dirName' successfully created!" -ForegroundColor Yellow
    }
    else {
        Write-Host "`n Directory '$dirName' already exists... Exiting.`n" -ForegroundColor Red
        exit 1
    }
}

# Function to create README.md file
function Create-ReadmeFile {
    param (
        [string]$dirName
    )

    $readmePath = Join-Path -Path $dirName -ChildPath "README.md"

    if (-not (Test-Path $readmePath -PathType Leaf)) {
        Write-Host "`n >>> Creating README.md" -ForegroundColor Green
        Start-Sleep -Seconds 1
        Set-Content -Path $readmePath -Value "# README"
        Write-Host "`n README.md successfully created!`n" -ForegroundColor Yellow
    }
    else {
        Write-Host "`n README.md already exists... Exiting.`n" -ForegroundColor Red
        exit 1
    }
}

# Function to initialize Git repository
function Initialize-GitRepository {
    Write-Host " >>> Changing directory to $directoryName" -ForegroundColor Green
    Set-Location -Path $directoryName
    Write-Host "`n >>> Initializing Git repository `n" -ForegroundColor Green
    Start-Sleep -Seconds 1
    #Start-Process ssh-agent # Use with ssh connection
    #Add-SshKey -Path ~/.ssh/github_key # Use with ssh connection

    git init

    Write-Host "`n Git repository initialized!`n" -ForegroundColor Yellow
}

# Function to add files to Git
function Add-FilesToGit {
    Write-Host " >>> Adding files to Git" -ForegroundColor Green
    Start-Sleep -Seconds 1

    git add .

    Write-Host "`n Files added to Git!`n" -ForegroundColor Yellow
}

# Function to commit changes in Git
function Commit-ChangesInGit {
    Write-Host " >>> Committing changes in Git" -ForegroundColor Green
    Start-Sleep -Seconds 1

    #git commit -m "First commit :heavy_check_mark:"
    $commitOutput= git commit -m "First commit :heavy_check_mark:" 2>&1
    git branch -M main

    Write-Host "`n Changes committed in Git!`n" -ForegroundColor Yellow

    return $commitOutput
}

# Function to push Git repository to GitHub
function Push-ToGitHub {
    Write-Host " >>> Pushing to GitHub" -ForegroundColor Green
    Start-Sleep -Seconds 1

    Write-Host "`n >>> Constructing repository URL" -ForegroundColor Green
    $repositoryUrl = "https://github.com/$githubUsername/$directoryName"
    #repositoryUrl="git@github.com:$github_username/$dir_name.git" # Use with ssh connection
    Write-Host "`n Repository URL: $repositoryUrl `n" -ForegroundColor Yellow

    # Check if the remote repository already exists
    $remoteExists = git remote show origin -n | Select-String -Pattern "Fetch URL: $repositoryUrl"
    if ($remoteExists) {
        # Update the remote URL
        git remote set-url origin $repositoryUrl
        Write-Host "`n Remote repository URL updated.`n" -ForegroundColor Yellow
    }
    else {
        # Add the remote repository
        git remote add origin $repositoryUrl
        Write-Host " Remote repository added.`n" -ForegroundColor Yellow
    }

    # Push the repository to GitHub
    git push -u origin main
    Write-Host ""

    # Capture the output of git status command
    $statusOutput = git status

    Write-Host " >>> Repository successfully uploaded to GitHub! `n" -ForegroundColor Green

    return $statusOutput
}

# Function to generate a report
function Generate-Report {
    param (
        [string]$dirName,
        [string]$username,
        [string]$currentDir,
        [string]$commitOutput,
        [string]$statusOutput
    )

    Write-Host " >>> Generating report" -ForegroundColor Yellow
    Start-Sleep -Seconds 1

    $date = Get-Date -Format "yyyyMMdd_HHmmss"
    $reportFileName = "gstpropwsh_report_$date.txt"
    $reportPath = Join-Path -Path $currentDir -ChildPath $reportFileName

    $content = @"
gstpropwsh Report
=============================
System: $([Environment]::OSVersion.VersionString)
User: $env:USERNAME
Script name: gstpropwsh.ps1
Version script: v0.1.7

1. Git Repository Information
=============================
Date: $(Get-Date)
Location: $currentDir
GitHub Username: $githubUsername"
Directory name: $dirName

Directory Listing:
$((Get-ChildItem -Path $currentDir | Select-Object -ExpandProperty Name) -join "`r`n")


2. Execution Status
=============================
$commitOutput

$statusOutput

3. Script Actions
=============================
Creating directory: $dirName
Creating README.md
Initializing Git repository
Adding README.md file to Git
Committing changes in Git
Pushing to GitHub
* Creating report file if required

"@
    # Save the generated report content to a file
    $content | Out-File -FilePath $reportPath -Encoding utf8

    Write-Host "`n >>> Report generated: $reportPath `n" -ForegroundColor Green
}

# Execute the script with the provided options
Write-Host "Executing script with the following options:"
Write-Host "GitHub Username: $githubUsername"
Write-Host "Directory Name: $directoryName"
Write-Host "Generate Report: $generateReport"
Write-Host "Help: $help"

# Enable debug messages
#$DebugPreference = 'Continue'

# Debug messages in your script
Write-Debug "Debug message 1"
Write-Debug "Debug message 2"

# Create the directory
Create-Directory -dirName $directoryName

# Create README.md file in the directory
Create-ReadmeFile -dirName $directoryName

# Get the current directory
$currentDir = Convert-Path -Path ".\" -ErrorAction Stop

# Initialize Git repository
Initialize-GitRepository

# Add files to Git
Add-FilesToGit

# Commit changes in Git
$commitOutput = Commit-ChangesInGit

# Push Git repository to GitHub
$statusOutput = Push-ToGitHub

if ($generateReport) {
    # Generate the report
    Generate-Report -dirName $directoryName -username $githubUsername -currentDir $currentDir -commitOutput $commitOutput -statusOutput $statusOutput
}


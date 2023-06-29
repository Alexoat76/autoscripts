param (
    [string]$directoryName = "MyDirectory"
)

function create_directory {
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

function create_readme_file {
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

function Initialize-GitRepository {
    Write-Host "`n >>> Initializing Git repository" -ForegroundColor Green
    Start-Sleep -Seconds 1
    # Start ssh-agent and add ssh key (if using ssh connection)
    # Start-Process ssh-agent -NoNewWindow -Wait
    # ssh-add ~/.ssh/github_key

    git init
    Write-Host "`n Git repository initialized!`n" -ForegroundColor Yellow
}

function Add-FilesToGit {
    Write-Host "`n >>> Adding files to Git" -ForegroundColor Green
    Start-Sleep -Seconds 1
    git add .
    Write-Host "`n Files added to Git!`n" -ForegroundColor Yellow
}

function Commit-ChangesInGit {
    Write-Host "`n >>> Committing changes in Git" -ForegroundColor Green
    Start-Sleep -Seconds 1
    git commit -m "First commit :heavy_check_mark:"
    git branch -M main
    Write-Host "`n Changes committed in Git!`n" -ForegroundColor Yellow
}

function Push-ToGitHub {
    Write-Host "`n >>> Pushing to GitHub" -ForegroundColor Green
    Start-Sleep -Seconds 1

    Write-Host "`n >>> Constructing repository URL" -ForegroundColor Green
    $repositoryUrl = "https://github.com/$github_username/$dir_name.git"
    # $repositoryUrl = "git@github.com:$github_username/$dir_name.git" # Use with ssh connection
    Write-Host "`n Repository URL: $repositoryUrl `n" -ForegroundColor Yellow

    # Push the repository to GitHub
    git remote add origin $repositoryUrl
    git push -u origin main
    Write-Host ""

    # Capture the output of git status command
    $statusOutput = git status

    Write-Host "`n >>> Repository successfully uploaded to GitHub! `n" -ForegroundColor Green
}

if (-not $github_username) {
    Write-Host "Please enter your GitHub username:"
    $github_username = Read-Host
}

# Create the directory
create_directory -dirName $directoryName

# Create README.md file in the directory
create_readme_file -dirName $directoryName

Initialize-GitRepository
Add-FilesToGit
Commit-ChangesInGit
Push-ToGitHub

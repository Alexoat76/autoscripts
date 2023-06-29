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

# Create the directory
create_directory -dirName $directoryName

# Create README.md file in the directory
create_readme_file -dirName $directoryName


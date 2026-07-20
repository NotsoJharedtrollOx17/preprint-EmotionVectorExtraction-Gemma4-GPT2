param(
    [Parameter(Mandatory)]
    [string]$RepoUrl
)

Write-Host ""
Write-Host "== Setting up Git repository ==" -ForegroundColor Cyan

# Ensure we're inside a Git repository
if (-not (Test-Path ".git")) {
    git init
}

# Display current remotes
Write-Host ""
Write-Host "Current remotes:" -ForegroundColor Yellow
git remote -v

# Configure the remote
if ((git remote) -contains "origin") {
    Write-Host ""
    Write-Host "Updating 'origin' remote..." -ForegroundColor Cyan
    git remote set-url origin $RepoUrl
}
else {
    Write-Host ""
    Write-Host "Adding 'origin' remote..." -ForegroundColor Cyan
    git remote add origin $RepoUrl
}

# Rename the default branch
git branch -M main

# Display updated remotes
Write-Host ""
Write-Host "Updated remotes:" -ForegroundColor Green
git remote -v

# Push current branch
Write-Host ""
Write-Host "Pushing to remote..." -ForegroundColor Cyan
git push -u origin main

Write-Host ""
Write-Host "Repository successfully configured!" -ForegroundColor Green
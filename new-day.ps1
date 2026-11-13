# Creates today's entry at days\YYYY\MM\YYYY-MM-DD.md from the template.
Set-Location $PSScriptRoot
$today = Get-Date -Format "yyyy-MM-dd"
$dir   = "days\$(Get-Date -Format yyyy)\$(Get-Date -Format MM)"
$file  = "$dir\$today.md"
New-Item -ItemType Directory -Force -Path $dir | Out-Null
if (Test-Path $file) {
  Write-Host "Already exists: $file"
} else {
  (Get-Content template\day.md -Raw) -replace '\{\{DATE\}\}', $today | Set-Content $file -Encoding UTF8
  Write-Host "Created: $file"
}

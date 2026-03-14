# Count tokens for a prompt using the CLI
# Run from project root: .\scripts\examples\count_prompt.ps1 "Hello, world!" gpt-4

param(
    [string]$Prompt = "Hello, world!",
    [string]$Model = "gpt-4"
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Join-Path $scriptDir "..\..")

Write-Host "Counting tokens for: `"$Prompt`""
Write-Host "Model: $Model"
Write-Host "---"
python -m scripts.cli -m $Model $Prompt

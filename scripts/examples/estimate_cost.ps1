# Estimate API cost for a prompt
# Run from project root: .\scripts\examples\estimate_cost.ps1 "Your text" gpt-4
# Or with file: .\scripts\examples\estimate_cost.ps1 -InputPath input.txt -Model gpt-4

param(
    [string]$InputText = "Your prompt text here",
    [string]$InputPath = "",
    [string]$Model = "gpt-4"
)

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location (Join-Path $scriptDir "..\..")

if ($InputPath -and (Test-Path $InputPath)) {
    Write-Host "Estimating cost for file: $InputPath"
    python -m scripts.cli -f $InputPath -m $Model -c
} else {
    Write-Host "Estimating cost for text: `"$InputText`""
    python -m scripts.cli -m $Model -c $InputText
}

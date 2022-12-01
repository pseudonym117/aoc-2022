param(
    [Parameter(Mandatory)]
    [string]$Script,
    [Parameter(Mandatory)]
    [string]$InputFile,
    [Parameter()]
    [switch]$NoBuild
)

if (-not($NoBuild)) {
    docker build ./runners/golfscript -t golfscript:alpha
}

$AbsoluteScript = Resolve-Path -Path $Script
$MountDir = Split-Path -Path $AbsoluteScript 
$FileName = Split-Path -Path $AbsoluteScript -Leaf

Write-Output ""
Write-Output "Running $Script..."
Write-Output ""
Write-Output ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

Get-Content -Raw -Path $InputFile | docker run `
    -i `
    --rm `
    --name golf `
    --mount type=bind,source="$($MountDir)",target=/src `
    golfscript:alpha `
    "/src/$($FileName)"

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
$ScriptMountDir = Split-Path -Path $AbsoluteScript 
$ScriptFileName = Split-Path -Path $AbsoluteScript -Leaf

$AbsoluteInput = Resolve-Path -Path $InputFile
$InputMountDir = Split-Path -Path $AbsoluteInput
$InputFileName = Split-Path -Path $AbsoluteInput -Leaf

Write-Output ""
Write-Output "Running $Script..."
Write-Output ""
Write-Output ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

docker run `
    -i `
    --rm `
    --name golf `
    --mount type=bind,source="$($ScriptMountDir)",target=/src `
    --mount type=bind,source="$($InputMountDir)",target=/input `
    golfscript:alpha `
    "/src/$($ScriptFileName)" `
    "/input/$($InputFileName)"

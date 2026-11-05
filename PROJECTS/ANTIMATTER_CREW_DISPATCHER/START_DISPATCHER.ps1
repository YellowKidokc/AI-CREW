param(
    [switch]$MattermostWatch
)

$ErrorActionPreference = "Stop"
$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ConfigPath = Join-Path $ProjectDir "config.json"
$ExamplePath = Join-Path $ProjectDir "config.example.json"
$ScriptPath = Join-Path $ProjectDir "prototype\crew_dispatcher.py"

if (-not (Test-Path -LiteralPath $ConfigPath)) {
    Copy-Item -LiteralPath $ExamplePath -Destination $ConfigPath
    Write-Host "Created local config.json from the safe example."
}

if ($MattermostWatch) {
    python $ScriptPath --config $ConfigPath mattermost-watch
} else {
    python $ScriptPath --config $ConfigPath serve
}


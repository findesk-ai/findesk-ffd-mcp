$ErrorActionPreference = "Stop"

$BaseUrl = if ($env:FFD_AGENT_KIT_BASE_URL) { $env:FFD_AGENT_KIT_BASE_URL } else { "https://ffd.findesk.cn/downloads/ffd-agent-kit" }
$RegisterUrl = if ($env:FFD_REGISTER_URL) { $env:FFD_REGISTER_URL } else { "https://www.findesk.cn/register" }
$ConfigPath = Join-Path $HOME ".ffd\mcp-config.json"

Write-Host "FFD MCP installer"
Write-Host "Official bundle: $BaseUrl"

if (-not $env:FFD_API_KEY -and (Test-Path $ConfigPath)) {
  try {
    $Existing = Get-Content $ConfigPath -Raw | ConvertFrom-Json
    $ExistingKey = $Existing.mcpServers.ffd.env.FFD_API_KEY
    if ($ExistingKey) {
      $env:FFD_API_KEY = $ExistingKey
      Write-Host "Detected an existing local FFD API Key. It will be reused."
    }
  } catch {
  }
}

if (-not $env:FFD_API_KEY) {
  Write-Host ""
  Write-Host "No local FFD API Key detected."
  Write-Host "New users can register and receive the current public trial:"
  Write-Host "- 3-day trial"
  Write-Host "- 50,000 data points"
  Write-Host "- 5 research-report downloads"
  Write-Host "- 3-day global-news access"
  Write-Host ""
  Write-Host "Register here: $RegisterUrl"
  Write-Host "Enter the API Key only in this local terminal prompt. Do not paste it into an AI chat."
}

$TmpInstall = Join-Path ([System.IO.Path]::GetTempPath()) ("ffd-install-" + [System.Guid]::NewGuid().ToString() + ".ps1")
Invoke-WebRequest -Uri "$BaseUrl/install.ps1" -OutFile $TmpInstall
& powershell -ExecutionPolicy Bypass -File $TmpInstall
Remove-Item -Force $TmpInstall

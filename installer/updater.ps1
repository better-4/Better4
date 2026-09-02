# Better4 self-updater. Pretty slopped.

[CmdletBinding()]
param(
    [string]$CurrentVersion,
    [int]$CallerPid = 0,

    [switch]$Phase2,
    [int]$WaitPid = 0,
    [string]$ExtractedDir = ""
)

$EXIT_CONTINUE = 0
$EXIT_UPDATING = 2

$InstallDir = $PSScriptRoot
$IniPath = Join-Path $InstallDir "better4.ini"

Add-Type -Namespace Better4 -Name IniFile -MemberDefinition @'
[DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
public static extern int GetPrivateProfileString(string lpAppName, string lpKeyName, string lpDefault, System.Text.StringBuilder lpReturnedString, int nSize, string lpFileName);

[DllImport("kernel32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
public static extern bool WritePrivateProfileString(string lpAppName, string lpKeyName, string lpString, string lpFileName);
'@

function Get-IniValue {
    param([string]$Path, [string]$Section, [string]$Key, [string]$Default = "")

    $buffer = New-Object System.Text.StringBuilder 256
    [Better4.IniFile]::GetPrivateProfileString($Section, $Key, $Default, $buffer, $buffer.Capacity, $Path) | Out-Null
    return $buffer.ToString()
}

function Set-IniValue {
    param([string]$Path, [string]$Section, [string]$Key, [string]$Value)
    [Better4.IniFile]::WritePrivateProfileString($Section, $Key, $Value, $Path) | Out-Null
}

function Initialize-Forms {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    [System.Windows.Forms.Application]::EnableVisualStyles()
    [System.Windows.Forms.Application]::SetCompatibleTextRenderingDefault($false)
}

function Show-CheckingWindow {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Better4"
    $form.Width = 300
    $form.Height = 100
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = "FixedDialog"
    $form.ControlBox = $false
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.TopMost = $true

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Checking for updates..."
    $label.Dock = "Fill"
    $label.TextAlign = "MiddleCenter"
    $form.Controls.Add($label)

    $form.Show()
    $form.Activate()
    [System.Windows.Forms.Application]::DoEvents()

    return $form
}

function Show-DownloadingWindow {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Better4"
    $form.Width = 320
    $form.Height = 110
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = "FixedDialog"
    $form.ControlBox = $false
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.TopMost = $true

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "Downloading update..."
    $label.Left = 15
    $label.Top = 15
    $label.Width = 280
    $label.Height = 20
    $form.Controls.Add($label)

    # A plain two-stage bar (0% while downloading, jumped to 50% once
    # extraction starts) rather than a real percentage - Invoke-WebRequest
    # doesn't expose byte-level progress without switching to a lower-level
    # download API, and a smooth/animated bar isn't worth it here.
    $progressBar = New-Object System.Windows.Forms.ProgressBar
    $progressBar.Minimum = 0
    $progressBar.Maximum = 100
    $progressBar.Value = 0
    $progressBar.Left = 15
    $progressBar.Top = 45
    $progressBar.Width = 280
    $progressBar.Height = 20
    $form.Controls.Add($progressBar)

    $form.Show()
    $form.Activate()
    [System.Windows.Forms.Application]::DoEvents()

    return @($form, $label, $progressBar)
}

function Show-UpdateDialog {
    param([string]$Version, [string]$Changelog)

    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Better4 Update Available"
    $form.Width = 480
    $form.Height = 380
    $form.StartPosition = "CenterScreen"
    $form.FormBorderStyle = "FixedDialog"
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.TopMost = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Text = "A new version of Better4 is available! ($Version)"
    $label.Font = New-Object System.Drawing.Font($label.Font.FontFamily, 12, [System.Drawing.FontStyle]::Bold)
    $label.AutoSize = $false
    $label.Left = 15
    $label.Top = 15
    $label.Width = 440
    $label.Height = 35
    $form.Controls.Add($label)

    $normalizedChangelog = ($Changelog -replace "`r`n", "`n") -replace "`n", "`r`n"

    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Multiline = $true
    $textBox.ReadOnly = $true
    $textBox.ScrollBars = "Vertical"
    $textBox.Text = $normalizedChangelog
    $textBox.TabStop = $false
    $textBox.Left = 15
    $textBox.Top = 55
    $textBox.Width = 440
    $textBox.Height = 225
    $form.Controls.Add($textBox)

    $script:dialogResult = "Cancel"

    $installButton = New-Object System.Windows.Forms.Button
    $installButton.Text = "Install"
    $installButton.Left = 35
    $installButton.Top = 295
    $installButton.Width = 100
    $installButton.Add_Click({ $script:dialogResult = "Install"; $form.Close() })
    $form.Controls.Add($installButton)
    $form.AcceptButton = $installButton

    $skipButton = New-Object System.Windows.Forms.Button
    $skipButton.Text = "Skip This Version"
    $skipButton.Left = 145
    $skipButton.Top = 295
    $skipButton.Width = 140
    $skipButton.Add_Click({ $script:dialogResult = "Skip"; $form.Close() })
    $form.Controls.Add($skipButton)

    $dontAskButton = New-Object System.Windows.Forms.Button
    $dontAskButton.Text = "Don't Ask Again"
    $dontAskButton.Left = 295
    $dontAskButton.Top = 295
    $dontAskButton.Width = 140
    $dontAskButton.Add_Click({ $script:dialogResult = "DontAsk"; $form.Close() })
    $form.Controls.Add($dontAskButton)

    $form.Add_Shown({
        $form.Activate()
        $installButton.Focus() | Out-Null
    })
    $form.ShowDialog() | Out-Null

    return $script:dialogResult
}

function Wait-ForKeyAndExit {
    param([int]$Code)
    Read-Host "Press Enter to close"
    exit $Code
}

# ---------------------------------------------------------------------------
# Phase 2: detached, waits for the caller to exit, then finishes the install.
# ---------------------------------------------------------------------------
if ($Phase2) {
    if ($WaitPid -gt 0) {
        Write-Host "Waiting for Better4 (PID $WaitPid) to close..."
        Wait-Process -Id $WaitPid -Timeout 60 -ErrorAction SilentlyContinue
    }

    $skateExePath = Join-Path $InstallDir "Skate4.exe"
    $installBatPath = Join-Path $ExtractedDir "install.bat"
    $exePath = Join-Path $InstallDir "Better4.exe"

    if (-not (Test-Path $skateExePath)) {
        Write-Host "ERROR: Skate4.exe not found in '$InstallDir'." -ForegroundColor Red
        Wait-ForKeyAndExit 1
    }
    if (-not (Test-Path $installBatPath)) {
        Write-Host "ERROR: install.bat missing from the downloaded release." -ForegroundColor Red
        Wait-ForKeyAndExit 1
    }

    $installStartedUtc = [DateTime]::UtcNow

    Write-Host "Installing Better4 update to '$InstallDir'..."
    & $installBatPath $skateExePath 'SILENT'

    $exeExists = Test-Path $exePath
    $wasUpdated = $exeExists -and (Get-Item $exePath).LastWriteTimeUtc -ge $installStartedUtc

    if ($wasUpdated) {
        Write-Host "Update complete."
    } elseif ($exeExists) {
        Write-Host "'$InstallDir' may need administrator privileges - if install.bat opened an elevated window, Better4 will relaunch itself once that finishes." -ForegroundColor Yellow
    } else {
        Write-Host "ERROR: install.bat did not produce Better4.exe." -ForegroundColor Red
        Wait-ForKeyAndExit 1
    }

    exit 0
}

# ---------------------------------------------------------------------------
# Phase 1: check, prompt, download+extract, hand off to phase 2 if installing.
# ---------------------------------------------------------------------------

$checkEnabled = Get-IniValue -Path $IniPath -Section "Updater" -Key "CheckForUpdates" -Default "1"
if ($checkEnabled -eq "0") {
    exit $EXIT_CONTINUE
}

Initialize-Forms
$checkingForm = Show-CheckingWindow
try {
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $release = Invoke-RestMethod -Uri "https://api.github.com/repos/better-4/Better4/releases/latest" `
            -Headers @{ "User-Agent" = "better4-updater"; "Accept" = "application/vnd.github+json" } `
            -TimeoutSec 5
    } catch {
        # Fail open - a broken network must never block the game from starting.
        exit $EXIT_CONTINUE
    }

    $latestTag = $release.tag_name
    $changelog = $release.body
    if (-not $release.assets -or $release.assets.Count -eq 0) {
        exit $EXIT_CONTINUE
    }
    $zipUrl = $release.assets[0].browser_download_url

    try {
        $latestVersion = [version]$latestTag
        $currentVersionParsed = [version]$CurrentVersion
    } catch {
        exit $EXIT_CONTINUE
    }

    if ($latestVersion -le $currentVersionParsed) {
        exit $EXIT_CONTINUE
    }

    $skippedVersion = Get-IniValue -Path $IniPath -Section "Updater" -Key "SkippedVersion" -Default ""
    if ($skippedVersion -eq $latestTag) {
        exit $EXIT_CONTINUE
    }
} finally {
    $checkingForm.Close()
}

try {
    $choice = Show-UpdateDialog -Version $latestTag -Changelog $changelog
} catch {
    exit $EXIT_CONTINUE
}

switch ($choice) {
    "Skip" {
        Set-IniValue -Path $IniPath -Section "Updater" -Key "SkippedVersion" -Value $latestTag
        exit $EXIT_CONTINUE
    }
    "DontAsk" {
        Set-IniValue -Path $IniPath -Section "Updater" -Key "CheckForUpdates" -Value "0"
        exit $EXIT_CONTINUE
    }
    "Install" {
        $downloadForm, $downloadLabel, $downloadProgressBar = Show-DownloadingWindow
        try {
            try {
                $tempDir = [IO.Path]::GetTempPath()
                $zipPath = Join-Path $tempDir "better4-update.zip"
                Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath -UseBasicParsing -TimeoutSec 30

                $downloadLabel.Text = "Installing update..."
                $downloadProgressBar.Value = 51
                $downloadProgressBar.Value = 50
                [System.Windows.Forms.Application]::DoEvents()

                $extractDir = Join-Path $tempDir "better4-update"
                if (Test-Path $extractDir) {
                    Remove-Item $extractDir -Recurse -Force
                }
                Expand-Archive -Path $zipPath -DestinationPath $extractDir -Force
            } catch {
                # Download/extract failed - fail open rather than leave the
                # game unable to start.
                exit $EXIT_CONTINUE
            }
        } finally {
            $downloadForm.Close()
        }

        $argList = @(
            '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', "`"$PSCommandPath`"",
            '-Phase2', '-WaitPid', $CallerPid, '-ExtractedDir', "`"$extractDir`""
        )
        Start-Process -FilePath 'powershell.exe' -ArgumentList $argList

        exit $EXIT_UPDATING
    }
    default {
        # Dialog dismissed/cancelled - don't persist anything, ask again
        # next launch.
        exit $EXIT_CONTINUE
    }
}

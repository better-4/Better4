[CmdletBinding(DefaultParameterSetName = 'CheckForUpdates')]
param(
    [Parameter(ParameterSetName = 'Install')]
    [switch]$Install,
    [Parameter(ParameterSetName = 'Install')]
    [string]$Skate4Exe = "",
    [Parameter(ParameterSetName = 'Install')]
    [switch]$Silent,
    [Parameter(ParameterSetName = 'Install')]
    [switch]$Elevated,

    [Parameter(ParameterSetName = 'CheckForUpdates')]
    [switch]$CheckForUpdates,
    [Parameter(ParameterSetName = 'CheckForUpdates')]
    [string]$CurrentVersion,
    [Parameter(ParameterSetName = 'CheckForUpdates')]
    [int]$CallerPid = 0,

    [Parameter(ParameterSetName = 'DoUpdate')]
    [switch]$DoUpdate,
    [Parameter(ParameterSetName = 'DoUpdate')]
    [int]$WaitPid = 0,
    [Parameter(ParameterSetName = 'DoUpdate')]
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

function Exit-InstallError {
    param([string]$Message)
    Write-Host "ERROR: $Message" -ForegroundColor Red
    if (-not $Silent) {
        Write-Host ""
        Read-Host "Press Enter to close" | Out-Null
    }
    exit 1
}

function Test-DirectoryWritable {
    param([string]$Path)

    $probePath = Join-Path $Path "write_test.tmp"
    try {
        [IO.File]::WriteAllText($probePath, "test")
        Remove-Item $probePath -Force
        return $true
    } catch {
        return $false
    }
}

switch ($PSCmdlet.ParameterSetName) {
    'Install' {
        $resolvedSkate4Exe = $Skate4Exe
        if ([string]::IsNullOrWhiteSpace($resolvedSkate4Exe)) {
            Initialize-Forms
            $dialog = New-Object System.Windows.Forms.OpenFileDialog
            $dialog.Title = "Select your Skate4.exe"
            $dialog.Filter = "Executable Files (*.exe)|*.exe"
            if ($dialog.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) {
                Write-Host "ERROR: no Skate4.exe selected." -ForegroundColor Red
                exit 1
            }
            $resolvedSkate4Exe = $dialog.FileName
        }

        if ((Split-Path $resolvedSkate4Exe -Leaf) -ne "Skate4.exe") {
            Write-Host "ERROR: expected Skate4.exe, but got '$(Split-Path $resolvedSkate4Exe -Leaf)'." -ForegroundColor Red
            exit 1
        }
        if (-not (Test-Path $resolvedSkate4Exe)) {
            Write-Host "ERROR: could not find '$resolvedSkate4Exe'." -ForegroundColor Red
            exit 1
        }

        $TargetDir = Split-Path $resolvedSkate4Exe -Parent

        if (-not $Elevated -and -not (Test-DirectoryWritable $TargetDir)) {
            Write-Host "'$TargetDir' is not writable, requesting administrator privileges..."
            $elevArgs = @(
                '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', "`"$PSCommandPath`"",
                '-Install', '-Skate4Exe', "`"$resolvedSkate4Exe`"", '-Elevated'
            )
            if ($Silent) { $elevArgs += '-Silent' }
            Start-Process -FilePath 'powershell.exe' -ArgumentList $elevArgs -Verb RunAs
            exit 0
        }

        Write-Host "Installing Better4 to '$TargetDir'..."

        $installFiles = @(
            "better4.dll",
            "better4.ini",
            "better4config.exe",
            "better4patcher.exe",
            "better4updater.ps1",
            "gamecontrollerdb.txt",
            "readme-better4.txt",
            "readme-partymod.txt",
            "README-SDL.txt",
            "SDL2.dll"
        )
        $skipIfExists = @("better4.ini", "readme-partymod.txt")

        foreach ($fileName in $installFiles) {
            $destPath = Join-Path $TargetDir $fileName
            if ($skipIfExists -contains $fileName -and (Test-Path $destPath)) {
                Write-Host "  $fileName (already exists, skipping)"
                continue
            }
            Write-Host "  $fileName"
            try {
                Copy-Item -Path (Join-Path $PSScriptRoot $fileName) -Destination $TargetDir -Force -ErrorAction Stop
            } catch {
                Exit-InstallError "could not update '$fileName' - close Better4.exe first, then try again."
            }
        }

        $dataDir = Join-Path $PSScriptRoot "data"
        if (Test-Path $dataDir -PathType Container) {
            Write-Host "  data\*"
            $destDataDir = Join-Path $TargetDir "data"
            New-Item -ItemType Directory -Path $destDataDir -Force | Out-Null
            try {
                Copy-Item -Path (Join-Path $dataDir '*') -Destination $destDataDir -Recurse -Force -ErrorAction Stop
            } catch {
                Exit-InstallError "could not update game data - close Better4.exe first, then try again."
            }
        }

        Write-Host ""
        Write-Host "Running better4patcher..."

        Push-Location $TargetDir

        $exePath = Join-Path $TargetDir "Better4.exe"
        $backupPath = Join-Path $TargetDir "Better4.exe.bak"
        $hadBackup = $false
        if (Test-Path $exePath) {
            try {
                Move-Item $exePath $backupPath -Force -ErrorAction Stop
            } catch {
                Pop-Location
                Exit-InstallError "could not back up Better4.exe - close Better4.exe first, then try again."
            }
            $hadBackup = $true
        }

        & (Join-Path $TargetDir "better4patcher.exe")
        $patcherSucceeded = $LASTEXITCODE -eq 0

        if ($patcherSucceeded) {
            if ($hadBackup) {
                Remove-Item $backupPath -Force
            }
        } else {
            if ($hadBackup) {
                Move-Item $backupPath $exePath -Force
            }
            Write-Host "ERROR: better4patcher failed." -ForegroundColor Red
        }

        if ($Silent) {
            if ($patcherSucceeded -and (Test-Path $exePath)) {
                Start-Process $exePath
            }
        } else {
            Write-Host ""
            Read-Host "Press Enter to close" | Out-Null
        }

        Pop-Location

        if ($patcherSucceeded) { exit 0 } else { exit 1 }
    }

    'DoUpdate' {
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

    'CheckForUpdates' {
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
                        exit $EXIT_CONTINUE
                    }
                } finally {
                    $downloadForm.Close()
                }

                $argList = @(
                    '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', "`"$PSCommandPath`"",
                    '-DoUpdate', '-WaitPid', $CallerPid, '-ExtractedDir', "`"$extractDir`""
                )
                Start-Process -FilePath 'powershell.exe' -ArgumentList $argList

                exit $EXIT_UPDATING
            }
            default {
                exit $EXIT_CONTINUE
            }
        }
    }
}

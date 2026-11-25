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
$LogPath = Join-Path $InstallDir "logs\better4updater.log"

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

function Write-UpdaterLog {
    param([string]$Message)
    try {
        $dir = Split-Path $LogPath -Parent
        if (-not (Test-Path $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
        $line = "{0} {1}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $Message
        Add-Content -Path $LogPath -Value $line -Encoding UTF8 -ErrorAction SilentlyContinue
    } catch {
    }
}

function Get-ErrorSummary {
    # The localized exception text arrives in the console code page and turns
    # into mojibake once written to a UTF-8 log, so log only Latin-safe detail.
    param($ErrorRecord)

    $exception = $ErrorRecord.Exception
    $status = $null
    if ($exception.Response -and $exception.Response.StatusCode) {
        $status = [int]$exception.Response.StatusCode
    }

    $type = $exception.GetType().Name
    if ($status) {
        return "$type HTTP $status"
    }
    return $type
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

function Get-HtmlText {
    param([string]$Html)
    $text = $Html -replace '<li[^>]*>', "`n- " -replace '<br\s*/?>', "`n" -replace '</p>', "`n" -replace '<[^>]+>', ''
    $text = [Net.WebUtility]::HtmlDecode($text)
    $text = ($text -split "`n" | ForEach-Object { $_.TrimEnd() }) -join "`n"
    return ($text -replace "(`n\s*){3,}", "`n`n").Trim()
}

function Get-ReleaseInfoFromApi {
    $response = Invoke-RestMethod -Uri "https://api.github.com/repos/better-4/Better4/releases/latest" `
        -Headers @{ "User-Agent" = "better4-updater"; "Accept" = "application/vnd.github+json" } `
        -TimeoutSec 8

    $assets = @($response.assets)
    if ($assets.Count -eq 0) {
        return $null
    }

    $zip = $assets | Where-Object { $_.name -like '*.zip' } | Select-Object -First 1
    if (-not $zip) {
        $zip = $assets[0]
    }

    return @{
        Tag = $response.tag_name
        Changelog = $response.body
        ZipUrl = $zip.browser_download_url
    }
}

function Get-ReleaseInfoFromWeb {
    # The unauthenticated GitHub API allows 60 requests per hour per IP. When a
    # shared or corporate address runs out of quota it answers 403, and the
    # updater used to treat that as "no updates available". These pages are
    # served by github.com itself and are not rate limited the same way.
    $headers = @{ "User-Agent" = "better4-updater" }

    $latestUri = "https://github.com/better-4/Better4/releases/latest"
    $request = [Net.HttpWebRequest]::Create($latestUri)
    $request.AllowAutoRedirect = $false
    $request.UserAgent = "better4-updater"
    $request.Timeout = 10000

    $tag = $null
    $response = $request.GetResponse()
    try {
        $location = $response.Headers['Location']
        if ($location -match '/releases/tag/([^/?#]+)') {
            $tag = $matches[1]
        }
    } finally {
        $response.Close()
    }

    if (-not $tag) {
        return $null
    }

    $zipUrl = $null
    $assetsPage = Invoke-WebRequest -Uri "https://github.com/better-4/Better4/releases/expanded_assets/$tag" `
        -Headers $headers -UseBasicParsing -TimeoutSec 15
    $zipMatch = [regex]::Match($assetsPage.Content, '/better-4/Better4/releases/download/[^"''\s]+\.zip')
    if ($zipMatch.Success) {
        $zipUrl = "https://github.com" + $zipMatch.Value
    }

    if (-not $zipUrl) {
        return $null
    }

    $changelog = ""
    try {
        $releasePage = Invoke-WebRequest -Uri "https://github.com/better-4/Better4/releases/tag/$tag" `
            -Headers $headers -UseBasicParsing -TimeoutSec 15
        $bodyMatch = [regex]::Match($releasePage.Content,
            '<div[^>]*class="[^"]*markdown-body[^"]*"[^>]*>(.*?)</div>\s*</div>',
            [Text.RegularExpressions.RegexOptions]::Singleline)
        if ($bodyMatch.Success) {
            $changelog = Get-HtmlText $bodyMatch.Groups[1].Value
        }
    } catch {
    }

    return @{
        Tag = $tag
        Changelog = $changelog
        ZipUrl = $zipUrl
    }
}

function Get-LatestRelease {
    try {
        $info = Get-ReleaseInfoFromApi
        if ($info) {
            Write-UpdaterLog "release resolved via api: $($info.Tag)"
            return $info
        }
        Write-UpdaterLog "api returned no usable release; falling back to web"
    } catch {
        Write-UpdaterLog "api lookup failed ($(Get-ErrorSummary $_)); falling back to web"
    }

    try {
        $info = Get-ReleaseInfoFromWeb
        if ($info) {
            Write-UpdaterLog "release resolved via web: $($info.Tag)"
            return $info
        }
        Write-UpdaterLog "web lookup returned no usable release"
    } catch {
        Write-UpdaterLog "web lookup failed: $(Get-ErrorSummary $_)"
    }

    return $null
}

function Save-Download {
    param([string]$Uri, [string]$OutFile, $ProgressBar, $StatusLabel)

    $request = [Net.HttpWebRequest]::Create($Uri)
    $request.UserAgent = "better4-updater"
    $request.Timeout = 30000
    $request.ReadWriteTimeout = 30000

    $response = $request.GetResponse()
    try {
        $total = $response.ContentLength
        $stream = $response.GetResponseStream()
        $file = [IO.File]::Create($OutFile)
        try {
            $buffer = New-Object byte[] 65536
            $received = 0
            while (($read = $stream.Read($buffer, 0, $buffer.Length)) -gt 0) {
                $file.Write($buffer, 0, $read)
                $received += $read
                if ($ProgressBar -and $total -gt 0) {
                    $percent = [int](($received * 100) / $total)
                    if ($percent -gt $ProgressBar.Maximum) { $percent = $ProgressBar.Maximum }
                    $ProgressBar.Value = $percent
                    if ($StatusLabel) {
                        $mb = [math]::Round($received / 1MB, 1)
                        $totalMb = [math]::Round($total / 1MB, 1)
                        $StatusLabel.Text = "Downloading update... $mb of $totalMb MB"
                    }
                    [System.Windows.Forms.Application]::DoEvents()
                }
            }
        } finally {
            $file.Close()
            $stream.Close()
        }
    } finally {
        $response.Close()
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
            $sibling = Join-Path (Split-Path $resolvedSkate4Exe -Parent) "Skate4.exe"
            if (-not (Test-Path $sibling)) {
                Write-Host "ERROR: expected Skate4.exe, but got '$(Split-Path $resolvedSkate4Exe -Leaf)'." -ForegroundColor Red
                if (-not $Silent) { Read-Host "Press Enter to close" | Out-Null }
                exit 1
            }
            Write-Host "Selected '$(Split-Path $resolvedSkate4Exe -Leaf)'; using '$sibling' instead."
            $resolvedSkate4Exe = $sibling
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
            "b4bink.dll",
            "better4.dll",
            "better4.ini",
            "better4config.exe",
            "better4patcher.exe",
            "better4updater.ps1",
            "gamecontrollerdb.txt",
            "readme-better4.txt",
            "readme-partymod.txt",
            "README-SDL.txt",
            "SDL2.dll",
            "save\cam100.CAR"
        )
        $skipIfExists = @("better4.ini", "readme-partymod.txt", "save\cam100.CAR")

        foreach ($fileName in $installFiles) {
            $destPath = Join-Path $TargetDir $fileName
            if ($skipIfExists -contains $fileName -and (Test-Path $destPath)) {
                Write-Host "  $fileName (already exists, skipping)"
                continue
            }
            $srcPath = Join-Path $PSScriptRoot $fileName
            if ([IO.Path]::GetFullPath($srcPath) -ieq [IO.Path]::GetFullPath($destPath)) {
                Write-Host "  $fileName (already in place)"
                continue
            }
            Write-Host "  $fileName"
            try {
                New-Item -ItemType Directory -Path (Split-Path $destPath -Parent) -Force | Out-Null
                Copy-Item -Path $srcPath -Destination $destPath -Force -ErrorAction Stop
            } catch {
                Exit-InstallError "could not update '$fileName' - $($_.Exception.Message)"
            }
        }

        $dataDir = Join-Path $PSScriptRoot "data"
        $destDataDir = Join-Path $TargetDir "data"
        if ([IO.Path]::GetFullPath($dataDir) -ieq [IO.Path]::GetFullPath($destDataDir)) {
            Write-Host "  data\* (already in place)"
        } elseif (Test-Path $dataDir -PathType Container) {
            Write-Host "  data\*"
            New-Item -ItemType Directory -Path $destDataDir -Force | Out-Null
            try {
                Copy-Item -Path (Join-Path $dataDir '*') -Destination $destDataDir -Recurse -Force -ErrorAction Stop
            } catch {
                Exit-InstallError "could not update game data - $($_.Exception.Message))"
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
                Exit-InstallError "could not back up Better4.exe - $($_.Exception.Message))"
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
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

            $release = Get-LatestRelease
            if (-not $release) {
                Write-UpdaterLog "no release info available; skipping"
                exit $EXIT_CONTINUE
            }

            $latestTag = $release.Tag
            $changelog = $release.Changelog
            $zipUrl = $release.ZipUrl

            try {
                $latestVersion = [version]$latestTag
                $currentVersionParsed = [version]($CurrentVersion -replace '-.*')
            } catch {
                exit $EXIT_CONTINUE
            }

            $isDev = $CurrentVersion -like '*-*'
            if ($latestVersion -lt $currentVersionParsed -or ($latestVersion -eq $currentVersionParsed -and -not $isDev)) {
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
                        Save-Download -Uri $zipUrl -OutFile $zipPath `
                            -ProgressBar $downloadProgressBar -StatusLabel $downloadLabel

                        $downloadLabel.Text = "Installing update..."
                        $downloadProgressBar.Value = 50
                        [System.Windows.Forms.Application]::DoEvents()

                        $extractDir = Join-Path $tempDir "better4-update"
                        if (Test-Path $extractDir) {
                            Remove-Item $extractDir -Recurse -Force
                        }
                        Expand-Archive -Path $zipPath -DestinationPath $extractDir -Force

                        Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
                    } catch {
                        Write-UpdaterLog "download failed: $(Get-ErrorSummary $_)"
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

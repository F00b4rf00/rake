$minFileSize = 90 * 1GB

$drives = Get-WmiObject -Class Win32_Volume -Filter "DriveType = 3" | Where-Object { $_.Capacity -ne $null }

$totalBelowCount = 0
$totalAboveCount = 0
$directories = @()
$aboveFolders = @()  # initialize an empty array to keep track of folders that contain files above 90 GB

foreach ($drive in $drives) {

    $drivePath = $drive.Name
    Write-Host "Searching for .plot files on drive $drivePath ..."

    try {

        $files = Get-ChildItem -Path $drivePath -Recurse -Filter "*.plot" -ErrorAction Stop
        $belowCount = ($files | Where-Object { $_.Length -lt $minFileSize }).Count
        Write-Host "Number of .plot files below 90 GB on drive $drivePath $belowCount"
        $totalBelowCount += $belowCount
        $aboveCount = ($files | Where-Object { $_.Length -ge $minFileSize }).Count
        Write-Host "Number of .plot files above or equal to 90 GB on drive $drivePath $aboveCount"
        $totalAboveCount += $aboveCount

        # Collect the directories containing .plot files
        $directories += $files.DirectoryName | Get-Unique
        if ($aboveCount -gt 0) {
          # Get the folders that contain files above 90 GB on the current drive
          $aboveFolders += ($files | Where-Object { $_.Length -ge $minFileSize } | Select-Object -ExpandProperty Directory | Sort-Object -Unique)

        }

    }
    catch {

        Write-Host "Access denied or unable to search on drive $drivePath. Skipping this drive."
    }
}


Write-Host ""
Write-Host "Total number of .plot files below 90 GB found on all drives $totalBelowCount"
Write-Host "Total number of .plot files above or equal to 90 GB found on all drives $totalAboveCount"

if ($aboveFolders.Count -gt 0) {

    Write-Host "Folders that contain files above 90 GB:"
    $aboveFolders | ForEach-Object { Write-Host "$_ ^" }

} else {
    Write-Host "No folders contain files above 90 GB."
}

# Display the directories containing .plot files
Write-Host ""
Write-Host "Directories containing .plot files. Add these in config.yaml"
Write-Host “  plot_directories`:"

foreach ($directory in $directories) {

    Write-Host "  `- $directory"
}


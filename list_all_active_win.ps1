# Get all processes with a MainWindowTitle
$activeWindows = Get-Process | Where-Object { $_.MainWindowTitle -ne "" } 

# Display the list of active windows
Write-Host "List of Active Windows:"
$activeWindows | ForEach-Object { Write-Host $_.ProcessName - " : " $_.MainWindowTitle }

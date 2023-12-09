# Name of the application to minimize
$applicationToMinimize = "Discord"

# Get all processes with a MainWindowTitle (this includes Discord if it's open)
$activeWindows = Get-Process | Where-Object { $_.MainWindowTitle -ne "" -and $_.ProcessName -eq $applicationToMinimize }

if ($activeWindows -ne $null) {
    # Minimize the window
    Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class Win32 {
        [DllImport("user32.dll")]
        [return: MarshalAs(UnmanagedType.Bool)]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
    }
"@
    $activeWindows | ForEach-Object {
        [Win32]::ShowWindow($_.MainWindowHandle, 6) > $null # 6 is the command for minimizing the window, output redirected to $null
    }
}

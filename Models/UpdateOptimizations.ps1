# --- Windows Update Optimizations for Windows 11 Pro ---

# 1. Disable automatic Windows Updates
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord

# 2. Set update behavior to "Notify before download"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 2 -Type DWord

# 3. Disable automatic installation of minor updates
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AutoInstallMinorUpdates" -Value 0 -Type DWord

# 4. Defer feature updates for 365 days
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdates" -Value 1 -Type DWord
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferFeatureUpdatesPeriodInDays" -Value 365 -Type DWord

# 5. Defer quality (security) updates for 7 days
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdates" -Value 1 -Type DWord
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "DeferQualityUpdatesPeriodInDays" -Value 7 -Type DWord

# 6. Disable Delivery Optimization (peer-to-peer update distribution)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" -Name "DODownloadMode" -Value 0 -Type DWord

# 7. Disable automatic updates for Microsoft Store apps
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsStore" -Name "AutoDownload" -Value 2 -Type DWord

# 8. Disable automatic archiving of unused apps
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Appx" -Name "AllowAutomaticAppArchiving" -Value 0 -Type DWord

# 9. Prevent automatic restarts after installing updates when users are logged on
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Value 1 -Type DWord

# 10. Exclude driver updates from Windows quality updates
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "ExcludeWUDriversInQualityUpdate" -Value 1 -Type DWord

# 11. Show only restart required notifications for updates
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetUpdateNotificationLevel" -Value 1 -Type DWord

# 12. Prevent updates from downloading over metered connections (per user)
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" -Name "AllowAutoWindowsUpdateDownloadOverMeteredNetwork" -Value 0 -Type DWord

# --- End of Windows Update Optimizations ---
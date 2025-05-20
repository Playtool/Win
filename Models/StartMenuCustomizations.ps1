# --- Start Menu Customizations and Optimizations for Windows 11 Pro ---

# 1. Show Recently Added Apps in Start Menu (0 = show, 1 = hide)
# Applies to both current user and all users (local machine)
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "HideRecentlyAddedApps" -Value 0 -Type DWord
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "HideRecentlyAddedApps" -Value 0 -Type DWord

# 2. Set Start Menu layout to 'More Pins' (1 = more pins, 0 = default)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_Layout" -Value 1 -Type DWord

# 3. Show Recommended Tips, Shortcuts, etc. (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_IrisRecommendations" -Value 1 -Type DWord

# 4. Show Most Used Apps in Start Menu (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Start" -Name "ShowFrequentList" -Value 1 -Type DWord

# 5. Show Lock Option in Start Menu (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowLockOption" -Value 1 -Type DWord

# 6. Show Recommended Files in Start Menu (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackDocs" -Value 1 -Type DWord

# 7. Unlock the Start Menu layout (set LockedStartLayout to 0)
# Applies to both current user and all users (local machine)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "LockedStartLayout" -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "LockedStartLayout" -Value 0 -Type DWord

# --- End of Start Menu Customizations and Optimizations ---
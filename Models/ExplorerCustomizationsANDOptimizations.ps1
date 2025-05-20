# 3D Objects folder visibility (remove to hide)
#Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -ErrorAction SilentlyContinue
#Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\WOW64\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" -ErrorAction SilentlyContinue

# Home Folder in Navigation Pane (remove to hide)
Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -ErrorAction SilentlyContinue

# Launch to This PC (1 = This PC, 2 = Quick access)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "LaunchTo" -Value 1 -Type DWord

# File Extensions (0 = show, 1 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 1 -Type DWord

# Pop-up Descriptions (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowInfoTip" -Value 0 -Type DWord

# Preview Handlers (1 = enabled, 0 = disabled)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowPreviewHandlers" -Value 0 -Type DWord

# Status Bar (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowStatusBar" -Value 0 -Type DWord

# Show Thumbnails (IconsOnly: 0 = thumbnails, 1 = icons)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "IconsOnly" -Value 0 -Type DWord

# Translucent Selection (1 = enabled, 0 = disabled)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Value 1 -Type DWord

# Drop Shadows for icon labels (1 = enabled, 0 = disabled)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Value 1 -Type DWord

# Full Path in Title Bar (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" -Name "FullPath" -Value 1 -Type DWord

# Font Smoothing (2 = enabled, 0 = disabled)
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothing" -Value "2" -Type String

# Gallery in Navigation Pane (remove to hide)
Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -ErrorAction SilentlyContinue
# Long Paths Enabled (1 = enabled, 0 = disabled)
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 0 -Type DWord

# Remove Quick Access "Home" section from the navigation pane
Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -ErrorAction SilentlyContinue
#New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}" -Force

# Recently viewed files in Quick Access (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowRecent" -Value 0 -Type DWord

# Frequent Folders in Quick Access (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowFrequent" -Value 0 -Type DWord

# Office Files in Quick Access (1 = show, 0 = hide)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "ShowCloudFilesInQuickAccess" -Value 0 -Type DWord
# Gallery in Navigation Pane (remove to hide)
Remove-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -ErrorAction SilentlyContinue
# Gallery in Navigation Pane (Add to show)
#New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}" -Force


#check for desktop
# Tablet Mode (1 = enabled, 0 = disabled)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" -Name "TabletMode" -Value 0 -Type DWord
# Desktop Mode on Sign-in (1 = desktop, 0 = default)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" -Name "SignInMode" -Value 1 -Type DWord
# Voice Typing Button (1 = enabled, 0 = disabled)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputSettings" -Name "IsVoiceTypingKeyEnabled" -Value 1 -Type DWord
# Typing Insights (1 = enabled, 0 = disabled)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputSettings" -Name "InsightsEnabled" -Value 1 -Type DWord
# Clipboard Suggested Actions (0 = enabled, 1 = disabled)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\SmartActionPlatform\SmartClipboard" -Name "Disabled" -Value 0 -Type DWord
# Default Printer Management (0 = Windows manages, 1 = user manages)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Windows" -Name "LegacyDefaultPrinterMode" -Value 0 -Type DWord
# Snap Assist (1 = enabled, 0 = disabled)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "SnapAssist" -Value 1 -Type DWord
# Sync Provider Notifications (1 = show, 0 = hide)
#Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowSyncProviderNotifications" -Value 1 -Type DWord

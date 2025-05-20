# --- Taskbar Customizations and Optimizations for Windows 11 Pro ---

# 1. Hide Windows Chat icon from the taskbar (0 = show, 3 = hide)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Chat" -Name "ChatIcon" -Value 3 -Type DWord

# 2. Hide Meet Now button from the taskbar (1 = hide, 0 = show)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -Name "HideSCAMeetNow" -Value 1 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "HideSCAMeetNow" -Value 1 -Type DWord

# 3. Hide Search box from the taskbar (0 = hide, 2 = show as search box)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0 -Type DWord

# 4. Hide Copilot button from the taskbar (0 = hide, 1 = show)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowCopilotButton" -Value 0 -Type DWord

# 5. Left-align taskbar icons (0 = left, 1 = center)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAl" -Value 0 -Type DWord

# 6. Hide Task View button from the taskbar (0 = hide, 1 = show)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -Type DWord

# 7. Hide Widgets (News and Interests) from the taskbar (0 = hide, 1 = show)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarDa" -Value 0 -Type DWord

# 8. Hide Taskbar People icon (0 = hide, 1 = show)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "PeopleBand" -Value 0 -Type DWord

# 9. Clean Taskbar: Unpin all items except File Explorer
# This deletes the Taskband registry key, which resets pinned taskbar items
Remove-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Recurse -ErrorAction SilentlyContinue

# 10. Restart Explorer to apply changes
Stop-Process -Name explorer -Force
Start-Process explorer

# --- End of Taskbar Customizations and Optimizations ---
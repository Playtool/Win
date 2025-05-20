# --- Sound Optimizations for Windows 11 Pro ---

# 1. Disable Windows startup sound during boot
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\BootAnimation" -Name "DisableStartupSound" -Value 1 -Type DWord

# 2. Disable Windows startup sound for the user
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\EditionOverrides" -Name "UserSetting_DisableStartupSound" -Value 1 -Type DWord

# 3. Disable sound ducking (prevents Windows from lowering the volume of other sounds during communications)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Multimedia\Audio" -Name "UserDuckingPreference" -Value 3 -Type DWord

# 4. Disable voice activation for all apps
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\SpeechOneCore\Settings" -Name "AgentActivationEnabled" -Value 0 -Type DWord

# 5. Disable last used voice activation setting
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\SpeechOneCore\Settings" -Name "AgentActivationLastUsed" -Value 0 -Type DWord

# 6. Disable audio enhancements for playback devices
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Multimedia\Audio\DeviceFx" -Name "EnableDeviceEffects" -Value 0 -Type DWord

# 7. Disable spatial sound (Windows Sonic and spatial sound features)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Audio" -Name "EnableSpatialSound" -Value 0 -Type DWord

# --- End of Sound Optimizations ---
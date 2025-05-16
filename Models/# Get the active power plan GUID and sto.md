# Get the active power plan GUID and store it in a variable
$active_guid = (powercfg /getactivescheme | Select-String -Pattern 'GUID' | ForEach-Object { $_.ToString().Split()[3] }) 
# Gets the current power plan's GUID

# --- Registry Tweaks ---
# Hibernate--Off
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "HibernateEnabled" -Value 0 # Disable hibernate feature
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -Name "HibernateEnabledDefault" -Value 0 
# Disable hibernate by default

# Video Quality on Battery
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\VideoSettings" -Name "VideoQualityOnBattery" -Value 1 
# Set video quality to high when on battery

# Fast Boot--Off
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -Name "HiberbootEnabled" -Value 0 
# Disable fast startup (hybrid boot)

# CPU Core Unparking
Set-ItemProperty -Path "HKLM:\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" -Name "ValueMax" -Value 1 
# Unpark all CPU cores for better performance

# Power Throttling
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Value 1 
# All apps can use full CPU resources, improve performance but may use more power.

# --- Powercfg Tweaks ---
# Hibernate
powercfg /hibernate off 
# Turn off hibernate

# Sleep Timeout
# Never sleep on AC power
powercfg /setacvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0x00000000
 # Never sleep on battery
powercfg /setdcvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0x00000000

# Display Timeout & Brightness
# Never turn off display on AC
powercfg /setacvalueindex $active_guid 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0x00000000 
# Never turn off display on battery
powercfg /setdcvalueindex $active_guid 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0x00000000 

# Processor Performance
# Set maximum processor state to 100% on AC
powercfg /setacvalueindex $active_guid 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 0x00000064 
# Set cooling policy to active on AC
powercfg /setacvalueindex $active_guid 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 001 

# Hard Disk Timeout
# Never turn off hard disk on AC
powercfg /setacvalueindex $active_guid 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0x00000000 
# Never turn off hard disk on battery
powercfg /setdcvalueindex $active_guid 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0x00000000 

# Desktop Slideshow
# Disable desktop slideshow on AC
powercfg /setacvalueindex $active_guid 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 000 
# Disable desktop slideshow on battery
powercfg /setdcvalueindex $active_guid 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 000 

# Wireless Adapter
# Set wireless adapter to max performance on AC
powercfg /setacvalueindex $active_guid 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 000 
# Set wireless adapter to max performance on battery
powercfg /setdcvalueindex $active_guid 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 000 


# Sleep, Hybrid Sleep, Hibernate, Wake Timers
# Disable hybrid sleep on AC
powercfg /setacvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 000 
# Disable hybrid sleep on battery
powercfg /setdcvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 000 
# Never hibernate on AC
powercfg /setacvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0x00000000 
# Never hibernate on battery
powercfg /setdcvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0x00000000 
# Disable wake timers on AC
powercfg /setacvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 000 
# Disable wake timers on battery
powercfg /setdcvalueindex $active_guid 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 000 

# USB Power Management
# Never turn off USB hubs on AC
powercfg /setacvalueindex $active_guid 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0x00000000 
 # Never turn off USB hubs on battery
powercfg /setdcvalueindex $active_guid 2a737441-1930-4402-8d77-b2bebba308a3 0853a681-27c8-4100-a2fd-82013e970683 0x00000000
# Disable USB selective suspend on AC
powercfg /setacvalueindex $active_guid 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 000 
# Disable USB selective suspend on battery
powercfg /setdcvalueindex $active_guid 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 000 
# Disable USB 3.0 link power management on AC
powercfg /setacvalueindex $active_guid 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 000 
# Disable USB 3.0 link power management on battery
powercfg /setdcvalueindex $active_guid 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 000 

# Power Button, 000 — Do nothing, 002 — Shut down
# Set power button on AC
powercfg /setacvalueindex $active_guid 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 002 
# Set power button on battery
powercfg /setdcvalueindex $active_guid 4f971e89-eebd-4455-a8de-9e59040e7347 a7066653-8d6c-40a8-910e-a1f54b84c7e5 002 

# PCI Express, 000 — Disable powersaving, 001 — Moderate powersavings , 002 — Maximum powersavings.
# Disable PCI Express power saving on AC
powercfg /setacvalueindex $active_guid 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 000 
# Disable PCI Express power saving on battery
powercfg /setdcvalueindex $active_guid 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 000 

# Video Playback
# Optimize video playback for performance on AC
powercfg /setacvalueindex $active_guid 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 001
 # Optimize video playback for performance on battery 
powercfg /setdcvalueindex $active_guid 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 001
 # Disable video quality reduction on AC
powercfg /setacvalueindex $active_guid 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 000
 # Disable video quality reduction on battery
powercfg /setdcvalueindex $active_guid 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 000

# Graphics Power
# Set Intel graphics to max performance on AC
powercfg /setacvalueindex $active_guid 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 002 
 # Set Intel graphics to max performance on battery
powercfg /setdcvalueindex $active_guid 44f3beca-a7c0-460e-9df2-bb8b99e0cba6 3619c3f2-afb2-4afc-b0e9-e7fef372de36 002
 # Set AMD power slider to max performance on AC
powercfg /setacvalueindex $active_guid c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 003
 # Set AMD power slider to max performance on battery
powercfg /setdcvalueindex $active_guid c763b4ec-0e50-4b6b-9bed-2b92a6ee884e 7ec1751b-60ed-4588-afb5-9819d3d77d90 003
 # Enable ATI PowerPlay on AC
powercfg /setacvalueindex $active_guid f693fb01-e858-4f00-b20f-f30e12ac06d6 191f65b5-d45c-4a4f-8aae-1ab8bfd980e6 001
 # Enable ATI PowerPlay on battery
powercfg /setdcvalueindex $active_guid f693fb01-e858-4f00-b20f-f30e12ac06d6 191f65b5-d45c-4a4f-8aae-1ab8bfd980e6 001
 # Set switchable graphics to max performance on AC
powercfg /setacvalueindex $active_guid e276e160-7cb0-43c6-b20b-73f5dce39954 a1662ab2-9d34-4e53-ba8b-2639b9e20857 003
 # Set switchable graphics to max performance on battery
powercfg /setdcvalueindex $active_guid e276e160-7cb0-43c6-b20b-73f5dce39954 a1662ab2-9d34-4e53-ba8b-2639b9e20857 003

# Battery Notifications
# Enable critical battery notification on AC
powercfg /setacvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 001 
# Enable critical battery notification on battery
powercfg /setdcvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f 5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f 001 
# Do nothing on critical battery on AC
powercfg /setacvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 000 
# Do nothing on critical battery on battery
powercfg /setdcvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f 637ea02f-bbcb-4015-8e2c-a1c7b9c0b546 000 
# Enable low battery notification on AC
powercfg /setacvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 001 
# Enable low battery notification on battery
powercfg /setdcvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f bcded951-187b-4d05-bccc-f7e51960c258 001 
# Set low battery level to 10% on AC
powercfg /setacvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 0x0000000A 
# Set low battery level to 10% on battery
powercfg /setdcvalueindex $active_guid e73a048d-bf27-4f12-9731-8b2076e8891f 8183ba9a-e910-48da-8769-14ae6dc1170a 0x0000000A 

#
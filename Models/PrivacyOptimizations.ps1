# --- Privacy Optimizations for Windows 11 Pro ---((registry keys deleted after system restart))

# 2. Privacy&Security>>General>>Let apps show me personalized ads by using my advertising ID (0 = disable, 1 = enable)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0 -Type DWord

# 3. Privacy&Security>>General>>Let websites accessing your language list (1 = disable, 0 = enable)
Set-ItemProperty -Path "HKCU:\Control Panel\International\User Profile" -Name "HttpAcceptLanguageOptOut" -Value 1 -Type DWord

# 4. Windows tracking app launches)(0 = disable, 1 = enable)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Value 0 -Type DWord

# 5. Privacy&Security>>General>> Suggested Content in Settings app (0 = disable, 1 = enable)
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338387Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338393Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353694Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353696Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-353698Enabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type "DWord" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type "DWord" -Value 0

# 7. Privacy&Security>>Speech. Online Speech Recognition (0 = disable, 1 = enable)
if (-not (Test-Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy")) {New-Item -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings" -Name "OnlineSpeechPrivacy" | Out-Null}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" -Name "HasAccepted" -Value 0 -Type DWord
if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization")) {New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft" -Name "InputPersonalization" | Out-Null}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\InputPersonalization" -Name "AllowInputPersonalization" -Value 0 -Type DWord

# 8. #Privacy&Security>>Inking and Typing Dictionary
if (-not (Test-Path "HKCU:\Software\Microsoft\Personalization\Settings")) {New-Item -Path "HKCU:\Software\Microsoft\Personalization" -Name "AcceptedPrivacyPolicy" | Out-Null}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value 0 -Type DWord
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Value 0 -Type DWord


###ON Privacy&Security > Diagnostics & feedback. reset below
Remove-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Recurse
Remove-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Recurse
Remove-Item -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Recurse

###9 .OFF Privacy&Security > DiagnosticsData | InkingAndTyping | 
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Force | Out-Null
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 1 -Type DWord

###11 Privacy&Security > Diagnostics & feedback >> DisableTailoredExperiencesWithDiagnosticData  
if (-not (Test-Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent")) {New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "CloudContent" | Out-Null}
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\CloudContent" -Name "DisableTailoredExperiencesWithDiagnosticData" -Value 1 -Type DWord

###12 Privacy&Security > Diagnostics & feedback >> DisableDiagnosticDataViewer
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "DisableDiagnosticDataViewer" -Value 1 -Type DWord

###13. Feedback_frequency_Never
if (-not (Test-Path "HKCU:\Software\Microsoft\Siuf\Rules")) {New-Item -Path "HKCU:\Software\Microsoft\Siuf" -Name "Rules" | Out-Null}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Value 0 -Type DWord

#-------------------------------------------------------------

#12a. OFF Privacy&Security >Location Services
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Value "Deny" -Type String
#12b Disable Privacy&Security >Location Services
if (-not (Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors")) {New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "LocationAndSensors" | Out-Null}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" -Name "DisableLocation" -Value 1 -Type DWord

# 13. Disable Camera Access
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" -Name "Value" -Value "Deny" -Type String

# 14. Disable Microphone Access
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" -Name "Value" -Value "Deny" -Type String

# 15. Disable Account Info Access
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -Name "Value" -Value "Deny" -Type String

# 16. Disable App Diagnostic Access
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -Name "Value" -Value "Deny" -Type String

# 19. Disable Web Search in Start Menu and Taskbar
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -Type DWord

# --- End of Privacy Optimizations ---

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location]
"Value"="Deny"
"Description"="Location: Access location data using GPS or other services."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam]
"Value"="Deny"
"Description"="Webcam: Activate and use the camera on your device."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone]
"Value"="Deny"
"Description"="Microphone: Activate and use the microphone on your device."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener]
"Value"="Allow"
"Description"="Notifications: Access your notifications, found in action center."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation]
"Value"="Deny"
"Description"="Account Info: Access any of your account info."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts]
"Value"="Allow"
"Description"="Contacts: Access your contacts, people, or address book apps."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall]
"Value"="Allow"
"Description"="Phone Call: Access and initiate phone calls."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory]
"Value"="Allow"
"Description"="Call History: Access call history on the device or apps."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email]
"Value"="Allow"
"Description"="Email: Access your email and account info for your email accounts."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios]
"Value"="Allow"
"Description"="Radios: Control wireless communication radios (e.g., Bluetooth, Wi-Fi)."

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics]
"Value"="Allow"
"Description"="App Diagnostics: Get diagnostic info about other running apps."

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" -Name "Value" -Value "Deny" -Type String
"Value"="Deny"
"Description"="Documents Library: Access document files."
# Downloads Folder: Access downloaded files.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" -Name "Value" -Value "Deny" -Type String
"Value"="Deny"
# Documents Library: Access document files."Description"="Downloads Folder: Access downloaded files."
# Music Library: Access any music files on your device.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\musicLibrary" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Music Library: Access any music files on your device."
# Pictures Library: Access any picture files on your device.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Pictures Library: Access any picture files on your device."
# Video Library: Access any video files on your device.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Video Library: Access any video files on your device."
# Graphics Capture Programmatic: Programmatic screen capture.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureProgrammatic" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Graphics Capture Programmatic: Programmatic screen capture."
# Graphics Capture Without Border: Screen capture without window borders.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\graphicsCaptureWithoutBorder" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Graphics Capture Without Border: Screen capture without window borders."
# Activity: Access activity history.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Activity: Access activity history."
# Calendar: Access your calendars.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Calendar: Access your calendars."
# Bluetooth: Use Bluetooth to communicate with other devices.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetooth" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Bluetooth: Use Bluetooth to communicate with other devices."
# Bluetooth Sync: Sync data using Bluetooth.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Bluetooth Sync: Sync data using Bluetooth."
# File System: Full access to the file system, including protected folders.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" -Name "Value" -Value "Deny" -Type String
"Value"="Deny"
"Description"="File System: Full access to the file system, including protected folders."
# Cellular Data: Use mobile data connections.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Cellular Data: Use mobile data connections."
# Messaging: Access your instant messages and accounts.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Messaging: Access your instant messages and accounts."
# Gaze Input: Use eye-tracking hardware for input.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Gaze Input: Use eye-tracking hardware for input."
# Human Interface Device: Access input devices like keyboards, touch, etc.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\humanInterfaceDevice" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Human Interface Device: Access input devices like keyboards, touch, etc."
# Custom Sensors: Use custom sensor hardware.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\sensors.custom" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Custom Sensors: Use custom sensor hardware."
# Serial Communication: Use serial ports for communication.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\serialCommunication" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Serial Communication: Use serial ports for communication."
# USB: Use USB for data or communication.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\usb" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="USB: Use USB for data or communication."
# Tasks: Access your to-do or task list apps.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Tasks: Access your to-do or task list apps."
# WiFi: Access and manage WiFi connection data.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wifiData" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="WiFi: Access and manage WiFi connection data."
# Wi-Fi Direct: Communicate with other devices directly over Wi-Fi.
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\wiFiDirect" -Name "Value" -Value "Allow" -Type String
"Value"="Allow"
"Description"="Wi-Fi Direct: Communicate with other devices directly over Wi-Fi."

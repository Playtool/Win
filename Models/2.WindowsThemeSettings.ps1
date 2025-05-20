# 1. Set Windows Apps to  Mode (0 = dark, 1 = light)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWord
# 2. Set Windows System to  Mode (0 = dark, 1 = light)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 1 -Type DWord
# 3. This sets the wallpaper image.
$wallpaperPath = "C:\Windows\Web\Wallpaper\Windows\img0.jpg"
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "Wallpaper" -Value $wallpaperPath
# 4. (Optional) Refresh the desktop to apply wallpaper change
Add-Type '[DllImport("user32.dll")]public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);' -Name NativeMethods -Namespace Win32
[Win32.NativeMethods]::SystemParametersInfo(20, 0, $wallpaperPath, 3)

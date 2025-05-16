UacOptimizations

$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"

Set-ItemProperty -Path $regPath -Name "EnableLUA" -Value 0

Set-ItemProperty -Path $regPath -Name "ConsentPromptBehaviorAdmin" -Value 0

Set-ItemProperty -Path $regPath -Name "PromptOnSecureDesktop" -Value 0

Control.exe /name Microsoft.UserAccountControlSettings


public const string RegistryName = "ConsentPromptBehaviorAdmin";
public static readonly RegistryValueKind ValueKind = RegistryValueKind.DWord;

public static readonly Dictionary<int, int> LevelToRegistryValue = new()
{
    { 0, 0 }, // Never notify (Low)
};

public static readonly Dictionary<int, int> RegistryValueToLevel = new()
{
    { 0, 0 }, // Never notify
};


# UACOptimizations - PowerShell script with embedded and executable C# logic
# Must run as Administrator

# Step 1: Apply UAC-related registry settings
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
Set-ItemProperty -Path $regPath -Name "EnableLUA" -Value 0
Set-ItemProperty -Path $regPath -Name "ConsentPromptBehaviorAdmin" -Value 0
Set-ItemProperty -Path $regPath -Name "PromptOnSecureDesktop" -Value 0

# Step 2: Open UAC settings panel
Start-Process "Control.exe" -ArgumentList "/name Microsoft.UserAccountControlSettings"

# Step 3: Define and use C# logic inside PowerShell
Add-Type -TypeDefinition @"
using System;
using System.Collections.Generic;
using Microsoft.Win32;

public static class UacHelper
{
    public const string RegistryName = "ConsentPromptBehaviorAdmin";
    public static readonly RegistryValueKind ValueKind = RegistryValueKind.DWord;

    public static readonly Dictionary<int, int> LevelToRegistryValue = new Dictionary<int, int>()
    {
        { 0, 0 } // Never notify (Low)
    };

    public static readonly Dictionary<int, int> RegistryValueToLevel = new Dictionary<int, int>()
    {
        { 0, 0 } // Never notify
    };

    public static int GetRegistryValueFromLevel(int level)
    {
        return LevelToRegistryValue.ContainsKey(level) ? LevelToRegistryValue[level] : -1;
    }

    public static int GetLevelFromRegistryValue(int value)
    {
        return RegistryValueToLevel.ContainsKey(value) ? RegistryValueToLevel[value] : -1;
    }
}
"@

# Optional: use the compiled C# class in PowerShell
[int]$level = 0
[int]$regValue = [UacHelper]::GetRegistryValueFromLevel($level)
Write-Host "Registry value for UAC level $level is $regValue"

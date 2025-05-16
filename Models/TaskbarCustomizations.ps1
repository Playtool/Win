// Path to the UCPD service Start value
const string ucpdServiceKeyPath = @"HKLM\SYSTEM\CurrentControlSet\Services\UCPD";
const string startValueName = "Start";
    // Get the current value of the UCPD service Start key
    object? originalStartValue = registryService.GetValue(ucpdServiceKeyPath, startValueName);
    
    try
    {
        // Set the UCPD service Start value to 4 (disabled)
        logService.LogInformation($"Temporarily disabling UCPD service by setting {ucpdServiceKeyPath}\\{startValueName} to 4");
        bool setResult = registryService.SetValue(ucpdServiceKeyPath, startValueName, 4, RegistryValueKind.DWord);
        
        if (!setResult)
        {
            logService.LogError("Failed to set UCPD service Start value to 4");
            return false;
        }
        
        // Apply the News and Interests (Widgets) settings
        logService.LogInformation($"Applying linked setting: News and Interests (Widgets) with {linkedSettings.Settings.Count} registry entries");
        bool result = await registryService.ApplyLinkedSettingsAsync(linkedSettings, enable);
        
        if (!result)
        {
            logService.LogError("Failed to apply linked settings for News and Interests (Widgets)");
            return false;
        }
        
        return true;
    }
    finally
    {
        // Restore the original UCPD service Start value
        if (originalStartValue != null)
        {
            logService.LogInformation($"Restoring UCPD service Start value to {originalStartValue}");
            registryService.SetValue(ucpdServiceKeyPath, startValueName, originalStartValue, RegistryValueKind.DWord);
        }
    }
}
/// <summary>
/// Cleans the taskbar by unpinning all items except File Explorer.
/// </summary>
/// <param name="systemServices">The system services.</param>
/// <param name="logService">The log service.</param>
public static async Task CleanTaskbar(ISystemServices systemServices, ILogService logService)
{
    try
    {
        logService.LogInformation("Task started: Cleaning taskbar...");
        logService.LogInformation("Cleaning taskbar started");
        
        // Delete taskband registry key using Registry API
        using (var key = Registry.CurrentUser.OpenSubKey(@"Software\Microsoft\Windows\CurrentVersion\Explorer", true))
        {
            if (key != null)
            {
                key.DeleteSubKeyTree("Taskband", false);
            }
        }
        
        // Create the Taskband key and set values directly
        using (var taskbandKey = Registry.CurrentUser.CreateSubKey(
            @"SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband", true))
        {
            if (taskbandKey != null)
            {
                // Convert the hex string to a byte array
                // This is the same data that was in the .reg file
                byte[] favoritesData = new byte[] {
                    0x00, 0xaa, 0x01, 0x00, 0x00, 0x3a, 0x00, 0x1f, 0x80, 0xc8, 0x27, 0x34, 0x1f, 0x10, 0x5c, 0x10,
                    0x42, 0xaa, 0x03, 0x2e, 0xe4, 0x52, 0x87, 0xd6, 0x68, 0x26, 0x00, 0x01, 0x00, 0x26, 0x00, 0xef,
                    0xbe, 0x10, 0x00, 0x00, 0x00, 0xf4, 0x7e, 0x76, 0xfa, 0xde, 0x9d, 0xda, 0x01, 0x40, 0x61, 0x5d,
                    0x09, 0xdf, 0x9d, 0xda, 0x01, 0x19, 0xb8, 0x5f, 0x09, 0xdf, 0x9d, 0xda, 0x01, 0x14, 0x00, 0x56,
                    0x00, 0x31, 0x00, 0x00, 0x00, 0x00, 0x00, 0xa4, 0x58, 0xa9, 0x26, 0x10, 0x00, 0x54, 0x61, 0x73,
                    0x6b, 0x42, 0x61, 0x72, 0x00, 0x40, 0x00, 0x09, 0x00, 0x04, 0x00, 0xef, 0xbe, 0xa4, 0x58, 0xa9,
                    0x26, 0xa4, 0x58, 0xa9, 0x26, 0x2e, 0x00, 0x00, 0x00, 0xde, 0x9c, 0x01, 0x00, 0x00, 0x00, 0x02,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0c,
                    0xf4, 0x85, 0x00, 0x54, 0x00, 0x61, 0x00, 0x73, 0x00, 0x6b, 0x00, 0x42, 0x00, 0x61, 0x00, 0x72,
                    0x00, 0x00, 0x00, 0x16, 0x00, 0x18, 0x01, 0x32, 0x00, 0x8a, 0x04, 0x00, 0x00, 0xa4, 0x58, 0xb6,
                    0x26, 0x20, 0x00, 0x46, 0x49, 0x4c, 0x45, 0x45, 0x58, 0x7e, 0x31, 0x2e, 0x4c, 0x4e, 0x4b, 0x00,
                    0x00, 0x54, 0x00, 0x09, 0x00, 0x04, 0x00, 0xef, 0xbe, 0xa4, 0x58, 0xb6, 0x26, 0xa4, 0x58, 0xb6,
                    0x26, 0x2e, 0x00, 0x00, 0x00, 0xb7, 0xa8, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
                    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x5a, 0x1e, 0x01, 0x46,
                    0x00, 0x69, 0x00, 0x6c, 0x00, 0x65, 0x00, 0x20, 0x00, 0x45, 0x00, 0x78, 0x00, 0x70, 0x00, 0x6c,
                    0x00, 0x6f, 0x00, 0x72, 0x00, 0x65, 0x00, 0x72, 0x00, 0x2e, 0x00, 0x6c, 0x00, 0x6e, 0x00, 0x6b,
                    0x00, 0x00, 0x00, 0x1c, 0x00, 0x22, 0x00, 0x00, 0x00, 0x1e, 0x00, 0xef, 0xbe, 0x02, 0x00, 0x55,
                    0x00, 0x73, 0x00, 0x65, 0x00, 0x72, 0x00, 0x50, 0x00, 0x69, 0x00, 0x6e, 0x00, 0x6e, 0x00, 0x65,
                    0x00, 0x64, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x12, 0x00, 0x00, 0x00, 0x2b, 0x00, 0xef, 0xbe, 0x19,
                    0xb8, 0x5f, 0x09, 0xdf, 0x9d, 0xda, 0x01, 0x1c, 0x00, 0x74, 0x00, 0x00, 0x00, 0x1d, 0x00, 0xef,
                    0xbe, 0x02, 0x00, 0x7b, 0x00, 0x46, 0x00, 0x33, 0x00, 0x38, 0x00, 0x42, 0x00, 0x46, 0x00, 0x34,
                    0x00, 0x30, 0x00, 0x34, 0x00, 0x2d, 0x00, 0x31, 0x00, 0x44, 0x00, 0x34, 0x00, 0x33, 0x00, 0x2d,
                    0x00, 0x34, 0x00, 0x32, 0x00, 0x46, 0x00, 0x32, 0x00, 0x2d, 0x00, 0x39, 0x00, 0x33, 0x00, 0x30,
                    0x00, 0x35, 0x00, 0x2d, 0x00, 0x36, 0x00, 0x37, 0x00, 0x44, 0x00, 0x45, 0x00, 0x30, 0x00, 0x42,
                    0x00, 0x32, 0x00, 0x38, 0x00, 0x46, 0x00, 0x43, 0x00, 0x32, 0x00, 0x33, 0x00, 0x7d, 0x00, 0x5c,
                    0x00, 0x65, 0x00, 0x78, 0x00, 0x70, 0x00, 0x6c, 0x00, 0x6f, 0x00, 0x72, 0x00, 0x65, 0x00, 0x72,
                    0x00, 0x2e, 0x00, 0x65, 0x00, 0x78, 0x00, 0x65, 0x00, 0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0xff
                };
                
                // Set the binary value directly
                taskbandKey.SetValue("Favorites", favoritesData, RegistryValueKind.Binary);
            }
        }
        
        // Wait for registry changes to take effect before refreshing Windows GUI
        logService.LogInformation("Registry changes applied, waiting for changes to take effect...");
        await Task.Delay(2000);
        
        // Use the improved RefreshWindowsGUI method to restart Explorer and apply changes
        // This will ensure Explorer is restarted properly with retry logic and fallback
        var result = await systemServices.RefreshWindowsGUI(true);
        if (!result)
        {
            throw new Exception("Failed to refresh Windows GUI after cleaning taskbar");
        }
    }
    catch (Exception ex)
    {
        throw new Exception($"Error cleaning taskbar: {ex.Message}", ex);
    }
}

public static CustomizationGroup GetTaskbarCustomizations()
{
    return new CustomizationGroup
    {
        Name = "Taskbar",
        Category = CustomizationCategory.Taskbar,
        Settings = new List<CustomizationSetting>
        {
            new CustomizationSetting
            {
                Id = "taskbar-chat-icon",
                Name = "Windows Chat Icon",
                Description = "Controls Windows Chat icon visibility and menu behavior in taskbar",
                Category = CustomizationCategory.Taskbar,
                GroupName = "Taskbar Icons",
                IsEnabled = false,
                ControlType = ControlType.BinaryToggle,
                RegistrySettings = new List<RegistrySetting>
                {
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.LocalMachine,
                        SubKey = "SOFTWARE\\Microsoft\\Windows\\Windows Chat",
                        Name = "ChatIcon",
                        RecommendedValue = 3,  // For backward compatibility
                        EnabledValue = 0,      // When toggle is ON, Chat icon is shown (0 = show)
                        DisabledValue = 3,     // When toggle is OFF, Chat icon is hidden (3 = hide)
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 0,      // Default value when registry key exists but no value is set
                        Description = "Controls Windows Chat icon visibility in taskbar",
                        IsPrimary = true,
                        AbsenceMeansEnabled = true
                    },
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.CurrentUser,
                        SubKey = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
                        Name = "TaskbarMn",
                        RecommendedValue = 0,  // For backward compatibility
                        EnabledValue = 1,      // When toggle is ON, taskbar menu is enabled
                        DisabledValue = 0,     // When toggle is OFF, taskbar menu is disabled
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 0,      // Default value when registry key exists but no value is set
                        Description = "Controls taskbar menu behavior for chat",
                        IsPrimary = false,
                        AbsenceMeansEnabled = false
                    }
                },
                LinkedSettingsLogic = LinkedSettingsLogic.All
            },
            new CustomizationSetting
            {
                Id = "taskbar-meet-now-group",
                Name = "Meet Now Button",
                Description = "Controls Meet Now button visibility in taskbar",
                Category = CustomizationCategory.Taskbar,
                GroupName = "Taskbar Icons",
                IsEnabled = true,
                ControlType = ControlType.BinaryToggle,
                RegistrySettings = new List<RegistrySetting>
                {
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.LocalMachine,
                        SubKey = "SOFTWARE\\Policies\\Microsoft\\Windows\\Explorer",
                        Name = "HideSCAMeetNow",
                        RecommendedValue = 1,  // For backward compatibility
                        EnabledValue = 0,      // When toggle is ON, Meet Now button is shown
                        DisabledValue = 1,     // When toggle is OFF, Meet Now button is hidden
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 1,      // Default value when registry key exists but no value is set
                        Description = "Controls Meet Now button visibility in taskbar",
                        IsPrimary = true,
                        AbsenceMeansEnabled = true
                    },
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.CurrentUser,
                        SubKey = "Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer",
                        Name = "HideSCAMeetNow",
                        RecommendedValue = 1,  // For backward compatibility
                        EnabledValue = 0,      // When toggle is ON, Meet Now button is shown (user level)
                        DisabledValue = 1,     // When toggle is OFF, Meet Now button is hidden (user level)
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 1,      // Default value when registry key exists but no value is set
                        Description = "Controls Meet Now button visibility (user level)",
                        IsPrimary = false,
                        AbsenceMeansEnabled = true
                    }
                },
                LinkedSettingsLogic = LinkedSettingsLogic.All
            },
            new CustomizationSetting
            {
                Id = "taskbar-search-box",
                Name = "Search in Taskbar",
                Description = "Controls search box visibility in taskbar",
                Category = CustomizationCategory.Taskbar,
                GroupName = "Taskbar Icons",
                IsEnabled = false,
                ControlType = ControlType.BinaryToggle,
                RegistrySettings = new List<RegistrySetting>
                {
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.CurrentUser,
                        SubKey = "Software\\Microsoft\\Windows\\CurrentVersion\\Search",
                        Name = "SearchboxTaskbarMode",
                        RecommendedValue = 0,  // For backward compatibility
                        EnabledValue = 2,      // When toggle is ON, search box is shown (2 = show search box)
                        DisabledValue = 0,     // When toggle is OFF, search box is hidden (0 = hide search box)
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 1,      // Default value when registry key exists but no value is set
                        Description = "Controls search box visibility in taskbar",
                        IsPrimary = true,
                        AbsenceMeansEnabled = true
                    }
                }
            },
            new CustomizationSetting
            {
                Id = "taskbar-copilot",
                Name = "Copilot Button",
                Description = "Controls Copilot button visibility in taskbar",
                Category = CustomizationCategory.Taskbar,
                GroupName = "Taskbar Icons",
                IsEnabled = false,
                ControlType = ControlType.BinaryToggle,
                RegistrySettings = new List<RegistrySetting>
                {
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.CurrentUser,
                        SubKey = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
                        Name = "ShowCopilotButton",
                        RecommendedValue = 0,  // For backward compatibility
                        EnabledValue = 1,      // When toggle is ON, Copilot button is shown
                        DisabledValue = 0,     // When toggle is OFF, Copilot button is hidden
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 0,      // Default value when registry key exists but no value is set
                        Description = "Controls Copilot button visibility in taskbar",
                        IsPrimary = true,
                        AbsenceMeansEnabled = true
                    }
                }
            },
            new CustomizationSetting
            {
                Id = "taskbar-left-align",
                Name = "Left Aligned Taskbar",
                Description = "Controls taskbar icons alignment",
                Category = CustomizationCategory.Taskbar,
                GroupName = "Taskbar Behavior",
                IsEnabled = false,
                ControlType = ControlType.BinaryToggle,
                RegistrySettings = new List<RegistrySetting>
                {
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.CurrentUser,
                        SubKey = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
                        Name = "TaskbarAl",
                        RecommendedValue = 0,  // For backward compatibility
                        EnabledValue = 0,      // When toggle is ON, taskbar icons are left-aligned
                        DisabledValue = 1,     // When toggle is OFF, taskbar icons are center-aligned
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 1,      // Default value when registry key exists but no value is set
                        Description = "Controls taskbar icons alignment",
                        IsPrimary = true,
                        AbsenceMeansEnabled = false
                    }
                }
            },
            new CustomizationSetting
            {
                Id = "taskbar-task-view",
                Name = "Task View Button",
                Description = "Controls Task View button visibility in taskbar",
                Category = CustomizationCategory.Taskbar,
                GroupName = "Taskbar Icons",
                IsEnabled = false,
                ControlType = ControlType.BinaryToggle,
                RegistrySettings = new List<RegistrySetting>
                {
                    new RegistrySetting
                    {
                        Category = "Taskbar",
                        Hive = RegistryHive.CurrentUser,
                        SubKey = "Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced",
                        Name = "ShowTaskViewButton",
                        RecommendedValue = 0,  // For backward compatibility
                        EnabledValue = 1,      // When toggle is ON, Task View button is shown
                        DisabledValue = 0,     // When toggle is OFF, Task View button is hidden
                        ValueType = RegistryValueKind.DWord,
                        DefaultValue = 1,      // Default value when registry key exists but no value is set
                        Description = "Controls Task View button visibility in taskbar",
                        IsPrimary = true,
                        AbsenceMeansEnabled = true
                    }
                }
            }
        }
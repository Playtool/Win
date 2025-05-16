ExplorerCustomizations()
{
return new CustomizationGroup
{
Name = "Explorer",
Category = CustomizationCategory.Explorer,
Settings = new List
{
new CustomizationSetting
{
Id = "explorer-3d-objects",
Name = "3D Objects",
Description = "Controls 3D Objects folder visibility in This PC",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = true,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.LocalMachine,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace",
Name = "{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
RecommendedValue = null,
EnabledValue = null, // When toggle is ON, 3D Objects folder is shown (key exists)
DisabledValue = null, // When toggle is OFF, 3D Objects folder is hidden (key removed)
ValueType = RegistryValueKind.None,
DefaultValue = null,
Description = "Controls 3D Objects folder visibility in This PC",
ActionType = RegistryActionType.Remove,
},
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.LocalMachine,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\WOW64",
Name = "{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}",
RecommendedValue = null,
EnabledValue = null, // When toggle is ON, 3D Objects folder is shown (key exists)
DisabledValue = null, // When toggle is OFF, 3D Objects folder is hidden (key removed)
ValueType = RegistryValueKind.None,
DefaultValue = null,
Description =
"Controls 3D Objects folder visibility in This PC (WOW64)",
ActionType = RegistryActionType.Remove,
},
},
LinkedSettingsLogic = LinkedSettingsLogic.All,
},
new CustomizationSetting
{
Id = "explorer-home-folder",
Name = "Home Folder in Navigation Pane",
Description = "Controls Home Folder visibility in Navigation Pane",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.LocalMachine,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace",
Name = "{f874310e-b6b7-47dc-bc84-b9e6b38f5903}",
RecommendedValue = null,
EnabledValue = null, // When toggle is ON, Home Folder is shown (key exists)
DisabledValue = null, // When toggle is OFF, Home Folder is hidden (key removed)
ValueType = RegistryValueKind.None,
DefaultValue = null,
Description = "Controls Home Folder visibility in Navigation Pane",
IsPrimary = true,
AbsenceMeansEnabled = true,
ActionType = RegistryActionType.Remove,
},
},
},
new CustomizationSetting
{
Id = "explorer-launch-to",
Name = "Launch to This PC",
Description = "Controls where File Explorer opens by default",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "LaunchTo",
RecommendedValue = 1, // For backward compatibility
EnabledValue = 1, // When toggle is ON, File Explorer opens to 'This PC'
DisabledValue = 2, // When toggle is OFF, File Explorer opens to 'Quick access'
ValueType = RegistryValueKind.DWord,
DefaultValue = 2, // Default value when registry key exists but no value is set
Description = "Controls where File Explorer opens by default",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new CustomizationSetting
{
Id = "explorer-show-file-ext",
Name = "Show File Extensions",
Description = "Controls visibility of file name extensions",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "HideFileExt",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 0, // When toggle is ON, file extensions are shown
DisabledValue = 1, // When toggle is OFF, file extensions are hidden
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls visibility of file name extensions",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new CustomizationSetting
{
Id = "explorer-folder-tips",
Name = "Folder Tips",
Description = "Controls file size information in folder tips",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "FolderContentsInfoTip",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 1, // When toggle is ON, folder tips are enabled
DisabledValue = 0, // When toggle is OFF, folder tips are disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls file size information in folder tips",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-popup-descriptions",
Name = "Pop-up Descriptions",
Description = "Controls pop-up descriptions for folder and desktop items",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "ShowInfoTip",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 1, // When toggle is ON, pop-up descriptions are shown
DisabledValue = 0, // When toggle is OFF, pop-up descriptions are hidden
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description =
"Controls pop-up descriptions for folder and desktop items",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-preview-handlers",
Name = "Preview Handlers",
Description = "Controls preview handlers in preview pane",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "ShowPreviewHandlers",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 1, // When toggle is ON, preview handlers are enabled
DisabledValue = 0, // When toggle is OFF, preview handlers are disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls preview handlers in preview pane",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-status-bar",
Name = "Status Bar",
Description = "Controls status bar visibility in File Explorer",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "ShowStatusBar",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 1, // When toggle is ON, status bar is shown
DisabledValue = 0, // When toggle is OFF, status bar is hidden
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls status bar visibility in File Explorer",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-show-thumbnails",
Name = "Show Thumbnails",
Description = "Controls whether to show thumbnails or icons",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "IconsOnly",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 0, // When toggle is ON, thumbnails are shown
DisabledValue = 1, // When toggle is OFF, icons are shown
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls whether to show thumbnails or icons",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-translucent-selection",
Name = "Translucent Selection",
Description = "Controls translucent selection rectangle",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "ListviewAlphaSelect",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 1, // When toggle is ON, translucent selection is enabled
DisabledValue = 0, // When toggle is OFF, translucent selection is disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls translucent selection rectangle",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-drop-shadows",
Name = "Drop Shadows",
Description = "Controls drop shadows for icon labels",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "ListviewShadow",
RecommendedValue = 0, // For backward compatibility
EnabledValue = 1, // When toggle is ON, drop shadows are enabled
DisabledValue = 0, // When toggle is OFF, drop shadows are disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls drop shadows for icon labels",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-full-path",
Name = "Full Path in Title Bar",
Description = "Controls full path display in the title bar",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState",
Name = "FullPath",
RecommendedValue = 1,
EnabledValue = 1, // When toggle is ON, full path is shown
DisabledValue = 0, // When toggle is OFF, full path is hidden
ValueType = RegistryValueKind.DWord,
DefaultValue = 1, // Default value when registry key exists but no value is set
Description = "Controls full path display in the title bar",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new CustomizationSetting
{
Id = "explorer-font-smoothing",
Name = "Font Smoothing",
Description = "Controls smooth edges of screen fonts",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Control Panel\Desktop",
Name = "FontSmoothing",
RecommendedValue = "2",
EnabledValue = "2", // When toggle is ON, font smoothing is enabled
DisabledValue = "0", // When toggle is OFF, font smoothing is disabled
ValueType = RegistryValueKind.String,
DefaultValue = "0", // Default value when registry key exists but no value is set
Description = "Controls smooth edges of screen fonts",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new CustomizationSetting
{
Id = "explorer-dpi-scaling",
Name = "DPI Scaling (100%)",
Description = "Controls DPI scaling setting",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Control Panel\Desktop",
Name = "LogPixels",
RecommendedValue = 96,
EnabledValue = 96, // When toggle is ON, DPI scaling is set to 100%
DisabledValue = 120, // When toggle is OFF, DPI scaling is set to 125%
ValueType = RegistryValueKind.DWord,
DefaultValue = 120, // Default value when registry key exists but no value is set
Description = "Controls DPI scaling setting",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new CustomizationSetting
{
Id = "explorer-per-process-dpi",
Name = "Per-Process DPI",
Description = "Controls per-process system DPI",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Control Panel\Desktop",
Name = "EnablePerProcessSystemDPI",
RecommendedValue = 0,
EnabledValue = 1, // When toggle is ON, per-process DPI is enabled
DisabledValue = 0, // When toggle is OFF, per-process DPI is disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 0, // Default value when registry key exists but no value is set
Description = "Controls per-process system DPI",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new CustomizationSetting
{
Id = "explorer-gallery",
Name = "Gallery in Navigation Pane",
Description = "Controls gallery visibility in navigation pane",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.LocalMachine,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace",
Name = "{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}",
RecommendedValue = null,
EnabledValue = null, // When toggle is ON, gallery is shown (key exists)
DisabledValue = null, // When toggle is OFF, gallery is hidden (key removed)
ValueType = RegistryValueKind.None,
DefaultValue = null,
Description = "Controls gallery visibility in navigation pane",
IsPrimary = true,
AbsenceMeansEnabled = true,
ActionType = RegistryActionType.Remove,
},
},
},
new CustomizationSetting
{
Id = "explorer-context-menu",
Name = "Classic Context Menu",
Description = "Controls context menu style (classic or modern)",
Category = CustomizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32",
Name = "",
RecommendedValue = "",
EnabledValue = null, // When toggle is ON, classic context menu is used (value is deleted)
DisabledValue = "", // When toggle is OFF, modern context menu is used (empty value is set)
ValueType = RegistryValueKind.String,
DefaultValue = "", // Default value when registry key exists but no value is set
Description = "Controls context menu style (classic or modern)",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},

###################################################################
ExplorerOptimizations
####################################################################
GetExplorerOptimizations()
{
return new OptimizationGroup
{
Name = "Explorer",
Category = OptimizationCategory.Explorer,
Settings = new List
{
new OptimizationSetting
{
Id = "explorer-long-paths-enabled",
Name = "Long Paths Enabled",
Description = "Controls support for long file paths (up to 32,767 characters)",
Category = OptimizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.LocalMachine,
SubKey = "SYSTEM\CurrentControlSet\Control\FileSystem",
Name = "LongPathsEnabled",
RecommendedValue = 1,
EnabledValue = 1,
DisabledValue = 0,
ValueType = RegistryValueKind.DWord,
DefaultValue = 0,
Description =
"Controls support for long file paths (up to 32,767 characters)",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new OptimizationSetting
{
Id = "explorer-block-aad-workplace-join",
Name = "Block AAD Workplace Join",
Description = "Controls 'Allow my organization to manage my device' pop-up",
Category = OptimizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.LocalMachine,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Policies\System",
Name = "BlockAADWorkplaceJoin",
RecommendedValue = 1,
EnabledValue = 1,
DisabledValue = 0,
ValueType = RegistryValueKind.DWord,
DefaultValue = 0,
Description =
"Controls 'Allow my organization to manage my device' pop-up",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new OptimizationSetting
{
Id = "explorer-disable-sync-provider-notifications",
Name = "Sync Provider Notifications",
Description = "Controls sync provider notifications visibility",
Category = OptimizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "ShowSyncProviderNotifications",
RecommendedValue = 0,
EnabledValue = 1,
DisabledValue = 0,
ValueType = RegistryValueKind.DWord,
DefaultValue = 1,
Description = "Controls sync provider notifications visibility",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new OptimizationSetting
{
Id = "explorer-tablet-mode",
Name = "Tablet Mode",
Description = "Controls Tablet Mode",
Category = OptimizationCategory.Explorer,
GroupName = "System Interface",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Software\Microsoft\Windows\CurrentVersion\ImmersiveShell",
Name = "TabletMode",
RecommendedValue = 0,
EnabledValue = 1, // When toggle is ON, tablet mode is enabled
DisabledValue = 0, // When toggle is OFF, tablet mode is disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 0,
Description = "Controls Tablet Mode",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new OptimizationSetting
{
Id = "explorer-desktop-mode-signin",
Name = "Desktop Mode on Sign-in",
Description = "Controls whether the system goes to desktop mode on sign-in",
Category = OptimizationCategory.Explorer,
GroupName = "System Interface",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Software\Microsoft\Windows\CurrentVersion\ImmersiveShell",
Name = "SignInMode",
RecommendedValue = 1,
EnabledValue = 1, // When toggle is ON, system goes to desktop mode on sign-in
DisabledValue = 0, // When toggle is OFF, system uses default behavior
ValueType = RegistryValueKind.DWord,
DefaultValue = 0,
Description =
"Controls whether the system goes to desktop mode on sign-in",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new OptimizationSetting
{
Id = "explorer-voice-typing",
Name = "Voice Typing Button",
Description = "Controls voice typing microphone button",
Category = OptimizationCategory.Explorer,
GroupName = "Input Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Software\Microsoft\InputSettings",
Name = "IsVoiceTypingKeyEnabled",
RecommendedValue = 0,
EnabledValue = 1, // When toggle is ON, voice typing is enabled
DisabledValue = 0, // When toggle is OFF, voice typing is disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 1,
Description = "Controls voice typing microphone button",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new OptimizationSetting
{
Id = "explorer-typing-insights",
Name = "Typing Insights",
Description = "Controls typing insights and suggestions",
Category = OptimizationCategory.Explorer,
GroupName = "Input Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Software\Microsoft\InputSettings",
Name = "InsightsEnabled",
RecommendedValue = 0,
EnabledValue = 1, // When toggle is ON, typing insights are enabled
DisabledValue = 0, // When toggle is OFF, typing insights are disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 1,
Description = "Controls typing insights and suggestions",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new OptimizationSetting
{
Id = "explorer-suggested-actions",
Name = "Clipboard Suggested Actions",
Description = "Controls suggested actions for clipboard content",
Category = OptimizationCategory.Explorer,
GroupName = "System Interface",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\SmartActionPlatform\SmartClipboard",
Name = "Disabled",
RecommendedValue = 1,
EnabledValue = 0, // When toggle is ON, suggested actions are enabled
DisabledValue = 1, // When toggle is OFF, suggested actions are disabled
ValueType = RegistryValueKind.DWord,
DefaultValue = 0,
Description = "Controls suggested actions for clipboard content",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new OptimizationSetting
{
Id = "explorer-windows-manage-printer",
Name = "Default Printer Management",
Description = "Controls Windows managing default printer",
Category = OptimizationCategory.Explorer,
GroupName = "Printer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Windows",
Name = "LegacyDefaultPrinterMode",
RecommendedValue = 1,
EnabledValue = 0, // When toggle is ON, Windows manages default printer
DisabledValue = 1, // When toggle is OFF, Windows does not manage default printer
ValueType = RegistryValueKind.DWord,
DefaultValue = 0,
Description = "Controls Windows managing default printer",
IsPrimary = true,
AbsenceMeansEnabled = false,
},
},
},
new OptimizationSetting
{
Id = "explorer-disable-snap-assist",
Name = "Snap Assist",
Description = "Controls Snap Assist feature",
Category = OptimizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey =
"Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced",
Name = "SnapAssist",
RecommendedValue = 0,
EnabledValue = 1,
DisabledValue = 0,
ValueType = RegistryValueKind.DWord,
DefaultValue = 1,
Description = "Controls Snap Assist feature",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new OptimizationSetting
{
Id = "explorer-frequent-folders",
Name = "Frequent Folders in Quick Access",
Description = "Controls display of frequent folders in Quick Access",
Category = OptimizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Software\Microsoft\Windows\CurrentVersion\Explorer",
Name = "ShowFrequent",
RecommendedValue = 0,
EnabledValue = 1, // When toggle is ON, frequent folders are shown
DisabledValue = 0, // When toggle is OFF, frequent folders are hidden
ValueType = RegistryValueKind.DWord,
DefaultValue = 1,
Description = "Controls display of frequent folders in Quick Access",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
new OptimizationSetting
{
Id = "explorer-office-files",
Name = "Office Files in Quick Access",
Description = "Controls display of files from Office.com in Quick Access",
Category = OptimizationCategory.Explorer,
GroupName = "File Explorer Settings",
IsEnabled = false,
ControlType = ControlType.BinaryToggle,
RegistrySettings = new List
{
new RegistrySetting
{
Category = "Explorer",
Hive = RegistryHive.CurrentUser,
SubKey = "Software\Microsoft\Windows\CurrentVersion\Explorer",
Name = "ShowCloudFilesInQuickAccess",
RecommendedValue = 0,
EnabledValue = 1, // When toggle is ON, Office.com files are shown
DisabledValue = 0, // When toggle is OFF, Office.com files are hidden
ValueType = RegistryValueKind.DWord,
DefaultValue = 1,
Description =
"Controls display of files from Office.com in Quick Access",
IsPrimary = true,
AbsenceMeansEnabled = true,
},
},
},
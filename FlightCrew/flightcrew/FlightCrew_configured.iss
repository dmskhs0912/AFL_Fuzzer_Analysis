; We use CMake's configure_file command to replace  variables
; with actual values. Note the dollar sign; {VAR_NAME} variables are from
; Inno, the ones with the dollar we define with CMake.

[Setup]
AppName=FlightCrew
AppVerName=FlightCrew 0.9.1
DefaultDirName={pf}\FlightCrew
DefaultGroupName=FlightCrew
UninstallDisplayIcon={app}\FlightCrew-gui.exe
AppPublisher=John Schember
AppPublisherURL=http://code.google.com/p/flightcrew/
WizardImageFile=compiler:wizmodernimage-IS.bmp
WizardSmallImageFile=compiler:wizmodernsmallimage-IS.bmp
Compression=lzma2
SolidCompression=yes  
OutputDir=..\installer
LicenseFile=/home/dmskhs0912/afl_project/FlightCrew/flightcrew-0.9.2/installer/win_installer_note.txt
; WinXP is the lowest supported version
MinVersion=0,5.1
PrivilegesRequired=admin
OutputBaseFilename=FlightCrew-0.9.1-Windows-x64-Setup

; "ArchitecturesAllowed=x64" specifies that Setup cannot run on
; anything but x64.
; The x64 var is substituted with "x64" or an empty string
ArchitecturesAllowed="x64"
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; The x64 var is substituted with "x64" or an empty string
ArchitecturesInstallIn64BitMode="x64"

[Files]
Components: main; Source: "FlightCrew\*.txt"; DestDir: "{app}"; Flags: createallsubdirs recursesubdirs
Components: main; Source: "FlightCrew\*.dll"; DestDir: "{app}"; Flags: createallsubdirs recursesubdirs
Components: main\gui; Source: "FlightCrew\*-gui.exe"; DestDir: "{app}"; Flags: createallsubdirs recursesubdirs
Components: main\cli; Source: "FlightCrew\*-cli.exe"; DestDir: "{app}"; Flags: createallsubdirs recursesubdirs

[Components]
; Main files cannot be unchecked. Doesn't do anything, just here for show
Name: main; Description: "FlightCrew"; Types: full compact custom; Flags: fixed
Name: main\gui; Description: "GUI"; Types: full compact custom; Flags: fixed
Name: main\cli; Description: "CLI"; Types: full
; Desktop icon.
Name: dicon; Description: "Create a desktop icon"; Types: full custom
Name: dicon\common; Description: "For all users"; Types: full custom; Flags: exclusive
Name: dicon\user; Description: "For the current user only"; Flags: exclusive

[Icons]
Name: "{group}\FlightCrew"; Filename: "{app}\FlightCrew-gui.exe"
Name: "{group}\Uninstall FlightCrew"; Filename: "{uninstallexe}"
; Optional desktop icon.
Components: dicon\common; Name: "{commondesktop}\FlightCrew"; Filename: "{app}\FlightCrew-gui.exe"
Components: dicon\user; Name: "{userdesktop}\FlightCrew"; Filename: "{app}\FlightCrew-gui.exe"

Please refer to Windows 10 Autopilot Administrator Guide if you don't know how to use this USB to start autopilot process.

For best experience, use ethernet cable for internet connection. If there is zero drivers installed (e.g. downgraded from Windows 11), use ethernet to USB-A adapter for internet.

If only WiFi is availble, press Shift+F10, then type "start ms-availablenetwork:" (without quotes). Then select the Wifi you want to connect. If "start ms-availablenetwork:" does not work, type "control" (without quotes) then navigate from control panel to connect to wifi. Wifi driver is required.

If there is an error with nuget download, in cmd prompt, type "[net.servicepointmanager]::securityprotocol = [net.securityprotocoltype]::tls12" (without quotes)

If D: does not work, check drive letter by type "wmic logicaldisk get name" (without quotes), then navigate to the right drive.


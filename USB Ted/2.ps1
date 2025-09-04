#https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install
#https://www.tenforums.com/tutorials/96683-create-media-automated-unattended-install-windows-10-a.html#Step2
#https://go.microsoft.com/fwlink/?linkid=2086042

# Get Info to include in upload
# Please find doc A for detailed information 
$tenant = "24433"
$app = "654d718"
$secret = "y0"
#secret ID = b6cbb

#Install package Provider and Script for uploading HardwareHash
Write-Host "Installing required Scripts"
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Script -Name Get-WindowsAutopilotinfo -Confirm:$False -Force

# loop to ensure the right tag is selected
:outer do {
	$type = Read-Host -Prompt 'Enter "1" for Admin image or "2" for Engineering image'
     Switch ($type){
		'1'{
			# write-host "Good 1"
			# $asset = Read-Host -Prompt 'Input the Device Name for Standard image'
			$grouptag = "EPSA_Admin"
			break outer
		}
		'2'{
			# write-host "Bad 2"
			# $asset = Read-Host -Prompt 'Input the Device Name for VIP image'
			$grouptag = "EPSA_Engineering"
			break outer
		}
		default{
			write-host "Invalid. Please choose again"
		}
	}
}while ($True)

#Upload Hardware Hash 
Write-Host "Uploading Hardware Hash"
# .\Get-WindowsAutopilotinfo.ps1 -Online -GroupTag "$grouptag" -TenantId "$tenant" -AppId "$app" -AppSecret "$secret" -AssignedComputerName "$asset"
.\Get-WindowsAutopilotinfo.ps1 -Online -GroupTag "$grouptag" -TenantId "$tenant" -AppId "$app" -AppSecret "$secret" -informationaction continue
#Installing OS Updates and Drivers
Write-Host "Installing OS Updates and Drivers"
# .\UpdateOS.ps1

# shutdown.exe /s /t 10
















































































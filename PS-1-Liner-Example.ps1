#Import the ConfigMgr PowerShell module & witch to ConfigMgr
$snip = $env:SMS_ADMIN_UI_PATH.Length-5
$modPath = $env:SMS_ADMIN_UI_PATH.Substring(0,$snip)
Import-Module "$modPath\ConfigurationManager.psd1"
$SiteCode = Get-PSDrive -PSProvider CMSite
Set-Location "$($SiteCode.Name):\"


$devicename = “Unknown”
Get-CMDevice | Where-Object { ($_.SiteCode -ne $sitecode) -and ($_.Name -eq $devicename) } | Remove-CMDevice -force -confirm:$false
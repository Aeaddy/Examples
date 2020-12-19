<#
Written by Ryan Ephgrave for ConfigMgr 2012 Right Click Tools
http://myitforum.com/myitforumwp/author/ryan2065/
#>

$CompName = $args[0]

$Popup = New-Object -ComObject wscript.shell
$Error.Clear()
$msg = "$CompName responded `n`n"
Test-Connection -ComputerName $CompName -Count 1 | ForEach-Object {
$msg = $msg + "IP Address:  " + $_.ProtocolAddress + "`n"
$msg = $msg + "Bytes Sent:  " + $_.ReplySize + "`n"
$msg = $msg + "Time:  " + $_.ResponseTime + " ms `n"
$msg = $msg + "Time To Live: " + $_.ResponseTimeToLive + " seconds `n"
}

if ($Error[0]){
	$msg = "Error pinging $compname `n Would you like to start a continuous ping?"
	$PopupAnswer = $Popup.popup($msg,0,"Error",1)
}
else {
	$msg = $msg + "`n`n Would you like to start a continuous ping?"
	$PopupAnswer = $Popup.popup($msg,0,"Successful",1)
}

if ($PopupAnswer -eq 1){
	cmd.exe /c start cmd /k ping $CompName -t
}
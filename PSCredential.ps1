﻿$ADID0 = "its\adam"
$ADID1 = [string][char[]][int[]]("80.97.115.115.119.111.114.100.49.50.51".Split(".")) -replace " "
$ADID2 = New-Object -TypeName System.Security.SecureString
$ADID1.ToCharArray() | ForEach-Object {$ADID2.AppendChar($_)}
$ADID3 = new-object -typename System.Management.Automation.PSCredential -argumentlist $ADID0, $ADID2
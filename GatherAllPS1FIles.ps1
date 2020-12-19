$ROOTPATH = "C:\Users\Adam\"
$SOURCEPATH = "C:\All-PS-Scripts"

$DIREXISTS = Test-Path $SOURCEPATH
IF ($DIREXISTS -eq $false) {
New-Item -ItemType Directory $SOURCEPATH
}

$ALLPS = dir "$ROOTPATH\*.ps1" -Recurse
$ALLPS | ForEach-Object {Copy-Item $_ $SOURCEPATH -Force}
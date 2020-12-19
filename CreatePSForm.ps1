#Dropdown for content name
#Auto populate thye export path

#ERASE ALL THIS AND PUT XAML BELOW between the @" "@ 
$inputXML = @" 
<Window 
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        
        mc:Ignorable="d"
        Title="Configuration Manager Content Import/Export" Height="564.345" Width="502.66"> 
        <Grid Margin="0,0,0,8">
        <TextBox x:Name="textBox" HorizontalAlignment="Left" Height="23" Margin="135,170,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="325"/>
        <TextBox x:Name="textBox1" HorizontalAlignment="Left" Height="23" Margin="135,235,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="325"/>
        <Button x:Name="button" Content="Import" HorizontalAlignment="Left" Margin="217,311,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button0" Content="Import" HorizontalAlignment="Left" Margin="217,465,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button1" Content="Import" HorizontalAlignment="Left" Margin="217,414,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button2" Content="Import" HorizontalAlignment="Left" Margin="217,361,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button3" Content="Export" HorizontalAlignment="Left" Margin="338,311,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button4" Content="Export" HorizontalAlignment="Left" Margin="338,465,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button5" Content="Export" HorizontalAlignment="Left" Margin="338,414,0,0" VerticalAlignment="Top" Width="75"/>
        <Button x:Name="button6" Content="Export" HorizontalAlignment="Left" Margin="338,361,0,0" VerticalAlignment="Top" Width="75"/>
        <Label x:Name="label" Content="Package" HorizontalAlignment="Left" Margin="81,313,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="label0" Content="Application" HorizontalAlignment="Left" Margin="81,355,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="label1" Content="Driver Package" HorizontalAlignment="Left" Margin="81,408,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="label2" Content="Task Sequence" HorizontalAlignment="Left" Margin="81,459,0,0" VerticalAlignment="Top" Width="118"/>
        <Label x:Name="label3" Content="Content Name" HorizontalAlignment="Left" Margin="20,167,0,0" VerticalAlignment="Top" Width="99"/>
        <Label x:Name="label4" Content="Content Path" HorizontalAlignment="Left" Margin="20,232,0,0" VerticalAlignment="Top" Width="82"/>
        <Image x:Name="image" HorizontalAlignment="Left" Height="71" Margin="154,22,0,0" VerticalAlignment="Top" Width="185" Source="C:\Users\106226\Pictures\MeijerClear.png"/>
        <Label x:Name="label5" Content="Enter the name of your content." HorizontalAlignment="Left" Height="32" Margin="135,193,0,0" VerticalAlignment="Top" Width="325"/>
        <Label x:Name="label6" Content="Enter the path to your content. " HorizontalAlignment="Left" Height="32" Margin="135,258,0,0" VerticalAlignment="Top" Width="325" RenderTransformOrigin="0.477,2.395"/>
    </Grid>
</Window>
"@       
 
$inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'


[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
#Read XAML
 
    $reader=(New-Object System.Xml.XmlNodeReader $xaml) 
  try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
 
#===========================================================================
# Load XAML Objects In PowerShell
#===========================================================================
 
$xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
 
Function Get-FormVariables{
if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
get-variable WPF*
}
 
Get-FormVariables
 
#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
'$Form.ShowDialog() | out-null'
$Form.ShowDialog() | out-null
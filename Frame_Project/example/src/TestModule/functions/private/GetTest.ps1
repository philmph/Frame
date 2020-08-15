function GetTest
{
    [CmdletBinding()]
    
    param (
        [string]$String
    )
    
    Write-Output $String
}
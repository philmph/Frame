function Get-Test
{
    [CmdletBinding()]
    
    param (
        [string]$String
    )
    
    GetTest -String $String
}
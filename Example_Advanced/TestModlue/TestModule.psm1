<#
############################################################
Author:				Philipp Maier
Author Git:			https://github.com/philmph
Repository:			https://github.com/philmph/Plaster-Template

Filename:			
Creationdate:		25.03.2020

Notes & Usage:
-- Functions
- Create one .ps1 file per function and name it after the function within.
- Sort internal functions into private and the rest into public.

-- Classes
- Create one .ps1 file per class and name it after the class within.
- Add the .ps1 file to the module .psd1 at # ScriptsToProcess @().

Automatically generated module wrapper by PM_SimplePowerShellScriptModule.
############################################################
#>

Write-Verbose -Message "Importing functions for $($MyInvocation.MyCommand.Name)"

$PrivateFunctions = @(Get-ChildItem -Path "$PSScriptRoot\Functions\Private" -Filter "*.ps1")
$PublicFunctions = @(Get-ChildItem -Path "$PSScriptRoot\Functions\Public" -Filter "*.ps1")

foreach ($Function in ($PrivateFunctions + $PublicFunctions)) {
    Write-Verbose -Message "Importing function $($Function.BaseName)"

    try {
        . $Function.FullName
    }
    catch {
        Write-Error -ErrorRecord $_ -ErrorAction Stop
    }
}

Write-Verbose -Message "Exporting functions $($PublicFunctions.BaseName -join ", ")"
Export-ModuleMember -Function $PublicFunctions.BaseName
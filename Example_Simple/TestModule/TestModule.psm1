<#
############################################################
Author:				Philipp Maier
Author Git:			https://github.com/philmph
Repository:			https://github.com/philmph/Plaster-Template

Notes & Usage:
-- Functions
- Create one .ps1 file per function and name it after the function within.
- Sort internal functions into private and the rest into public.

-- Classes & Enums
- Create one .ps1 file per class / enum and name it after the class / enum within.
- Add the .ps1 file to the module .psd1 at # ScriptsToProcess @().

Automatically generated module wrapper by PM_SimplePowerShellScriptModule.
############################################################
#>

Write-Verbose -Message "Importing functions for $($MyInvocation.MyCommand.Name)"

$Functions = @(Get-ChildItem -Path "$PSScriptRoot\Functions" -Filter "*.ps1" -Recurse)
$PublicFunctions = $Functions | Where-Object { $_.FullName -match "\\Functions\\Public\\" }

foreach ($Function in $Functions) {
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
<#
############################################################
Author:				Philipp Maier
Author Git:			https://github.com/philmph
Repository:			https://github.com/philmph/Plaster-Template

Filename:			PlasterHelp.ps1
Creationdate:		26.11.2019
############################################################
#>

function New-PMPlasterTemplate
{
    [CmdletBinding()]
    
    param(
        [string]$Path = $PSScriptRoot,
    
        [Parameter(Mandatory)]
        [ValidatePattern('^\w+$')]
        [string]$TemplateName,
    
        [Parameter(Mandatory)]
        [string]$Title,
    
        [string]$Author = 'Philipp Maier'
    )
    
    begin {
        Set-StrictMode -Version 3

        Import-Module -Name Plaster -MinimumVersion 1.1.3 -ErrorAction Stop
    }
    
    process {
        $Directory = New-Item -Path $Path -Name $TemplateName -ItemType Directory -Force
        $TemplatePath = '{0}\plasterManifest.xml' -f $Directory.FullName

        $NewPlasterManifestArgs = @{
            Path = $TemplatePath
            TemplateName = $TemplateName
            TemplateType = 'Project'
            TemplateVersion = '0.0.1'
            Title = $Title
            Author = $Author
        }

        New-PlasterManifest @NewPlasterManifestArgs
    }
    
    end {}
}
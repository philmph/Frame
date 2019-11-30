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
        [Parameter(Mandatory)]
        [ValidateScript({
            if (Test-Path -Path $_ -PathType Container) {
                $true
            }
            else {
                throw "Not a valid path: '$_'"
            }
        })]
        [string]$Path,
    
        [Parameter(Mandatory)]
        [ValidatePattern('^\w+$')]
        [string]$TemplateName,
    
        [Parameter(Mandatory)]
        [string]$Author,
    
        [Parameter(Mandatory)]
        [string]$Title
    )
    
    begin {
        Set-StrictMode -Version 3

        Import-Module -Name Plaster -MinimumVersion 1.1.3 -ErrorAction Stop
    }
    
    process {
        $Directory = New-Item -Path $Path -Name $TemplateName -ItemType Directory -ErrorAction Stop
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

function Invoke-PMPlaster
{
    [CmdletBinding(SupportsShouldProcess)]
    
    param (
        [Parameter(Mandatory)]
        [ValidateScript({
            if (Test-Path -Path "$_\plasterManifest.xml" -PathType Leaf) {
                if (([xml](Get-Content -Path "$_\plasterManifest.xml")).plasterManifest.metadata.id -eq 'd4e8f9e6-3dbd-4ee9-9e10-6ead8adc26f0') {
                    $true
                }
                else {
                    throw "Template 'PM_AdvancedPowerShellScriptModule' not found"
                }
            }
            else {
                throw "Templatepath '$_' not found"
            }
        })]
        [string]$TemplatePath,

        [Parameter(Mandatory)]
        [ValidateScript({
            if (Test-Path -Path $_ -PathType Container) {
                $true
            }
            else {
                throw "Not a valid path: '$_'"
            }
        })]
        [string]$DestinationPath,
    
        [Parameter(Mandatory)]
        [string]$AuthorName,
    
        [Parameter(Mandatory)]
        [System.Net.Mail.MailAddress]$AuthorEmail,

        [Parameter(Mandatory)]
        [ValidatePattern('^\w+$')]
        [string]$ModuleName,

        [Parameter(Mandatory)]
        [ValidateLength(0, 255)]
        [string]$ModuleDescription,

        [version]$ModuleVersion = '0.0.1',
        [switch]$VSCode,
        [switch]$Tests,
        [switch]$Builds
    )
    
    begin {
        Set-StrictMode -Version 3

        Import-Module -Name Plaster -MinimumVersion 1.1.3 -ErrorAction Stop
    }
    
    process {
        New-Item -Path $DestinationPath -Name $ModuleName -ItemType Directory -ErrorAction Stop

        $InvokePlasterArgs = @{
            TemplatePath = $TemplatePath
            DestinationPath = (Join-Path -Path $DestinationPath -ChildPath $ModuleName)
            AuthorName = $AuthorName
            AuthorEmail = $AuthorEmail.Address
            ModuleName = $ModuleName
            ModuleDescription = $ModuleDescription
            ModuleVersion = $ModuleVersion
            VSCode = -not $VSCode
            Tests = -not $Tests
            Builds = -not $Builds
        }

        Write-Verbose ([PSCustomObject]$InvokePlasterArgs)

        if ($PSCmdlet.ShouldProcess($InvokePlasterArgs['DestinationPath'], 'Invoke-PlasterManifest')) {
            Invoke-Plaster @InvokePlasterArgs
        }
    }
    
    end {}
}
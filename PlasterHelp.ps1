<#
############################################################
Author:				Philipp Maier
Author Git:			https://github.com/philmph
Repository:			https://github.com/philmph/Plaster-Template

Filename:			PlasterHelp.ps1
Creationdate:		26.11.2019

Notes & Usage:
Call script to generate an empty Plaster manifest
############################################################
#>

param(
    [string]$Path = "$PSScriptRoot",

    [Parameter(Mandatory)]
    [ValidatePattern('^\w+$')]
    [string]$TemplateName,

    [Parameter(Mandatory)]
    [string]$Title,

    [string]$Author = 'Philipp Maier'
)

Import-Module -Name Plaster -MinimumVersion 1.1.3 -ErrorAction Stop

$Directory = New-Item -Path $Path -Name $TemplateName -ItemType Directory -Force
$TemplatePath = '{0}\{1}.xml' -f $Directory.FullName, $TemplateName

$NewPlasterManifestArgs = @{
    Path = $TemplatePath
    TemplateName = $TemplateName
    TemplateType = 'Project'
    TemplateVersion = '0.0.1'
    Title = $Title
    Author = $Author
}

New-PlasterManifest @NewPlasterManifestArgs
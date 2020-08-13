# Plaster-Template

In this repository i will be storing my plaster templates which i will be using for future projects.

## Usage

1. Install Plaster version >1.1.3 on your system. You can achieve this by running ```Install-Module -Name Plaster -Scope CurrentUser``` in a PowerShell session.
2. Clone or download the sourcecode from this GIT repository.
3. Choose your desired project type (Simple or Advanced)
4. Save the path to in a variable by running ```$Path = "C:\Downloads\Plaster-Templates\PM_SimplePowerShellScriptModule"```. Note: Do not save the path to the .xml definition file in the variable.
5. Execute Plaster with a desired destination ```Invoke-Plaster -TemplatePath $Path -DestinationPath C:\MyModule```.
6. Follow the onscreen instructions.

## Example

```powershell
PS [7.0.3] C:\> $Path = "C:\Users\maierp\Documents\git\personal\Plaster-Templates"
PS [7.0.3] C:\> Invoke-Plaster -TemplatePath "$Path\PM_AdvancedPowerShellProject" -DestinationPath "$Path\.testing\"
  ____  _           _
 |  _ \| | __ _ ___| |_ ___ _ __
 | |_) | |/ _` / __| __/ _ \ '__|
 |  __/| | (_| \__ \ ||  __/ |
 |_|   |_|\__,_|___/\__\___|_|
                                            v1.1.3
==================================================
Author name: Philipp Maier
Author company: pmaier
Name of your project: Testproject
Description of your project: This is a project
Name of your powershell script module: Testmodule
Description of your powershell script module: This is a module
Initial project and powershell script module version (0.0.1):
Using VS Code as editor
[T] True  [F] False  [?] Help (default is "T"): t
Include Pester tests
[T] True  [F] False  [?] Help (default is "T"): t
Do you want to add the MIT license
[T] True  [F] False  [?] Help (default is "T"): t
Destination path: C:\Users\maierp\Documents\git\personal\Plaster-Templates\.testing\
Creating folder structure
   Create Testproject\Testmodule\Classes\
   Create Testproject\Testmodule\Enums\
   Create Testproject\Testmodule\Functions\Private\
   Create Testproject\Testmodule\Functions\Public\
Deploying common files
   Create Testproject\Testmodule\Testmodule.psm1
   Create Testproject\Testmodule\Testmodule.psd1
Creating advanced environment
   Create Testproject\.vscode\settings.json
   Create Testproject\Docs\Images\
   Create Testproject\Docs\CHANGELOG.md
  Missing The required module Pester (minimum version: 5.2.0) was not found.
          PowerShell Module Pester version is to low (<5.2.0) or not installed. Tests might not work in this environment.
  Missing The required module PSScriptAnalyzer (minimum version: 1.19.1) was not found.
          PowerShell Module PSScriptAnalyzer version is to low (<1.19.1) or not installed. Tests might not work in this environment.
   Create Testproject\Tests\PSScriptAnalyzerSettings.ps1
   Create Testproject\Tests\Predefined.Tests.ps1
   Create Testproject\LICENSE
   Create Testproject\.gitignore
   Create Testproject\README.md
PS [7.0.3] C:\>
```

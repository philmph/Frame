# Plaster-Template

In this repository i will be storing my plaster templates which i will be using for future projects.

## Usage

1. Install Plaster version >1.1.3 on your system. You can achieve this by running ```Install-Module -Name Plaster -Scope CurrentUser``` in a PowerShell session.
2. Clone or download the sourcecode from this GIT repository.
3. Choose your desired project type (Simple or Advanced)
4. Save the path to in a variable by running ```$Path = "C:\Downloads\Plaster-Template\PM_SimplePowerShellScriptModule"```. Note: Do not save the path to the .xml definition file in the variable.
5. Execute Plaster with a desired destination ```Invoke-Plaster -TemplatePath $Path -DestinationPath C:\MyModule```.
6. Follow the onscreen instructions.

## Example

```powershell
$Path = "D:\Daten\GIT\Private\Plaster-Template\PM_SimplePowerShellScriptModule"
Invoke-Plaster -TemplatePath $Path -DestinationPath C:\Daten\GIT\Private\MyModule
  ____  _           _
 |  _ \| | __ _ ___| |_ ___ _ __
 | |_) | |/ _` / __| __/ _ \ '__|
 |  __/| | (_| \__ \ ||  __/ |
 |_|   |_|\__,_|___/\__\___|_|
                                            v1.1.3
==================================================
Author name: Philipp Maier
Author company:
Name of your module: MyModule
Description of your module: This is a test module
Initial module version (0.0.1):
Destination path: C:\Daten\GIT\Private\MyModule
Creating folder structure
   Create MyModule\Classes\
   Create MyModule\Functions\Private\
   Create MyModule\Functions\Public\
   Create MyModule\MyModule.psm1
   Create MyModule\MyModule.psd1
```

## Open Tasks

- [ ] Add Help
- [ ] Enrich Advanced Module

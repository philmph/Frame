# Frame

<p align="center"><img src="./docs/images/frame.png"></p>

## About

In this repository I will be storing my personal [Plaster](https://github.com/PowerShell/Plaster) templates which I will be using in future projects.

This project was renamed to **Frame** as of 15.08.2020.

## Installation

1. Install Plaster version >1.1.3 on your system. You can achieve this by running ```Install-Module -Name Plaster -Scope CurrentUser``` in a PowerShell.
2. Clone or download the sourcecode from this git repository.
3. Choose your desired type (ScriptModule or Project)
4. Save the path to in a variable by running ```$Path = "C:\Frame\"```. Note: Do not save the path to the .xml definition file in the variable.
5. Execute Plaster with a desired destination ```Invoke-Plaster -TemplatePath $Path -DestinationPath C:\MyDesiredDestination```.
6. Follow the onscreen instructions.

## Examples

Will be added soon.

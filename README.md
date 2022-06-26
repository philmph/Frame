# Frame

**Note**: This project is not actively maintained by me due to moving away from PowerShell development.

Feel free to use this code if you consider it useful.

<p align="center"><img src="./docs/images/frame.png"></p>

## About

The idea of **Frame** is to standardize the scaffolding process of PowerShell **Projects** and **ScriptModules**. The templates reflect my opinion on how [PowerShell Modules](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module) should look like. The project is based on the PowerShell module [Plaster](https://github.com/PowerShell/Plaster).

## Installation

1. Install Plaster version >1.1.3 on your system. You can achieve this by running `Install-Module -Name Plaster -Scope CurrentUser` in PowerShell.
2. Clone or download the sourcecode from this git repository.
3. Choose your desired type (ScriptModule or Project).
4. Save the path to the `Project` or `Scriptmodule` folder in a variable by running f.e. `$Path = "C:\Frame\Project"`.
   _Note: Do not save the path to the .xml definition file in the variable._
5. Execute Plaster with a desired destination `Invoke-Plaster -TemplatePath $Path -DestinationPath C:\MyDesiredDestination`.
6. Follow the onscreen instructions.

## Usage

TODO

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Authors and acknowledgment

- Philipp Maier [@philmph](https://github.com/philmph)

## License

[MIT License](LICENSE)

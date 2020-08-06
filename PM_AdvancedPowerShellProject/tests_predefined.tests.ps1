$ModuleName = "<%=$PLASTER_PARAM_ModuleName%>"
$ModuleRoot = Resolve-Path "$PSScriptRoot\..\$ModuleName"
$Functions = Get-ChildItem "$ModuleRoot\Functions" -Recurse -Filter *.ps1

Write-Verbose -Message "Moduleroot is '$ModuleRoot'" -Verbose
Write-Verbose -Message "Functions are '$($Functions.Name -join ';')'" -Verbose

Describe "Module Tests" {
    $script:ModuleManifestPath = "$ModuleRoot\$ModuleName.psd1"
    Write-Verbose -Message "Module manifest path is '$($script:ModuleManifestPath)'"

        It "Manifest passes Test-ModuleManifest" {
            Test-ModuleManifest -Path $script:ModuleManifestPath | Should -Not -BeNullOrEmpty
            $? | Should -Be $true
    }
}

Describe "PSScriptAnalyzer Tests" {
    # Using .ps1 instead of .psd1 recommendation to import the settings
    # via dot-sourcing the hashtable in the file. Only works with whitelisting.
    $SettingsFile = Resolve-Path "$PSScriptRoot\PSScriptAnalyzerSettings.ps1"
    Write-Verbose -Message "Settingsfile path is '$($SettingsFile)'"

    $Rules = (. $SettingsFile)["IncludeRules"]
    Write-Verbose -Message "Selected PSScriptAnalyzer rules are $($Rules -join ';')"

    foreach ($Function in $Functions) {
        Context "Testing $($Function.Name)" {
            $Result = @(Invoke-ScriptAnalyzer -Path $Function.FullName -Settings $SettingsFile)

            foreach ($Rule in $Rules) {
                It "Should pass PSScriptAnalyzer rule [$Rule]" {
                    $Result |
                    Where-Object { $Rule -eq $_.RuleName } |
                    Select-Object -ExpandProperty Message |
                    Should -BeNullOrEmpty
                }
            }
        }
    }
}

Describe "Function Tests" {
    foreach ($File in $Functions) {
        Context "Testing $($File.Name)" {
            $FunctionPattern = "^\s*Function\s+"

            # Test if current function is a public or private via it's path
            switch -regex ($File.FullName) {
                "\\Private\\" {
                    $Type = "Private"
                    $Pattern = "^\s*[Ff]unction\s+(([A-Z]{1,4}[a-z\d]+)+)(\s+\{)?$"
                }

                "\\Public\\" {
                    $Type = "Public"
                    $Pattern = "^\s*[Ff]unction\s+([A-Z]{1,4}[a-z]+\-([A-Z]{1,4}[a-z\d]+)+)(\s+\{)?$"
                }
            }

            $FunctionCount = @(Select-String -Path $File.FullName -Pattern $FunctionPattern)
            $FunctionMatches = @(Select-String -Path $File.FullName -Pattern $Pattern -CaseSensitive)

            It "Should be one function" {
                $FunctionCount.Count | Should -Be 1
            }

            # Checking naming standard is irrelevant when more functions exist
            if ($FunctionCount.Count -eq 1) {
                It "Should fit naming standards for $Type functions" {
                    $FunctionMatches.Count | Should -Be 1
                }

                # Checking .ps1 file name is irrelevant when function naming isn't legit
                if ($FunctionMatches.Count -eq 1) {
                    It "Should equal it's .ps1 file name" {
                        $FunctionMatches.Matches[0].Groups[1].Value | Should -Be $File.BaseName
                    }
                }
            }
        }
    }
}

# TODO Classes
# TODO Enums
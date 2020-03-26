$ModuleName = "TestModule"
$ModuleRoot = "$PSScriptRoot\..\$ModuleName"
$Functions = Get-ChildItem "$ModuleRoot\Functions" -Recurse -Filter *.ps1

Describe "Module Tests" {
    $ModuleManifestPath = "$ModuleRoot\$ModuleName.psd1"

    It "Manifest passes Test-ModuleManifest" {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}

Describe "PSScriptAnalyzer Tests" {
    $Rules = Get-ScriptAnalyzerRule

    foreach ($File in $Functions) {
        Context "Testing $($File.Name)" {
            foreach ($Rule in $Rules) {
                It "Should pass PSScriptAnalyzer rule [$($Rule.RuleName)]" {
                    $Result = @(Invoke-ScriptAnalyzer -Path $File.FullName -IncludeRule $Rule.RuleName)
                    $Result.Count | Should Be 0
                }
            }
        }
    }
}

Describe "Function Tests" {
    foreach ($File in $Functions) {
        # Moved to PSScriptAnalyzer
        # $Verbs = "^($((Get-Verb).Verb -join "|"))$"
        
        Context "Testing $($File.Name)" {
            $FunctionMatches = @(Select-String -Path $File.FullName -Pattern "^Function ([A-Z]+\-[A-Z\d]+)")

            It "Should be one function" {
                $FunctionMatches.Count | Should Be 1
            }
    
            It "Function name should equal .ps1 file name" {
                $FunctionMatches.Matches[0].Groups[1].Value | Should Be $File.BaseName
            }
    
            <# It "Function uses a valid PowerShell verb" {
                # Saving outcome to $ValidVerb so failing pester test doesn't spam console with all verbs
                $ValidVerb = ($FunctionMatches.Matches[0].Groups[1].Value).Split("-")[0] -match $Verbs
                $ValidVerb | Should Be $true
            } #>
        }
    }
}
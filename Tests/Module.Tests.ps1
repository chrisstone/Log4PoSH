

### Basic Definitions

$Module = Get-ChildItem -Filter "*.psm1" -Path (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)) -Recurse -Depth 1

$Script:ModuleName = ($Module -split '\.')[0]
$Script:ModulePath = Split-Path -Path $Module.FullName -Parent


Describe "Module" {

	Context 'Setup' {

		It "File Exists" {
			"$ModulePath\$ModuleName.psm1" | Should -Exist
		}

		It "Parse" {
			$psFile = Get-Content -Path "$ModulePath\$ModuleName.psm1" -ErrorAction Stop
			$errors = $null
			$null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
			$errors.Count | Should -Be 0
		}

		It "Manifest" {
			"$ModulePath\$ModuleName.psd1" | Should -Exist
		}

		It "Loads" {
			$Import = Import-Module -Name "$ModulePath\$ModuleName.psm1" -Force -ErrorAction SilentlyContinue -PassThru 3>$null
			$Import.Count | Should -Be 1
		}
	}



	Import-Module -Name "$ModulePath\$ModuleName.psm1" -Force -ErrorAction SilentlyContinue
	$Functions = Get-Command -Module $ModuleName -CommandType Function

	Foreach ($Func in $Functions.Name) {
		Context "Function $Func" {

			It "File Exists" -TestCases @{Path = $Func} {
				Param ( $Path )
				"$ModulePath\Public\$Path.ps1" | Should -Exist
			}

			It "Help" -TestCases @{Path = $Func} -Pending {
				Param ( $Path )
				"$ModulePath\Public\$Path.ps1" | Should -FileContentMatch '<#'
				"$ModulePath\Public\$Path.ps1" | Should -FileContentMatch '#>'
			}
		}
	}
}

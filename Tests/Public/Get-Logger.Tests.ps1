Describe 'Get-Logger' {
	BeforeAll {
		. .\Log4PoSH\Public\Initialize-Logger.ps1
		. .\Log4PoSH\Public\Get-Logger.ps1
	}

	Context 'When the function is called without parameters' {
		BeforeAll {
			$result = Get-Logger
		}

		It 'Returns an object of the correct type' {
			$result | Should -BeOfType log4net.Core.LogImpl
		}

		It 'Has the default logger name (root)' {
			$result.Logger.Name | Should -Be 'root'
		}
	}

	Context 'When the function is called with a specific logger name' {
		BeforeAll {
			$loggerName = 'CustomLogger'
			$result = Get-Logger -Name $loggerName
		}

		It 'Returns an object of the correct type' {
			$result | Should -BeOfType log4net.Core.LogImpl
		}

		It "Has the specified logger name ($loggerName)" {
			$result.Logger.Name | Should -Be $loggerName
		}
	}
}

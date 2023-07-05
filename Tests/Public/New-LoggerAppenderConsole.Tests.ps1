

Describe 'New-LoggerAppenderConsole' {
	BeforeAll {
		. .\Log4PoSH\Public\Initialize-Logger.ps1
		. .\Log4PoSH\Public\New-LoggerAppenderConsole.ps1
	}

	Context 'When the function is called' {
		BeforeAll {
			$result = New-LoggerAppenderConsole
		}

		It 'Returns an object of the correct type' {
			$result | Should -BeOfType log4net.Appender.ConsoleAppender
		}

		It 'Has Target set to Console.Out' {
			$result.Target | Should -Be 'Console.Out'
		}

		It 'Has Layout set to null' {
			$result.Layout | Should -BeNullOrEmpty
		}
	}
}



Describe 'New-LoggerAppenderConsole' {
	BeforeAll {
		. .\Log4PoSH\Public\Initialize-Logger.ps1
		. .\Log4PoSH\Public\New-LoggerAppenderConsole.ps1
	}

	Context 'When the function is called' {
		BeforeAll {
			$result = New-LoggerAppenderConsole -Layout (New-LoggerLayoutPattern -ConversionPattern '[%date{yyyy-MM-dd HH:mm:ss.fff}] [%level] %message%n')
		}

		It 'Returns an object of the correct type' {
			$result | Should -BeOfType log4net.Appender.ConsoleAppender
		}

		It 'Has Target set to Console.Out' {
			$result.Target | Should -Be 'Console.Out'
		}

		It 'Has a Layout' {
			$result.Layout | Should -Not -BeNullOrEmpty
		}
	}
}

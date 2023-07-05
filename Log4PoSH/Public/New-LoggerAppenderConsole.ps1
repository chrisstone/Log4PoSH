<#
.SYNOPSIS
    Creates a new console appender for log4net logger
.FUNCTIONALITY
    Logging
.DESCRIPTION
    This function creates a new instance of log4net.Appender.ConsoleAppender
.PARAMETER Target
    The target of the appender, can be 'Console.Out' or 'Console.Error'. Defaults to 'Console.Out'
.PARAMETER Layout
    The layout that the appender will use to format log messages. Must be of type [log4net.Layout.ILayout]
.EXAMPLE
    $layout = New-LoggerLayoutPattern -ConversionPattern "%-5p %d{yyyy-MM-dd hh:mm:ss} - %m%n"
    New-LoggerAppenderConsole -Target 'Console.Error' -Layout $layout
.LINK
    https://logging.apache.org/log4net/log4net-1.2.13/sdk/log4net.Appender.ConsoleAppender.Target.html
#>
function New-LoggerAppenderConsole {
	Param (
		[ValidateSet('Console.Out', 'Console.Error')]
		[string]											$Target = 'Console.Out',
		[Parameter(Mandatory = $true)]
		[log4net.Layout.ILayout]							$Layout,

		[log4net.Core.Level]								$Threshold
	)

	Begin {
		If ($null -eq ([System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { ($_.FullName -split ',')[0] -match 'log4net' })) {
			Initialize-Logger
		}
	}

	Process {
		$consoleAppender = New-Object log4net.Appender.ConsoleAppender
		$consoleAppender.Target = $Target
		$consoleAppender.Layout = $Layout

		if ($null -ne $Threshold) {
			$consoleAppender.Threshold = $Threshold
		}

		return $consoleAppender
	}
}

Export-ModuleMember -Function New-LoggerAppenderConsole

<#
.SYNOPSIS
Creates a new ConsoleAppender instance.

.DESCRIPTION
The New-LoggerAppenderConsole function creates a new ConsoleAppender instance using log4net.

.EXAMPLE
New-LoggerAppenderConsole

This command creates a new ConsoleAppender instance.

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function New-LoggerAppenderConsole {
	Begin {
		If ($null -eq ([System.AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { ($_.FullName -split ',')[0] -match 'log4net' })) {
			Initialize-Logger
		}
	}
	Process {
		return New-Object log4net.Appender.ConsoleAppender
	}
}
Export-ModuleMember -Function New-LoggerAppenderConsole

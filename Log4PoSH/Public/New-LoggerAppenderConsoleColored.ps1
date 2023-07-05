<#
.SYNOPSIS
Creates a new ColoredConsoleAppender.

.DESCRIPTION
The New-LoggerAppenderConsoleColored function creates a new ColoredConsoleAppender using log4net.

.PARAMETER LevelColors
A hashtable where the keys are a member of log4net.Core.Level, and the value is a member of log4net.Appender.ColoredConsoleAppender+Colors.

.PARAMETER Target
The target to which the appender should write. Can be "Console.Out" or "Console.Error".

.EXAMPLE
New-LoggerAppenderConsoleColored -LevelColors @{ "INFO" = "Green"; "WARN" = "Yellow"; "ERROR" = "Red" } -Target "Console.Error"

This command creates a new ColoredConsoleAppender with specific color settings for different levels and writes to "Console.Error".

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function New-LoggerAppenderConsoleColored {
	Param (
		[Parameter(Mandatory = $false)]
		[hashtable] $LevelColors,

		[Parameter(Mandatory = $false)]
		[ValidateSet("Console.Out", "Console.Error")]
		[string] $Target = "Console.Out"
	)

	# Create a new ColoredConsoleAppender
	$coloredConsoleAppender = New-Object log4net.Appender.ColoredConsoleAppender

	# Set the target
	$coloredConsoleAppender.Target = $Target

	# Add mappings
	if ($null -ne $LevelColors) {
		foreach ($entry in $LevelColors.GetEnumerator()) {
			$mapping = New-Object log4net.Appender.ColoredConsoleAppender+LevelColors
			$mapping.Level = [log4net.Core.Level]::$entry.Key
			$mapping.ForeColor = [log4net.Appender.ColoredConsoleAppender+Colors]::$entry.Value
			$coloredConsoleAppender.AddMapping($mapping)
		}
	}

	# Activate the changes
	$coloredConsoleAppender.ActivateOptions()

	return $coloredConsoleAppender
}
Export-ModuleMember -Function New-LoggerAppenderConsoleColored

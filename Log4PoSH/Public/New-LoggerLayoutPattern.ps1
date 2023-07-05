<#
.SYNOPSIS
Creates a new PatternLayout.

.DESCRIPTION
The New-LoggerLayoutPattern function creates a new PatternLayout using log4net.

.PARAMETER ConversionPattern
The conversion pattern to use for this layout.

.EXAMPLE
New-LoggerLayoutPattern -ConversionPattern "%-4timestamp [%thread] %-5level %logger %ndc - %message%newline"

This command creates a new PatternLayout with the conversion pattern set to "%-4timestamp [%thread] %-5level %logger %ndc - %message%newline".

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function New-LoggerLayoutPattern {
	Param (
		[Parameter(Mandatory = $true)]
		[string] $ConversionPattern
	)

	# Create a new PatternLayout
	$patternLayout = New-Object log4net.Layout.PatternLayout

	# Set the conversion pattern
	$patternLayout.ConversionPattern = $ConversionPattern

	# Activate the changes
	$patternLayout.ActivateOptions()

	return $patternLayout
}
Export-ModuleMember -Function New-LoggerLayoutPattern

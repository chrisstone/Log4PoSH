<#
.SYNOPSIS
Resets the logger configuration.

.DESCRIPTION
The Reset-Logger function resets the logger configuration using log4net.

.EXAMPLE
Reset-Logger

This command resets the logger configuration.

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function Reset-Logger {
	[log4net.LogManager]::ResetConfiguration();
}
Export-ModuleMember -Function Reset-Logger

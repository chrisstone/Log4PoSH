<#
.SYNOPSIS
Sets the basic configuration for a logger.

.DESCRIPTION
The Set-LoggerConfigBasic function sets the basic configuration for a logger using log4net.

.PARAMETER Logger
The logger to be configured. This parameter can be provided through the pipeline.

.PARAMETER Appender
An array of appenders to be configured.

.PARAMETER Repository
An array of repositories to be configured.

.EXAMPLE
$logger = New-Logger
Set-LoggerConfigBasic -Logger $logger

This command sets the basic configuration of the specified logger.

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function Set-LoggerConfigBasic {
	Param (
		[object[]] $Appender,
		[object[]] $Repository
	)

	Process {
		if ($null -eq $Appender -and $null -eq $Repository) {
			[log4net.Config.BasicConfigurator]::Configure()
		} elseif ($null -eq $Appender) {
			[log4net.Config.BasicConfigurator]::Configure($Repository)
		} elseif ($null -eq $Repository) {
			[log4net.Config.BasicConfigurator]::Configure($Appender)
		} else {
			[log4net.Config.BasicConfigurator]::Configure($Repository, $Appender)
		}
	}
}
Export-ModuleMember -Function Set-LoggerConfigBasic

<#
.SYNOPSIS
Creates a new RemoteSyslogAppender.

.DESCRIPTION
The New-LoggerAppenderRemoteSyslog function creates a new RemoteSyslogAppender using log4net.

.PARAMETER Facility
The syslog facility to use when logging messages.

.PARAMETER Identity
The identity of the application using the RemoteSyslogAppender.

.EXAMPLE
New-LoggerAppenderRemoteSyslog -Facility "USER" -Identity "MyApp"

This command creates a new RemoteSyslogAppender with the USER facility and the identity set to "MyApp".

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function New-LoggerAppenderRemoteSyslog {
	Param (
		[Parameter(Mandatory = $true)]
		[ValidateSet("KERN", "USER", "MAIL", "DAEMON", "AUTH", "SYSLOG", "LPR", "NEWS", "UUCP", "CRON", "AUTHPRIV", "FTP", "NTP", "AUDIT", "ALERT", "CLOCK", "LOCAL0", "LOCAL1", "LOCAL2", "LOCAL3", "LOCAL4", "LOCAL5", "LOCAL6", "LOCAL7")]
		[string] $Facility,

		[Parameter(Mandatory = $true)]
		[string] $Identity,

		[Parameter(Mandatory = $true)]
		[log4net.Layout.ILayout]							$Layout,

		[log4net.Core.Level]								$Threshold
	)

	# Create a new RemoteSyslogAppender
	$remoteSyslogAppender = New-Object log4net.Appender.RemoteSyslogAppender
	$remoteSyslogAppender.Facility = $Facility
	$remoteSyslogAppender.Identity = $Identity
	$remoteSyslogAppender.Layout = $Layout

	if ($null -ne $Threshold) {
		$remoteSyslogAppender.Threshold = $Threshold
	}

	return $remoteSyslogAppender
}
Export-ModuleMember -Function New-LoggerAppenderRemoteSyslog

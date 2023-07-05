<#
.SYNOPSIS
Imports the logger configuration from either a basic setup, an XML object, or a file path.

.DESCRIPTION
This function configures the logger based on the parameters provided.
There are three different ways to import the logger configuration:
- Using a basic configuration with the '-Basic' switch
- Using an XML configuration with the '-Xml' parameter
- Using a configuration file with the '-Path' parameter

.PARAMETER Basic
A switch parameter to use the basic configuration. No value is required.

.PARAMETER Xml
An XML configuration object for the logger. This should be a valid XML object representing the configuration for the logger.

.PARAMETER Path
A file path to an XML configuration file. This should be a valid path to a file containing the XML configuration for the logger.

.EXAMPLE
Import-LoggerConfig -Basic

This command configures the logger with a basic configuration.

.EXAMPLE
Import-LoggerConfig -Xml $xmlConfig

This command configures the logger with the given XML configuration.

.EXAMPLE
Import-LoggerConfig -Path "C:\path\to\config.xml"

This command configures the logger with the XML configuration in the file at the given path.
#>
function Import-LoggerConfig {
	Param(
		[Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'Basic')]
		[switch]	$Basic,
		[Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'Xml')]
		[xml]		$Xml,
		[Parameter(Position = 0, Mandatory = $true, ParameterSetName = 'Path')]
		[string]	$Path
	)
	Switch ($PsCmdlet.ParameterSetName) {
		'Basic' { [log4net.Config.BasicConfigurator]::Configure(); Break }
		'Xml'	{ [log4net.Config.XmlConfigurator]::Configure($Xml.DocumentElement -as [System.Xml.XmlElement]); Break }
		'Path'	{ [log4net.Config.XmlConfigurator]::Configure($Path -as [System.IO.FileInfo]); Break }
	}
}
Export-ModuleMember -Function Import-LoggerConfig

#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.5 2020-06-11T18:17:17.911Z



function Import-LoggerConfig {
Param(
	[Parameter(Position=0,Mandatory=$true,ParameterSetName='Basic')]
	[switch]	$Basic,
	[Parameter(Position=0,Mandatory=$true,ParameterSetName='Xml')]
	[xml]		$Xml,
	[Parameter(Position=0,Mandatory=$true,ParameterSetName='Path')]
	[string]	$Path
)
	Switch ($PsCmdlet.ParameterSetName) {
		'Basic' { [log4net.Config.BasicConfigurator]::Configure(); Break }
		'Xml'	{ [log4net.Config.XmlConfigurator]::Configure($Xml.DocumentElement -as [System.Xml.XmlElement]); Break }
		'Path'	{ [log4net.Config.XmlConfigurator]::Configure($Path -as [System.IO.FileInfo]); Break }
	}
}

Export-ModuleMember -Function Import-LoggerConfig

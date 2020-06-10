#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.2 2020-06-10T16:36:39.398Z


function Import-BasicConfig {
	[log4net.Config.BasicConfigurator]::Configure();
}

function Import-XmlConfig {
Param(
	[Parameter(Position=0,Mandatory=$true,ParameterSetName='Xml')]
	[xml] $Xml,
	[Parameter(Position=0,Mandatory=$true,ParameterSetName='Path')]
	[string] $Path
)
	Switch ($PsCmdlet.ParameterSetName) {
		'Xml'	{ [log4net.Config.XmlConfigurator]::Configure($Xml.DocumentElement -as [System.Xml.XmlElement]); Break }
		'Path'	{ [log4net.Config.XmlConfigurator]::Configure($Path -as [System.IO.FileInfo]); Break }
	}
}

Export-ModuleMember -Function Import-BasicConfig, Import-XmlConfig

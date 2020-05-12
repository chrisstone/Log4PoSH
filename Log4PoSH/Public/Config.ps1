#### By Chris Stone <chris.stone@nuwavepartners.com> v0.0.1 2020-05-06T12:32:55.114Z


function Import-L4pBasicConfig {
	[log4net.Config.BasicConfigurator]::Configure();
}

function Import-L4pXmlConfig {
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

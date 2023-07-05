<#
.SYNOPSIS
Creates a new FileAppender.

.DESCRIPTION
The New-LoggerAppenderFile function creates a new FileAppender using log4net.

.PARAMETER FileName
The name of the file to which the appender will write.

.PARAMETER AppendToFile
Determines if the appender should append to any existing files, or overwrite them.

.PARAMETER Encoding
The encoding to use when writing to the file.

.PARAMETER LockingModel
The locking model to use when writing to the file.

.PARAMETER SecurityContext
The security context to use when writing to the file.

.EXAMPLE
New-LoggerAppenderFile -FileName "C:\Logs\log.txt" -AppendToFile $true -Encoding [System.Text.Encoding]::UTF8

This command creates a new FileAppender with the FileName set to "C:\Logs\log.txt", the AppendToFile set to $true, and the encoding set to UTF8.

.NOTES
This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function New-LoggerAppenderFile {
	Param (
		[Parameter(Mandatory = $true)]
		[string] $FileName,
		[Parameter(Mandatory = $false)]
		[bool] $AppendToFile = $true,
		[Parameter(Mandatory = $false)]
		[System.Text.Encoding] $Encoding,
		[Parameter(Mandatory = $false)]
		[log4net.Appender.FileAppender+LockingModelBase] $LockingModel,
		[Parameter(Mandatory = $false)]
		[log4net.Util.SecurityContext] $SecurityContext
	)

	# Create a new FileAppender
	$fileAppender = New-Object log4net.Appender.FileAppender

	# Set the properties
	$fileAppender.File = $FileName
	$fileAppender.AppendToFile = $AppendToFile

	if ($null -ne $Encoding) {
		$fileAppender.Encoding = $Encoding
	}

	if ($null -ne $LockingModel) {
		$fileAppender.LockingModel = $LockingModel
	}

	if ($null -ne $SecurityContext) {
		$fileAppender.SecurityContext = $SecurityContext
	}

	# Activate the changes
	$fileAppender.ActivateOptions()

	return $fileAppender
}
Export-ModuleMember -Function New-LoggerAppenderFile

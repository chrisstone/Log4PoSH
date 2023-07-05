<#
.SYNOPSIS
This function is used to clear the buffer of the logger.

.DESCRIPTION
This function invokes the flush method of log4net's LogManager to clear any pending logging information in the buffer.

.EXAMPLE
Clear-LoggerBuffer

This command will clear the logger buffer. Any error will be thrown and needs to be caught by the calling context.

.NOTES
This function is part of the Logging module.
#>

function Clear-LoggerBuffer {
	[CmdletBinding()]
	param()

	return -not ([log4net.LogManager]::Flush())
}
Export-ModuleMember -Function Clear-LoggerBuffer

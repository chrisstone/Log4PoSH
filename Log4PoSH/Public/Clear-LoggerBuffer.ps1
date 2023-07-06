<#
.SYNOPSIS
    This function is used to clear the buffer of the logger.

.DESCRIPTION
    This function invokes the flush method of log4net's LogManager to clear any pending logging information in the buffer.

.PARAMETER Timeout
    The maximum time (in milliseconds) to allow for the flush operation. Defaults to 100ms.

.EXAMPLE
    Clear-LoggerBuffer

    This command will clear the logger buffer with the default timeout. Any error will be thrown and needs to be caught by the calling context.

.EXAMPLE
    Clear-LoggerBuffer -Timeout 500

    This command will clear the logger buffer and allows for a maximum of 500ms for the operation. Any error will be thrown and needs to be caught by the calling context.

.NOTES
    This function is part of the Logging module. It requires the log4net library to be available in the domain.
#>
function Clear-LoggerBuffer {
	[CmdletBinding()]
	param(
		[int32]		$Timeout = 100
	)

	return -not ([log4net.LogManager]::Flush($Timeout))
}
Export-ModuleMember -Function Clear-LoggerBuffer

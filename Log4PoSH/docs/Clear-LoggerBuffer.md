---
external help file: Log4PoSH-help.xml
Module Name: Log4PoSH
online version:
schema: 2.0.0
---

# Clear-LoggerBuffer

## SYNOPSIS
This function is used to clear the buffer of the logger.

## SYNTAX

```
Clear-LoggerBuffer [[-Timeout] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
This function invokes the flush method of log4net's LogManager to clear any pending logging information in the buffer.

## EXAMPLES

### EXAMPLE 1
```
Clear-LoggerBuffer
```

This command will clear the logger buffer with the default timeout.
Any error will be thrown and needs to be caught by the calling context.

### EXAMPLE 2
```
Clear-LoggerBuffer -Timeout 500
```

This command will clear the logger buffer and allows for a maximum of 500ms for the operation.
Any error will be thrown and needs to be caught by the calling context.

## PARAMETERS

### -Timeout
The maximum time (in milliseconds) to allow for the flush operation.
Defaults to 100ms.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 100
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This function is part of the Logging module.
It requires the log4net library to be available in the domain.

## RELATED LINKS

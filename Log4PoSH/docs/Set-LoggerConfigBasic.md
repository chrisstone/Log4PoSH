---
external help file: Log4PoSH-help.xml
Module Name: Log4PoSH
online version:
schema: 2.0.0
---

# Set-LoggerConfigBasic

## SYNOPSIS
Sets the basic configuration for a logger.

## SYNTAX

```
Set-LoggerConfigBasic [[-Appender] <Object[]>] [[-Repository] <Object[]>]
```

## DESCRIPTION
The Set-LoggerConfigBasic function sets the basic configuration for a logger using log4net.

## EXAMPLES

### EXAMPLE 1
```
$logger = New-Logger
Set-LoggerConfigBasic -Logger $logger
```

This command sets the basic configuration of the specified logger.

## PARAMETERS

### -Appender
An array of appenders to be configured.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Repository
An array of repositories to be configured.

```yaml
Type: Object[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
This function is part of the Logging module.
It requires the log4net library to be available in the domain.

## RELATED LINKS

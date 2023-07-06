---
external help file: Log4PoSH-help.xml
Module Name: Log4PoSH
online version:
schema: 2.0.0
---

# Get-Logger

## SYNOPSIS
Creates a new logger interface.

## SYNTAX

```
Get-Logger [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
The New-Logger function creates a new logger interface using log4net.
If the log4net assembly is not already loaded, it will be initialized with the Initialize-Logger function.
By default, it gets the 'root' logger, but this can be changed by specifying a different name as a parameter.

## EXAMPLES

### EXAMPLE 1
```
New-Logger
```

This command creates a new 'root' logger interface.

### EXAMPLE 2
```
New-Logger -Name 'CustomLogger'
```

This command creates a new logger interface named 'CustomLogger'.

## PARAMETERS

### -Name
The name of the logger interface to create.
This defaults to 'root' if no other name is provided.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Root
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: Log4PoSH-help.xml
Module Name: Log4PoSH
online version:
schema: 2.0.0
---

# New-LoggerLayoutPattern

## SYNOPSIS
Creates a new PatternLayout.

## SYNTAX

```
New-LoggerLayoutPattern [-ConversionPattern] <String> [[-Header] <String>] [[-Footer] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
The New-LoggerLayoutPattern function creates a new PatternLayout using log4net.

## EXAMPLES

### EXAMPLE 1
```
New-LoggerLayoutPattern -ConversionPattern "%-4timestamp [%thread] %-5level %logger %ndc - %message%newline" -Header "----Start----" -Footer "----End----"
```

This command creates a new PatternLayout with the conversion pattern set to "%-4timestamp \[%thread\] %-5level %logger %ndc - %message%newline".
It also sets the header to "----Start----" and the footer to "----End----".

## PARAMETERS

### -ConversionPattern
The conversion pattern to use for this layout.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Header
The header to use for this layout.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Footer
The footer to use for this layout.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
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

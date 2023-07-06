---
external help file: Log4PoSH-help.xml
Module Name: Log4PoSH
online version:
schema: 2.0.0
---

# Import-LoggerConfig

## SYNOPSIS
Imports the logger configuration from either a basic setup, an XML object, or a file path.

## SYNTAX

### Basic
```
Import-LoggerConfig [-Basic] [<CommonParameters>]
```

### Xml
```
Import-LoggerConfig [-Xml] <XmlDocument> [<CommonParameters>]
```

### Path
```
Import-LoggerConfig [-Path] <String> [<CommonParameters>]
```

## DESCRIPTION
This function configures the logger based on the parameters provided.
There are three different ways to import the logger configuration:
- Using a basic configuration with the '-Basic' switch
- Using an XML configuration with the '-Xml' parameter
- Using a configuration file with the '-Path' parameter

## EXAMPLES

### EXAMPLE 1
```
Import-LoggerConfig -Basic
```

This command configures the logger with a basic configuration.

### EXAMPLE 2
```
Import-LoggerConfig -Xml $xmlConfig
```

This command configures the logger with the given XML configuration.

### EXAMPLE 3
```
Import-LoggerConfig -Path "C:\path\to\config.xml"
```

This command configures the logger with the XML configuration in the file at the given path.

## PARAMETERS

### -Basic
A switch parameter to use the basic configuration.
No value is required.

```yaml
Type: SwitchParameter
Parameter Sets: Basic
Aliases:

Required: True
Position: 1
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Xml
An XML configuration object for the logger.
This should be a valid XML object representing the configuration for the logger.

```yaml
Type: XmlDocument
Parameter Sets: Xml
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
A file path to an XML configuration file.
This should be a valid path to a file containing the XML configuration for the logger.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

---
external help file: Log4PoSH-help.xml
Module Name: Log4PoSH
online version:
schema: 2.0.0
---

# New-LoggerAppenderConsoleColored

## SYNOPSIS
Initializes the logger by loading the log4net assembly and resetting the logger.

## SYNTAX

## DESCRIPTION
This function initializes the logger by loading the log4net assembly if it hasn't already been loaded.
If the log4net assembly is already loaded, it checks the version of the loaded assembly against the assembly in the specified path.
If the loaded assembly is an older version, the function throws an error.
If the log4net assembly isn't loaded or if the loaded assembly is the same version or newer, the function resets the logger.

## EXAMPLES

### EXAMPLE 1
```
Initialize-Logger
```

This command initializes the logger with the log4net DLL at the default path.

### EXAMPLE 2
```
Initialize-Logger -DllPath "C:\path\to\log4net.dll"
```

This command initializes the logger with the log4net DLL at the specified path.

## PARAMETERS

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This function is part of the Logging module.

## RELATED LINKS

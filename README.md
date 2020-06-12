# Log4PoSH Module
> A PowerShell wrapper module for Apache Log4Net

[![AppVeyor Build][appv-b-img]][appv-url]
[![PSG Version][psg-v-img]][psg-url]
[![PSG Downloads][psg-dt-img]][psg-url]

From the Apache log4net Project Page:

> The Apache log4net library is a tool to help the programmer output log statements to a variety of output targets. log4net is a port of the excellent Apache log4j™ framework to the Microsoft® .NET runtime. We have kept the framework similar in spirit to the original log4j while taking advantage of new features in the .NET runtime. For more information on log4net see the features document.

## Installation

```powershell
Install-Module -Name Log4PoSH
```

Use `-AllowPrerelease` to install 'devel' versions (expect bugs).

## Quick Start

```powershell
Import-Module -Name Log4PoSH
Import-LoggerConfig -Basic
$Log = New-Logger
$Log.Debug("Hello World")

```

## Release History

* 0.1.x
    * Work in Progress - Keep your expectations low, very low


## Documentation

TODO Documentation


## Contributing

1. Fork it (<https://github.com/yourname/yourproject/fork>)
2. Create your branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

Branches

 - master - Stable releases, CI pushes to PSGallery
 - devel - Prereleaes, CI pushes to PSGallery, must pass testing
 - feature/* - Feature development, no CI, voluntary testing
 - issue/* - Fixes for reported issues, no CI, voluntary testing

<!-- Defines -->
[appv-b-img]:	https://img.shields.io/appveyor/build/chrisstone/Log4PoSH.svg
[appv-url]:		https://ci.appveyor.com/project/chrisstone/log4posh
[psg-v-img]:	https://img.shields.io/powershellgallery/v/Log4PoSH.svg
[psg-dt-img]:	https://img.shields.io/powershellgallery/dt/Log4PoSH.svg
[psg-url]:		https://powershellgallery.com/

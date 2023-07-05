# Save the module's directory path in a variable
$ModuleHome = Split-Path -Path $MyInvocation.MyCommand.Path -Parent

# Import functions from the 'Private' and 'Public' directories
Foreach ($NS in @('Private', 'Public')) {
	$path = Join-Path -Path $ModuleHome -ChildPath $NS
	if (Test-Path -Path $path) {
		Foreach ($ModFile in (Get-ChildItem -Filter '*.ps1' -Path $path)) {
			. $($ModFile.FullName)
		}
	} else {
		Write-Warning "Path '$path' not found. Skipping."
	}
}

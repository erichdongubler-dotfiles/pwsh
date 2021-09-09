Write-Host -NoNewLine "`e[5 q"
function OnViModeChange {
	if ($args[0] -eq 'Command') {
		# Set the cursor to a blinking block.
		Write-Host -NoNewLine "`e[1 q"
	} else {
		# Set the cursor to a blinking line.
		Write-Host -NoNewLine "`e[5 q"
	}
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

# TODO: Get this working
function Prompt {
	$(Get-Location) + [ConsoleColor]::BrightGreen + '$'
}

$Prefs = @{
	Colors = @{
		Command            = '#ae81ff'
		ContinuationPrompt = '#75715E'
		Default            = '#E8E8E3'
		Emphasis           = "`e[48;2;56;58;62m"
		Error              = "`e[48;2;95;0;0m"
		Member             = '#E8E8E3'
		Number             = '#ae81ff'
		Operator           = '#f92772'
		Parameter          = '#fd9720'
		String             = '#e6db74'
		Type               = '#66d9ef'
		Variable           = '#66d9ef'
	}
	EditMode = "Vi"
	HistoryNoDuplicates = $true
}

Set-PSReadLineOption @Prefs

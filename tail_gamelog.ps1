# locate gamelog.txt, in the base dir of Dwarf Fortress
$Logfile = "H:\Games\DF\Dwarf Fortress 0.43.05\gamelog.txt" # <- change your gamelog file here

# censor words
$global:disable ="retches"
    
# assign colors, separate words or sentences with |
$global:blue        = "mandate has"
$global:cyan        = "masterpiece"
#$global:darkblue    = ""
#$global:darkgreen   = ""
#$global:darkgrey    = ""
#$global:darkmagenta = ""
#$global:darkred     = ""
$global:darkyellow  = "migrant"
$global:green       = "birth"
$global:grey        = "has become"
$global:magenta     = "been struck"
$global:red         = "cancel|withdraw"
$global:yellow      = "have struck|mandated"

# things happen, disregard
function Get-LogColor {
    Param([Parameter(Position=0)]
    [String]$LogEntry)

    process {
        
        if     ($LogEntry|where{$_ -match $blue})       {Return "Blue"}
        elseif ($LogEntry|where{$_ -match $cyan})       {Return "Cyan"}
        #elseif ($LogEntry|where{$_ -match $darkblue})   {Return "DarkBlue"}
        #elseif ($LogEntry|where{$_ -match $darkgreen})  {Return "DarkGreen"}
        #elseif ($LogEntry|where{$_ -match $darkgrey})   {Return "DarkGrey"}
        #elseif ($LogEntry|where{$_ -match $darkcyan})   {Return "DarkCyan"}
        #elseif ($LogEntry|where{$_ -match $darkmagenta}){Return "DarkMagenta"}
        #elseif ($LogEntry|where{$_ -match $darkred})    {Return "DarkRed"}
        elseif ($LogEntry|where{$_ -match $darkYellow}) {Return "DarkYellow"}
        elseif ($LogEntry|where{$_ -match $green})      {Return "Green"}
        elseif ($LogEntry|where{$_ -match $grey})       {Return "Grey"}
        elseif ($LogEntry|where{$_ -match $magenta})    {Return "Magenta"}
        elseif ($LogEntry|where{$_ -match $red})        {Return "Red"}
        elseif ($LogEntry|where{$_ -match $yellow})     {Return "Yellow"}

        else {Return "White"}


    }
}
Get-Content -wait $logFile -tail 400 |where {$_ -notmatch $disable} | ForEach { Write-Host -ForegroundColor (Get-LogColor $_) $_}
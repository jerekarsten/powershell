## Tail Dwarf Fortress action/combat -log with added colors
## by Urist McKarsten 11/2017

# locate gamelog.txt, in the base dir of Dwarf Fortress
$Logfile = "H:\Games\DF\Dwarf Fortress 0.43.05\gamelog.txt" # <- change your gamelog file here

# censor words
$global:disable ="retches"

# notify service
$enableNotify = $true
$global:notify = "masterpiece"
    
# assign colors, separate words or sentences with |
$global:blue        = "mandate has"
$global:cyan        = "masterpiece"
$global:darkblue    = "attack"
$global:darkcyan    = "been completed"
$global:darkgreen   = "been struck|stuck in"
$global:darkgray    = ""
$global:darkmagenta = "dead"
$global:darkred     = "vomit"
$global:darkyellow  = "migrant"
$global:green       = "birth|calendar"
$global:gray        = "has become"
$global:magenta     = "missing"
$global:red         = "cancel|withdraw"
$global:yellow      = "have struck|spring|summer|autumn|winter"



# remove comment if color in use
function Get-LogColor {
    Param([Parameter(Position=0)]
    [String]$LogEntry)

    process {
        
        switch -regex ($LogEntry){
            $blue       {"Blue"}
            $cyan       {"Cyan"}
            $gray       {"Gray"}
            $magenta    {"Magenta"}
            $red        {"Red"}
            $yellow     {"Yellow"}
            $darkblue   {"DarkBlue"}
            $darkgreen  {"DarkGreen"}
            #$darkgray   {"DarkGray"}
            $darkcyan   {"DarkCyan"}
            $darkmagenta{"DarkMagenta"}
            $darkred    {"DarkRed"}
            $darkYellow {"DarkYellow"}
            Default     {"White"}
            }

    }
}

# beep pattern, not used yet
function Invoke-Beep {
        [console]::beep(1000,400)
        Start-Sleep -m 700
        [console]::beep(1000,400)
        Start-Sleep -m 700
        [console]::beep(1000,400)
        Start-Sleep -m 700
        [console]::beep(1000,1000)
        }

function notify {
    Param([Parameter(Position=0)]
    [String]$LogEntry)
    
    if ($LogEntry -match $notify -and $enableNotify -eq $true){
        # comment to only disable beep
        # [console]::beep(1000,1000)
        # play a sequence of beeps
        # Invoke-Beep
        Return "!!___" + $_ + "___!!"}
    
    else{Return $_}
    }

Get-Content -wait $logFile -tail 400 |
Where-Object {$_ -notmatch $disable} |
ForEach-Object{ notify $_} |
ForEach-Object { Write-Host -ForegroundColor (Get-LogColor $_) $_}
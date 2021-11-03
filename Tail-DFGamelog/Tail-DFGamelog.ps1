## Tail Dwarf Fortress action/combat -log with added colors
## by Urist McKarsten since 11/2017
## last update 11.10.2019

# Set Dwarf Fortress folderpath in settings.json
try{
    $data = Get-Content "$PSScriptRoot\settings.json" | ConvertFrom-Json
}
catch{
    write-error "Could not find settings.json"
    exit 1
}
try{
    $list = Get-Content "$PSScriptRoot\list.json" | ConvertFrom-Json
}
catch{
    write-error "Could not find list.json"
    exit 1
}

$DFFolder  = $data.settings.path
$linecount = $data.settings.linecount
$LogFile = "$DFFolder\gamelog.txt"

$orelist   = $list.orelist
$gemlist   = $list.gemlist
$stonelist = $list.stonelist

# censor words
$disable = $data.WordFilter

<# notify service
$enableNotify  = $true
$notify = "masterpiece"
#>

$colors = $data.colors

# assign colors, separate words or sentences with |
# ! if a variable is empty, you must disable it by commenting it out in Get-Color function
if($colors.blue){$blue = $colors.blue -join "|" } 
if($colors.cyan){$cyan = $colors.cyan -join "|" }
if($colors.darkblue){$darkblue = $colors.darkblue -join "|" } 
if($colors.darkcyan){$darkcyan = $colors.darkcyan -join "|" } 
if($colors.darkgreen){$darkgreen = $colors.darkgreen -join "|" }
if($colors.darkgray){$darkgray = $colors.darkgray -join "|" } 
if($colors.darkmagenta){$darkmagenta = $colors.darkmagenta -join "|" }
if($colors.darkred){$darkred = $colors.darkred -join "|" }
if($colors.darkyellow){$darkyellow  = $colors.darkyellow -join "|" }
if($colors.green){$green  = $colors.green -join "|" } 
if($colors.gray){$gray = $colors.gray -join "|" } 
if($colors.magenta){$darkmagenta = $colors.magenta -join "|" }
if($colors.red){$red = $colors.red -join "|" }
if($colors.yellow){$yellow = $colors.yellow -join "|" } 


# remove comment if color in use
function Get-LogColor {
    Param([Parameter(Position=0)]
    [String]$LogEntry)
    
    process {  
        switch -regex ($LogEntry){
            $blue       {"Blue"}
            $cyan       {"Cyan"}
            $green      {"Green"}
            $gray       {"Gray"}
            $magenta    {"Magenta"}
            $red        {"Red"}
            $yellow     {"Yellow"}
            $darkblue   {"DarkBlue"}
            $darkgreen  {"DarkGreen"}
            $darkgray   {"DarkGray"}
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
    $y = $_
    # parse for gems
    foreach ($gem in $gemlist ){
        if($logentry.EndsWith("struck $($gem.GemName)!")){
            $y = "+++ $y"
            $y += " Rarity is $(($gem.Rarity).toLower())","and the value is $($gem.Value)"
        }
    }
    
    # parse for ore
    foreach ($ore in $orelist ){
        $oreSplit = ($ore.ore).split(",")[0]
        if($logentry -match "struck $oreSplit"){
            $y = ">>> $y"
            $y += " It is found in $(($ore.'Found in').toLower())"
            $y += " It has a value of $($ore.Value)"
            $y += " It is used to create $($ore.'Metal created')"
        }
        
    }
    
    # parse for stone 
    foreach ($stone in $stonelist ){
        if($logentry -match $stone.name){
            $y = "*** $y"
            if($stone.'Fire-safe' -ne ""){
                $y += " It is fire-safe."
            }
            if($stone.'Magma-safe' -ne ""){
                $y += " It is magma-safe."
            }
        }
    }
    # Return finished line
    $y
}

Get-Content -wait $logFile -tail $lineCount |
Where-Object {$_ -notmatch $disable} |
ForEach-Object{ notify $_} |
ForEach-Object { Write-Host -ForegroundColor (Get-LogColor $_) $_}
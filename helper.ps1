$gameLog = "H:\Games\DF\Dwarf Fortress 0.43.05\gamelog.txt"
Get-Content -Path $gameLog -Wait -tail 200 | where { $_ -match "you have struck" } |sort -Unique

# orelistaus
$orelist = (Get-Content -Path $gameLog | where { $_ -match "you have struck" } |sort -Unique).Replace("You have struck","").Replace("!","") |Out-GridView


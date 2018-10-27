
# orelistaus
$orelist = (Get-Content -Path $gameLog | where { $_ -match "you have struck" } |sort -Unique).Replace("You have struck","").Replace("!","")

$ore = "Amethyst"
$url = "http://dwarffortresswiki.org/index.php/DF2014:$ore"

$html = Invoke-WebRequest -Uri $url
$id = "mw-content-ltr"
$ores=@{}
$ore = (($html.ParsedHtml.body.getElementsByClassName($id) | select innertext).innertext -split $ore)[2]

# -Context 0,10 | % {$_.context.postcontext}
#$divFull = $html.ParsedHtml.body.getElementsByClassName($full)
#$divClass = $html.ParsedHtml.body.getElementsByClassName($class)



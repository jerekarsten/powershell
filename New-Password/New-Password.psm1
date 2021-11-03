Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName 'Microsoft.VisualBasic, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'
# TODO
# blocklist of naughty words

<#
.Synopsis
   Generate a random password from finnish words.
.DESCRIPTION
   Generate a random password from finnish pre-filtered list of words.
   The list does not contain scandinavic letters or special characters.
   If the command is run with multiple entries, it will not copy to clipboard,
   as it does with single entry, by default.
.EXAMPLE
    PS:\> New-Password
    MUMMELIkirkuva7051 - Copied to clipboard. Clipboard will clear in 60 seconds.
.EXAMPLE
    PS:\> New-Password -Length 6 -Count 2 -Digit 8 -Multiple 5 -SpecialChars 2
    \RajausJamaan10230589_
    SorkkaHelppo~74221254}
    Tervas$Skimba~15311901
    _Kiivas)Pituus12059171
    [Juhlia-Kostua15353439
.EXAMPLE
   PS:\> New-Password -Length 10 -Count 2 -Digit 8
   TarkkaillaIlmavoitto#14430840 - Copied to clipboard. Clipboard will clear in 60 seconds.
.EXAMPLE
   PS:\> New-Password -Count 2 -Length 12 -AllowedChars "#¤%-"
   tarkkaamatonKAPALOVAIPPA2009 - Copied to clipboard. Clipboard will clear in 60 seconds.
.EXAMPLE
   PS:\> New-Password -L 4 -C 2 -D 6 -No
   KOTIkoko771212 - Copied to clipboard. Clipboard will clear in 60 seconds.
.EXAMPLE
   PS:\> New-Password -d 0 -sp 0 -c 2 -l 12 -m 5
    RULLALUISTINprostituutio
    kasvatuskotiKEITTOKINKKU
    AVOKATSEINENlukuvalaisin
    kasvottomuusRAHALLISESTI
    pohjapiirrosKORJAUSLAKKA
.Notes
    Last updated 3.11.2021
    Jere Karstén
#>

function New-Password {
    [CmdletBinding()]
    Param
    (
    # Path to wordlist
    $path = "$PSScriptRoot\sanalista_filtered.xml",
    # Define how long the words should be. Default length is randomized between numbers.
    [int]$Length = (Get-Random  -Minimum 6 -Maximum 8),
    # Define how many words you want.
    [int]$Count = 2,
    # Define how many digits of numbers you want.
    [int]$Digit = 4,
    # Define how many passwords you want printed. (disables clipboard copy)
    [int]$Multiple = 1,
    # Define how many special characters you want. (maximum is word Count + 2)
    [int]$SpecialChars = 0,
    # Disable copy to clipboard.
    [switch]$NoClip,
    # enable array shuffle
    [switch]$Shuffle,
    # Array of allowed special characters.
    [string]$AllowedChars = "!`"#$%&'()*+,-./:;<=>?@[\]^_{|}~"
    )

    if ($password){Clear-Variable password}

    $words = [System.Collections.ArrayList]@()

    # read the wordlist
    # filtteröi listasta pidemmät sanat kuin $Length sekä skandit ja roskan
    if ($path -match ".xml"){
        [xml]$list = Get-Content -Raw -Path $path
        foreach ($word in $list.DocumentElement.S){
            if ($word.Length -eq $Length -and $word -notmatch 'ä|ö|-|š| |à|é') {
                $word = $words.Add($word)
            }
        }
    }
    else{
        $list = Get-Content -Path $path
            foreach ($word in $list){
        if ($word.Length -eq $Length -and $word -notmatch 'ä|ö|-|š| |à|é') {
            $word = $words.Add($word)
           }
        }
    }
 
    function Password {
        #[int]$maxCount     = [int]$Count + 1
        #[int]$moreCount    = $count + 2
        #[int]$randomize    = Get-Random -min 1 -max $maxCount
        #[int]$charPlace    = if($digit -ge 1){Get-Random 3}else{Get-Random 2}
        #[int]$charNumber   = Get-Random -min 0 -max $AllowedChars.Length
        #[array]$randomRange  = 1..$morecount | Get-Random -Count $morecount
        
        if ($SpecialChars -gt $Count + 2) {$SpecialChars = $Count + 2}
        $password = @()
        #region Words
        $i = 1
        while ($i -le $Count) {
            
            if ($i % 2 -ne 0){
                $password += ((Get-Culture).TextInfo).ToLower($($words | Get-Random))
                }
            else{
                $password += ((Get-Culture).TextInfo).ToUpper($($words | Get-Random))
                }
            
            $i++
            }
        #endregion

        # randomize capitalization order
        $c = 0
        while ($c++ -lt $SpecialChars){
            $password += $AllowedChars[(get-random -max $AllowedChars.Length)]
        }

        $password = $password | Sort-Object {Get-Random}

        # insert Digit
        $password += (Get-Random).ToString().Substring(0,$digit)
        
        # shuffle array if enabled
        if($shuffle){
            $password = $password | Sort-Object {Get-Random}
            }
        # convert array to string and removee empty spaces
        $password = ([string]$password).Replace(" ","")

        #endregion
      
        if (!$NoClip -and $Multiple -eq 1){
            $password |clip 
            Write-Output "$password - Copied to clipboard. Clipboard will clear in 60 seconds." 
            # Clear clipboard if it has not changed after 60 seconds.
            # The Clipboard class can only be used in threads set to single thread apartment (STA) mode. Here's a workaround.
            Start-Job -ScriptBlock {powerShell -sta {Add-Type -AssemblyName System.Windows.Forms ; Start-Sleep 60 ; if([System.Windows.Forms.Clipboard]::GetText() -match $password){[System.Windows.Forms.Clipboard]::Clear()}}} -ArgumentList $password |out-null
            }
        else {
            Write-Output $password
            }
    }#endPassword

# loop password if multiple-property is selected
$n = 1    
while ($n++ -le $multiple){Password}

}
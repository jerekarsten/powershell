## New-Password
- Copy the folder to one of your folderpaths in **$env:PSModulePath**
- Then run:
    - Import-Module New-Password



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



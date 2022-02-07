Write-Output 'BISF Start'

$bisfPath = 'C:\Program Files (x86)\Base Image Script Framework (BIS-F)'
$jsonPath = "https://raw.githubusercontent.com/whoeipingo/PinkAVD/main/BISFconfig_MicrosoftWindows10EnterpriseforVirtualDesktops_64-bit.json?token=GHSAT0AAAAAABRKE3F3MGJ3WWSJ5IHCQRKGYQA52FQ", "https://raw.githubusercontent.com/whoeipingo/PinkAVD/main/BISFSharedConfig.json?token=GHSAT0AAAAAABRKE3F2MBVGYSNA4B6AKBGYYQA5ZRQ"
foreach ($file in $jsonPath) {
    $fileName = Split-Path $file -Leaf
    $outFile = Join-Path $bisfPath $fileName
    if (-not(Test-Path $outFile)) {
        Invoke-WebRequest $file -OutFile $outFile
    }
}
$startBISF = Join-Path $bisfPath "\Framework\PrepBISF_Start.ps1"
& $startBISF
Write-Output 'BISF Run Finished'

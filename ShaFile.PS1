$filePath = "C:\Users\guihf\Downloads\Alura_Project\Visual_Studio_Code\ShaFile.PS1"
$fileHash = Get-FileSHA1 $filePath

function Get-FileSHA1($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed

    $hash = $sha1.ComputeHash($fileBytes)

    $fullHashSB = New-Object System.Text.StringBuilder
    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $fullHashSB.Append($hexaNotation) > $null
    }
    $fullHashSB.ToString()
}

Write-Host "The hash of the file $filePath is $fileHash" -ForegroundColor Yellow
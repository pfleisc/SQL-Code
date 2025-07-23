function Generate-CustomPassword {
    param (
        [int]$length,
        [int]$minDigits = 1,
        [int]$minLowercase = 1,
        [int]$minUppercase = 1,
        [int]$minSpecial = 1
    )

    $digits      = '0123456789'.ToCharArray()
    $lowercase   = 'abcdefghijklmnopqrstuvwxyz'.ToCharArray()
    $uppercase   = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.ToCharArray()
    $special     = '!@#$%^&*()_+=[]{}|;:,.<>?'.ToCharArray()

    $requiredTotal = $minDigits + $minLowercase + $minUppercase + $minSpecial
    if ($requiredTotal -gt $length) {
        throw "Sum of minimum character types ($requiredTotal) exceeds total password length ($length)"
    }

    $passwordChars = @()

    # Add required characters for each category
    for ($i = 0; $i -lt $minDigits; $i++)     { $passwordChars += Get-Random -InputObject $digits }
    for ($i = 0; $i -lt $minLowercase; $i++)  { $passwordChars += Get-Random -InputObject $lowercase }
    for ($i = 0; $i -lt $minUppercase; $i++)  { $passwordChars += Get-Random -InputObject $uppercase }
    for ($i = 0; $i -lt $minSpecial; $i++)    { $passwordChars += Get-Random -InputObject $special }

    # Fill the rest randomly from all character sets
    $allChars = $digits + $lowercase + $uppercase + $special
    $remaining = $length - $passwordChars.Count
    for ($i = 0; $i -lt $remaining; $i++) {
        $passwordChars += Get-Random -InputObject $allChars
    }

    # Shuffle and format into chunks
    $shuffled = $passwordChars | Sort-Object {Get-Random}
    $rawPassword = -join $shuffled

    $chunks = @()
    for ($i = 0; $i -lt $rawPassword.Length; $i += 6) {
        $chunks += $rawPassword.Substring($i, [Math]::Min(6, $rawPassword.Length - $i))
    }

    return $chunks -join '-'
}

Generate-CustomPassword -length 18 -minDigits 3 -minLowercase 4 -minUppercase 5 -minSpecial 5
Generate-CustomPassword -length 18 -minDigits 3 -minLowercase 4 -minUppercase 5 -minSpecial 4
Generate-CustomPassword -length 18 -minDigits 3 -minLowercase 4 -minUppercase 5 -minSpecial 3
Generate-CustomPassword -length 18 -minDigits 3 -minLowercase 4 -minUppercase 5 -minSpecial 2
Generate-CustomPassword -length 18 -minDigits 3 -minLowercase 4 -minUppercase 5 -minSpecial 1
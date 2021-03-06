Function Test-bCryptHash
{
<#
.SYNOPSIS
Tests a plaintext string against a given hash value. 

.DESCRIPTION
This function tests an input plain text string against a specified hash value, return true if the bcrypt hash of the plaintext is 
equal to the hash specified.

We can do this as the output from get-salt includes the salt and workfactor information.

.PARAMETER 

.PARAMETER

.INPUTS
Accepts strings of paths to files in Pipeline

.OUTPUTS
True if hash of plain text is equal to hash specified

.EXAMPLE

.EXAMPLE

.NOTES
NAME: Test-BCryptHash
LASTEDIT: 2012-11-17 11:15:00
KEYWORDS: bcrypt, hash, password

.LINK
http://bcrypt.codeplex.com/

.LINK
http://aperturescience.su/
#>
[CMDLetBinding()]
param
(
	[Parameter(mandatory=$true)] [String] $PlainText,
	[Parameter(mandatory=$true)] [String] $Hash
)

#call verify, specifing plaintext and the hash
return [bcrypt.net.bcrypt]::verify($PlainText, $Hash)

}

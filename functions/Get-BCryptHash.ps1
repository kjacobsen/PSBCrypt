Function Get-BCryptHash
{
<#
.SYNOPSIS
Gets a hash the string provided using either salt or workfactor provided.

.DESCRIPTION
The cmdlet will return a hash of the string provided to it, you can optionally specify a salt to be used, otherwise a salt will be generated on the fly. A workfactor can be specified for the salt generated on the fly.

You cannot specify a salt and a workfactor, only one can be specified at any one time. If both are specified an error will be throw.

.PARAMETER InputString
[Pipeline] String to be hashed

.PARAMETER WorkFactor
[Optional] Workfactor for salt if generating one on the fly

.PARAMETER Salt
[Optional] Salt to be used during the hashing process

.INPUTS
Accepts strings to be hashed on pipeline (InputString)

.OUTPUTS
Hashes of input string

.EXAMPLE
Get-BCryptStringHash "MyPassword"
Returns the bcrypt has of the input string "MyPassword" with a random salt, this will produce a different has every time you run this!

.EXAMPLE
@("Password1", "Password2", "Password3") | Get-BCryptStringHash -Salt $MyBCryptSalt

.NOTES
NAME: Get-BCryptStringHash
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
	[Parameter(mandatory=$true, valuefrompipeline=$true)] [String] $InputString,
	[Int] $WorkFactor,
	[String] $Salt
)

Begin
{
	#Test if the user specified both workfactor and salt, if they did throw an error
	if ($WorkFactor -and $Salt)
	{
		throw "You cannot specify both a WorkFactor and a Salt, please specify one or the other"
	}
}

Process
{
	#if workfactor was specified, then we call that function, otherwise if the salt was spcified, 
	#	then use that function, otherwise just the plain inputstring function
	if ($WorkFactor)
	{
		return [bcrypt.net.bcrypt]::hashpassword($InputString, $WorkFactor)
	}
	elseif ($Salt)
	{
		return [bcrypt.net.bcrypt]::hashpassword($InputString, $Salt)
	}
	else
	{ 
		return [bcrypt.net.bcrypt]::hashpassword($InputString)
	}
}

}

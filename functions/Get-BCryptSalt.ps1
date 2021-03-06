Function Get-BCryptSalt
{
<#
.SYNOPSIS
Gets a bcrypt salt

.DESCRIPTION
This cmdlet will return a valid bcrypt salt, either from the default workfactor for the bcrypt.net library or using the specified work fector.

.PARAMETER WorkFactor
[Optional] Optial specification of a work factor, mut be between 4 and 32.

.INPUTS
Takes no pipeline input

.OUTPUTS
String representation of bycrypt salt

.EXAMPLE
$salt = Get-Salt
Returns a salt sing the bcrypt.net default work factor (10?)

.EXAMPLE
$hardsalt = Get-Salt -WorkFactor 30
Returns a salt which has a work factor of 30, or 2^30 amount of work to be performed whenever it is used

.NOTES
NAME: Get-BCryptSalt
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
	[int] $WorkFactor
)

#if a work factor is specified, then use the generate salt function which takes a work factor
if ($WorkFactor)
{
	return [bcrypt.net.bcrypt]::generatesalt($WorkFactor)
}
else
{
	return [bcrypt.net.bcrypt]::generatesalt()
}

}

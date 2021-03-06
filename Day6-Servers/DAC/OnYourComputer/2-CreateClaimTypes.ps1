# Create the Department and Two-Letter-Country-Name claim types.

Import-Module -Name ActiveDirectory


function New-ADSuggestedValueEntry ([String] $Value, [String] $DisplayName = "", [String] $Description = "")
{
    if ($DisplayName -eq ""){ $DisplayName = $Value }  
    New-Object Microsoft.ActiveDirectory.Management.ADSuggestedValueEntry($Value,$DisplayName,$Description) 
}


$Suggestions  = @( New-ADSuggestedValueEntry -Value "IT" ) 
$Suggestions += New-ADSuggestedValueEntry -Value "Engineering"
$Suggestions += New-ADSuggestedValueEntry -Value "Human Resources"
$Suggestions += New-ADSuggestedValueEntry -Value "Legal"

New-ADClaimType -DisplayName "Department" -SourceAttribute "department" -SuggestedValues $Suggestions -AppliesToClasses @("User","Computer") 



$Suggestions  = @( New-ADSuggestedValueEntry -Value "US" ) 
$Suggestions += New-ADSuggestedValueEntry -Value "CA" 
$Suggestions += New-ADSuggestedValueEntry -Value "GB" 
$Suggestions += New-ADSuggestedValueEntry -Value "AU" 
$Suggestions += New-ADSuggestedValueEntry -Value "NZ" 

New-ADClaimType -DisplayName "Two-Letter-Country-Name" -SourceAttribute "c" -SuggestedValues $Suggestions -AppliesToClasses @("User","Computer") 


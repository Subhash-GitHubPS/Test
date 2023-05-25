function Get-Count
{
   [CmdletBinding()]
   Param()
   
   Write-Host "Total Items:" (Get-ChildItem -Path . | Measure-Object).count
 }

 
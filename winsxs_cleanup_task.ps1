$Result = dism.exe /online /cleanup-image /startcomponentcleanup /resetbase | Out-String

If ($Result -like "*The operation completed successfully.*") {
    #test if cleanup recommended
    $TestResult = dism.exe /online /cleanup-image /analyzecomponentstore | Out-String

    #If recommended do this
    If ($TestResult -like "*Component Store Cleanup Recommended : Yes*") {
        Write-Host "Additional Cleanup Required"
        Exit 2001
    }
    Else {
        Write-Host "OK"
        Exit 0
    }
}
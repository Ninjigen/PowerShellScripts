Param(
    [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
    [String[]]$Path
)
begin{
    $Result = $true
}
process{
    $Path | Foreach-Object {
        $ModuleItem = Get-Item $_ | Foreach-Object {
            $ModuleName = $_.BaseName
            $ModulePath = $_.FullName
            Import-Module $ModulePath -Force
            $CommandList = Get-Command -Module $ModuleName -CommandType Function | Where-Object {$_.Verb -eq 'Test'}
            $CommandList | Foreach-Object {
                if(Invoke-Expression -Command $_.Name) {
                    Write-Host ("{0} - PASSED TEST - {1}" -f (Get-Date -Format 'yyyy/MM/dd-HH:mm:ss'),$_.Name) -Foreground Green
                } else {
                    $Result = $False
                    Write-Host ("{0} - FAILED TEST - {1}" -f (Get-Date -Format 'yyyy/MM/dd-HH:mm:ss'),$_.Name) -Foreground Red
                }
            }
        }
    }
}
end{
    $Result
}

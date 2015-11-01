Function Join-String {
	[CmdletBinding()]
    Param(
        [Parameter(Mandatory=$True,ValueFromPipeline=$True)]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [AllowNull()]
        [String[]]$String,
        [Parameter(Mandatory=$False,Position=0)]
        [String]$Separator=" ",
        [switch]$RemoveEmptyElement
    )
    begin {
        $result=""
        $StringCol = @()
    }
    process {
        $String | Foreach {
            $StringCol += $_
        }
    }
    end {
        $head,$tail = $StringCol | Where {(-not $RemoveEmptyElement) -or ($RemoveEmptyElement -and "$_")}
        if ($head -ne $null) {
            $result = $head
            if ($tail -ne $null) {
                    $tail | Foreach {
                    $result += $Separator + $_
                }
            }
        }
        $result
    }
}
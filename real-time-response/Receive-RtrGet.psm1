function Receive-RtrGet {
<#
    .SYNOPSIS
        Get RTR extracted file contents for specified session and sha256

    .PARAMETER ID
        RTR Session Id

    .PARAMETER HASH
        Extracted SHA256 hash

    .PARAMETER PATH
        Destination path
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(36,36)]
        [string]
        $Id,

        [Parameter(Mandatory = $True)]
        [ValidateLength(64,64)]
        [string]
        $Hash,

        [Parameter(Mandatory = $True)]
        [string]
        $Path
    )
    process{
        $Param = @{
            Uri = ('/real-time-response/entities/extracted-file-contents/v1?session_id=' +
            $Id + '&sha256=' + $Hash)
            Method = 'get'
            Header = @{
                accept = 'application/x-7z-compressed'
            }
            OutFile = $Path
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Invoke-CsAPI @Param
    }
}
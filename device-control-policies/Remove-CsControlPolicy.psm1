function Remove-CsControlPolicy {
<#
    .SYNOPSIS
        Delete a set of Device Control policies by specifying their IDs

    .PARAMETER ID
        The IDs of the Device Control policies to delete
#>
    [CmdletBinding()]
    [OutputType([psobject])]
    param(
        [Parameter(Mandatory = $true)]
        [array]
        $Id
    )
    process{
        $Param = @{
            Uri = '/policy/entities/device-control/v1?ids='
            Method = 'delete'
            Header = @{
                accept = 'application/json'
                'content-type' = 'application/json'
            }
        }
        switch ($PSBoundParameters.Keys) {
            'Verbose' { $Param['Verbose'] = $true }
            'Debug' { $Param['Debug'] = $true }
        }
        Split-CsArray -Activity $MyInvocation.MyCommand.Name -Param $Param -Id $Id
    }
}
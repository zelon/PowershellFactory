chcp 65001
mode 300
Get-EventLog -LogName "System" -After ((Get-Date) + (New-TimeSpan -Days -7)) `
  | Where-Object {$_.InstanceID -ne '10016' -and $_.InstanceID -ne '10010' } `
  | Where-Object {$_.EntryType -eq 'Error' -or $_.EntryType -eq 'Warning' -or $_.EntryType -eq '0' } `
  | Sort-Object Index
Get-WmiObject -namespace root\wmi -class MSStorageDriver_FailurePredictStatus -ErrorAction Silentlycontinue | Select InstanceName, PredictFailure, Reason | Format-Table -Autosize
Get-Date

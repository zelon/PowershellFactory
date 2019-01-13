mode 300
Get-EventLog -LogName "System" -EntryType "Error", "Warning" -After ((Get-Date) + (New-TimeSpan -Days -7)) | Sort-Object Index
(Get-WmiObject -namespace root\wmi -class MSStorageDriver_FailurePredictStatus -ErrorAction Silentlycontinue |  Select InstanceName, PredictFailure, Reason | Format-Table -Autosize)

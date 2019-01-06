Get-EventLog -LogName "System" -EntryType "Error", "Warning" -After ((Get-Date) + (New-TimeSpan -Days -7)) | Sort-Object Index

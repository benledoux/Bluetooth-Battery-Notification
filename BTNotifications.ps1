# Define the battery property key
$propertyKey = '{104EA319-6EE2-4701-BD47-8DDBF425BBE5} 2'

# Get all Bluetooth devices
$btDevices = Get-PnpDevice -Class 'Bluetooth'

# Initialize list for low battery devices
$lowBatteryDevices = @()

foreach ($device in $btDevices) {
    $batteryProp = Get-PnpDeviceProperty -InstanceId $device.InstanceId -KeyName $propertyKey -ErrorAction SilentlyContinue
    $batteryLevel = $batteryProp.Data

    if ($batteryLevel -ne $null -and $batteryLevel -lt 90) {
        $lowBatteryDevices += "$($device.FriendlyName): $batteryLevel%"
    }
}

# Show popup if any device has low battery
if ($lowBatteryDevices.Count -gt 0) {
    $message = "Low Bluetooth battery detected:`n" + ($lowBatteryDevices -join "`n")
    Start-Process -FilePath "msg.exe" -ArgumentList "$env:USERNAME", "$message"
}

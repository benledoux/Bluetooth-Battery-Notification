# Bluetooth-Battery-Notification
A PowerShell script to be notified of when your Bluetooth battery is low.

NOTE: If you are having issues running the script after putting in the required information below, verify you are running from Powershell 7+

As somebody new to owning a Bluetooth device, I was a bit shocked when my notification in my system tray after a long weekend was simply "Your Bluetooth device is at 1%, consider charging". Sure, maybe the notification in the system tray might have popped up earlier and I didn't see it but I like to make ridiculous scripts so here is one that will pop up when your battery level is below 25%.

Some variables to be aware of:

`'{104EA319-6EE2-4701-BD47-8DDBF425BBE5} 2'` is the property key for the Bluetooth battery

`Get-PnpDevice -Class 'Bluetooth'` will list all of your Bluetooth devices. If you only want to monitor a specific device, you can run that command and find the 'FriendlyName' of your specific device and update the command on line 5 with `-FriendlyName '<NAME>'` (without the angle brackets). That method may cause you to run into issues of not finding the device. I got around that by adding a * at the end of the name (EX: 'BTK*').

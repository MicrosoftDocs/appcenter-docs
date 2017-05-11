You can subscribe to the event `Push.PushNotificationReceived` to be notified whenever a push notification is received in the foreground or a background push notification has been clicked by the user.

```csharp
// This should come before MobileCenter.Start() is called
Push.PushNotificationReceived += (sender, e) {

    // Add the notification message and title to the message
    var summary =  $"Push notification received:"
                        $"\n\tNotification title: {e.Title}" +
                        $"\n\tMessage: {e.Message}";
                        
    // If there is custom data associated with the notification,
    // print the entries
    if (e.CustomData != null)
    {
        summary += "\n\tCustom data:\n";
        foreach (var key in e.CustomData.Keys)
        {
            summary += $"\t\t{key} : {e.CustomData[key]}\n";
        }
    }
    
    // Send the notification summary to debug output
    System.Diagnostics.Debug.WriteLine(summary);
};
```

>[!NOTE]
>Because it uses `System.Diagnostics.Debug.WriteLine()`, this example assumes that the app is running in debug mode with a debugger attached, but that is not a requirement to simply use the `Push.PushNotificationReceived` event.

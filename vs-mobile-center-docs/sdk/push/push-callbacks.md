It is possible to subscribe to push notifications received in the foreground with the event `Push.PushNotificationReceived`. The event argument type, `PushNotificationReceivedEventArgs`, contains the relevant data associated with the notification. The following code sample intercepts and print push notifications received in the foreground.

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
>Because it uses `System.Diagnostics.Debug.WriteLine()`, this example assumes that the app is running in debug mode with a debugger attached, but that is generally not a requirement to use the event.

>[!WARNING]
>Though there is no setup required to enable this event in most cases, Xamarin.iOS users should make sure that they have completed all of the Xamarin.iOS setup steps first.
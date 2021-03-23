---
author: lucen-ms
ms.author: lucen
ms.topic: include
ms.date: 12/02/2019
---

You can set up a listener to be notified whenever a push notification is received in foreground, or a background push notification has been clicked by the user.

> [!NOTE]
> A notification isn't generated when your application receives a push in the foreground.
>
> If the push is received in background, the event isn't triggered at receive time.
> The event is triggered when you click on the notification.
>
> The background notification click callback doesn't expose **title** and **message**.
> **Title** and **message** are only available in foreground pushes.

To register the listener, see the following example:

```csharp
Push.PushNotificationReceived += (sender, e) =>
{
    string customData = "";
    if (e.CustomData != null)
        foreach (var data in e.CustomData)
            customData += data.Key + " = " + data.Value + Environment.NewLine;

    // Message and title can't be read from a background notification object.
    // Message being a mandatory field, you can use that to check foreground vs background.
    if (string.IsNullOrEmpty(e.Message))
    {
        // Use the custom data dictionary when a background push is clicked.
        Debug.Log("Background push notification received:" + Environment.NewLine +
                  "Custom data: " + customData);
    }
    else
    {
        // Display an alert for foreground push.
        Debug.Log("Foreground push notification received:" + Environment.NewLine +
                  "Notification title: " + e.Title + Environment.NewLine +
                  "Message: " + e.Message + Environment.NewLine +
                  "Custom data: " + customData);
    }
};
```
Silent notifications give you a way to wake up your app so that it can refresh its data in the background (see [Apple documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CreatingtheNotificationPayload.html#//apple_ref/doc/uid/TP40008194-CH10-SW8)). To enable silent notifications open Xcode's project editor, choose your target and click **Capabilities**. Turn on **Background Modes** and check the **Remote notifications** checkbox.

![enable-silent-notifications](images/ios-enable-silent-notifications.png)

---
author: asb3993
ms.topic: include
ms.date: 12/02/2019
ms.author: amburns
---

> [!IMPORTANT]
> Please note this feature is being retired. For more information, please see the [blog post](https://devblogs.microsoft.com/appcenter/app-center-mbaas-retirement/). For more information, refer to the [Push Migration Guide](~/migration/push/index.md).

You can specify custom defaults for the icon and color that gets applied when it isn't set in the push payload.

The lines below should be added to **AndroidManifest.xml** inside the `application` tag:

```xml
<!-- Set default notification icon and color. -->
<meta-data
    android:name="com.google.firebase.messaging.default_notification_icon"
    android:resource="@drawable/ic_notification" />
<meta-data
    android:name="com.google.firebase.messaging.default_notification_color"
    android:resource="@color/notification" />
```
App Center displays the application icon if a custom default icon and an icon are not set in the push payload.


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

If no custom default icon is set and no icon is set in the push payload, AppCenter displays the application icon.

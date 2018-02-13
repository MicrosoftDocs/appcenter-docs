You can send optional custom data as part of the push payload. The data will be sent in the key-value format. This custom data can be intercepted in the app through Push SDK callback.

There are few reserved keywords that can be set via custom data. You can customize your notifications by setting custom **color**, **icon** or **sound**.

> [!NOTE]
> Android 5.0 and later uses a **silhouette** (only alpha channel) of your icon for notifications. See [Android 5.0 Behavior Changes](https://developer.android.com/about/versions/android-5.0-changes.html#BehaviorNotifications) for details.

### Reserved keywords in Android platform
- **color**: The notification's icon color, expressed in `#rrggbb` format. Will be applied only on devices with Android 5.0 and later.
- **icon**: The notification's icon. You should specify **name** of the icon resource. Supports `drawable` and `mipmap` types. If this value isn't specified application icon will be used.
- **sound**: Add this key when you want the to play a sound when the device receives the notification. Supports `default` or the filename of a sound resource bundled in the app. Sound files must reside in `/res/raw/`. This is effective only for devices running or targeting an Android version lower than 8. Sound is set by default on Android 8 and user can change notification settings for the group of notifications coming from AppCenter.

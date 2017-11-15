## Session and device information

Once you add App Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without any additional code.

## Custom events

You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the App Center portal.

Once you have started the SDK, use the `trackEvent:withProperties` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 64 characters per event property name and event property value.

```objc
NSDictionary *properties = @{@"Category" : @"Music", @"FileName" : @"favorite.avi"};
[MSAnalytics trackEvent:@"Video clicked" withProperties: properties];
```
```swift
MSAnalytics.trackEvent("Video clicked", withProperties: ["Category" : "Music", "FileName" : "favorite.avi"])
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:

```objc
[MSAnalytics trackEvent:@"Video clicked"];
```
```swift
MSAnalytics.trackEvent("Video clicked")
```

## Enable or disable App Center Analytics at runtime

You can enable and disable App Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.

```objc
[MSAnalytics setEnabled:NO];
```
```swift
MSAnalytics.setEnabled(false)
```

To enable App Center Analytics again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSAnalytics setEnabled:YES];
```
```swift
MSAnalytics.setEnabled(true)
```

## Check if App Center Analytics is enabled

You can also check if App Center Analytics is enabled or not.

```objc
[MSAnalytics isEnabled];
```

```swift
MSAnalytics.isEnabled()
```
## Session and device information

Once you add App Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without any additional code.

## Custom events

You can track your own custom events with **up to twenty properties** to know what's happening in your app, understand user actions, and see the aggregates in the App Center portal.

Once you have started the SDK, use the `trackEvent:withProperties` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 125 characters per event property name and event property value.

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

## Event priority and persistence

You can track business critical events that have higher importance than other events.

* Developers can set persistence of events as **Normal** (`MSFlagsPersistenceNormal` in the API) or **Critical** (`MSFlagsPersistenceCritical` in the API).
* Events with priority set as **Critical** will be retrieved from storage first and sent before **Normal** events.
* When the local storage is full and new events needs to be stored, the oldest events that have the lowest priority are deleted first to make room for the new ones.
* If the storage is full of logs with **Critical** priority, then tracking an event with
**Normal** priority will fail as the SDK cannot make room in that case.
* If you also use the **Crashes** service, please note that crash logs are set as **Critical** and share the same storage as events.

You can use the following API to track an event as **Critical**:

```objc
NSDictionary *properties = @{@"Category" : @"Music", @"FileName" : @"favorite.avi"};
[MSAnalytics trackEvent:@"Video clicked" withProperties:properties flags:MSFlagsPersistenceCritical];

// If you are using name only, you can pass nil as properties.
```

```swift
let properties = ["Category" : "Music", "FileName" : "favorite.avi"];
MSAnalytics.trackEvent("Video clicked", withProperties: properties, flags: .critical)

// If you are using name only, you can pass nil as properties.
```

## Pause and resume sending logs

Pausing the event transmission can be useful in scenarios when the app needs to control the network bandwidth for more business critical needs. You can pause sending logs to the App Center backend. When paused, events can still be tracked and saved, but they are not sent right away. Any events your app tracks while paused will only be sent once you call `resume`.

```objc
[MSAnalytics pause];
[MSAnalytics resume];
```
```swift
MSAnalytics.pause()
MSAnalytics.resume()
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

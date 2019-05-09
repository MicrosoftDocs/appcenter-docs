> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Unity](unity.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Apache Cordova](cordova.md)

## Adjust the log level

You can control the amount of log messages that show up from App Center in the console. Use the `setLogLevel:`-API to enable additional logging while debugging. By default, it is set to `MSLogLevelAssert` for the App Store environment and `MSLogLevelWarning` otherwise.

To have as many log messages as possible, use `MSLogLevelVerbose`/`MSLogLevel.Verbose`.

```objc
[MSAppCenter setLogLevel:MSLogLevelVerbose];
```
```swift
MSAppCenter.setLogLevel(MSLogLevel.Verbose)
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

```objc
NSUUID *installId = [MSAppCenter  installId];
```
```swift
var installId = MSAppCenter.installId()
```

## Identify users

The App Center SDK supports setting a **user ID** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK by calling `:start:withServices:` as described in the [App Center SDK Getting started guide](~/sdk/getting-started/ios.md). 
2. Set a `userID` in the SDK using the following code:

```objc
[MSAppCenter setUserId:@"your-user-id"];
```
```swift
MSAppCenter.setUserId("your-user-id")
```
After setting a user ID, you can use App Center's search feature to search for specific crash reports associated with the ID. Learn more in App Center's [search documentation](~/diagnostics/search.md). 

> [!NOTE]
> Note that the value for the user id is limited to 256 characters.

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled` API. When disabled, the SDK will not forward any information to App Center.

```objc
[MSAppCenter setEnabled:NO];
```
```swift
MSAppCenter.setEnabled(false)
```

To enable all services at once again, use the same API but pass `YES`/`true` as a parameter.

```objc
[MSAppCenter setEnabled:YES];
```
```swift
MSAppCenter.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```objc
[MSAppCenter isEnabled];
```
```swift
MSAppCenter.isEnabled()
```

## Check App Center SDK version at runtime

You can get the version of App Center SDK that you are currently using.

```objc
[MSAppCenter sdkVersion];
```
```swift
MSAppCenter.sdkVersion()
```

## Use custom properties

App Center allows you to define custom properties as key value pairs in your app. You may use custom properties for various purposes. For instance, you can use custom properties to segment your users, and then send push notifications to a specific [audience](~/push/send-notification.md#audiences).

> [!NOTE]
> Only devices that have [Push](../push/ios.md) successfully registered are matched in audiences.
> As a consequence, the iOS simulator can not be used to test audience matching.

You can set custom properties by calling the `setCustomProperties` API. A valid key for custom property should match regular expression pattern `^[a-zA-Z][a-zA-Z0-9]*$`. A custom property's value may be one of the following types: `NSString`, `NSNumber`, `BOOL` and `NSDate`.

```objc
MSCustomProperties *customProperties = [MSCustomProperties new];
[customProperties setString:@"blue" forKey:@"color"];
[customProperties setNumber:@(10) forKey:@"score"];
[MSAppCenter setCustomProperties:customProperties];
```
```swift
var customProperties = MSCustomProperties()
customProperties.setString("blue", forKey: "color")
customProperties.setNumber(10, forKey: "score")
MSAppCenter.setCustomProperties(customProperties)
```

> [!NOTE]
> If you set the same custom property more than once, previous values will be overwritten by the last one.

You may remove any custom property by calling the `clearPropertyForKey` API. This will only remove the value of the property for a device. It will not remove the property name from App Center portal.

```objc
MSCustomProperties *customProperties = [MSCustomProperties new];
[customProperties clearPropertyForKey:@"score"];
[MSAppCenter setCustomProperties:customProperties];
```
```swift
var customProperties = MSCustomProperties()
customProperties.clearProperty(forKey: "score")
MSAppCenter.setCustomProperties(customProperties)
```

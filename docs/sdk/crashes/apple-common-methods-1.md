## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.

```objc
[MSCrashes generateTestCrash];
```
```swift
MSCrashes.generateTestCrash()
```

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```objc
[MSCrashes hasCrashedInLastSession];
```
```swift
MSCrashes.hasCrashedInLastSession()
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```objc
MSErrorReport *crashReport = [MSCrashes lastSessionCrashReport];
```
```swift
var crashReport = MSCrashes.lastSessionCrashReport()
```

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [MSCrashesDelegate](#customize-your-usage-of-app-center-crashes).

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

To add your custom behavior, you need to adopt the `MSCrashesDelegate`-protocol, all of its methods are optional.

### Register as a delegate

```objc
[MSCrashes setDelegate:self];
```
```swift
MSCrashes.setDelegate(self)
```

> [!NOTE]
> You must set the delegate *before* calling `[MSAppCenter start]`, since App Center starts processing crashes immediately after the start.

### Should the crash be processed?

Implement the `crashes:shouldProcessErrorReport:`-method in the class that adopts the `MSCrashesDelegate`-protocol if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```objc
- (BOOL)crashes:(MSCrashes *)crashes shouldProcessErrorReport:(MSErrorReport *)errorReport {
  return YES; // return YES if the crash report should be processed, otherwise NO.
}
```
```swift
func crashes(_ crashes: MSCrashes!, shouldProcessErrorReport errorReport: MSErrorReport!) -> Bool {
  return true; // return true if the crash report should be processed, otherwise false.
}
```

---
title: HockeySDK for tvOS Migration
description: Migrate from the HockeySDK to App Center SDK
author: elamalani
ms.author: emalani
ms.date: 08/09/2019
ms.topic: article
ms.assetid: 44a08a47-85e2-4456-9b15-d524037df036
ms.service: vs-appcenter
---

# Migrate from the HockeySDK to App Center SDK for tvOS

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

### 1.1 Remove old HockeySDK

#### Manual

If you have added the SDK manually, follow these steps:

1. Remove `HockeySDK.framework` reference from the XCode project. Do not click _Move to Trash_ button, just click the _Remove reference_ button.

1. Open your project settings and under **Build Settings** tab in the **Header Search Paths** / **Framework Search Paths** sections, remove the locations for header files related to HockeySDK.

1. Open your project settings and under **Build Phases** tab in the **Link Binary with Libraries** section, remove the dependency entries related to HockeySDK.

1. Delete `HockeySDK.framework` from the file system.

#### Podfile

If you have added the SDK using **CocoaPods**, remove the `pod "HockeySDK-tvOS"` line from the Podfile, then run `pod install`.

#### Carthage

> [!NOTE]
> App Center doesn't support Carthage yet. Please look at [our roadmap](https://github.com/Microsoft/appcenter/wiki/Roadmap) to stay up to date on it.

### 1.2 Add new App Center SDK

Add the `pod 'AppCenter'` line to your Podfile and run `pod install`.

Alternatively, you can specify which services you want to use in your app. Each service has its own subspec and they all rely on AppCenter. It will get pulled in automatically.

```ruby
# Use the following line to use App Center Analytics and Crashes.
pod 'AppCenter'

# Use the following lines if you want to specify which service you want to use.
pod 'AppCenter/Analytics'
pod 'AppCenter/Crashes'
```

> [!NOTE]
> The App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in. See the equivalences in the next table:

HockeyApp class  | App Center module
---------------- | -----------------
`MetricsManager` | `Analytics`
`CrashManager`   | `Crashes`

The recommended way to integrate the App Center SDK is to use **CocoaPods**, but we support other scenarios. For more info, refer to the [App Center Documentation](~/sdk/getting-started/macos.md#32-integration-by-copying-the-binaries-into-your-project).

## 2. Update the SDK setup code

### 2.1 Convert the application identifier

The App Center SDK uses application identifiers in the globally unique identifier (GUID) format. Your HockeyApp App ID can be used by App Center but you need to convert it to a different format. To convert the identifier you must add four hyphens to get an 8-4-4-4-12 representation.

Before (HockeyApp):  
`00112233445566778899aabbccddeeff`  

After (App Center):  
`00112233-4455-6677-8899-aabbccddeeff`

### 2.2 Replace SDK initialization in the application code

1. Replace the following imports in your **AppDelegate** class.

   Before:

   ```objc
   @import HockeySDK;
   ```
   ```swift
   import HockeySDK
   ```

   After:

   ```objc
   @import AppCenter;
   @import AppCenterAnalytics;
   @import AppCenterCrashes;
   ```
   ```swift
   import AppCenter
   import AppCenterAnalytics
   import AppCenterCrashes
   ```

1. Replace registration code

   Find the `didFinishLaunchingWithOptions` method and replace HockeyApp code occurrences.

   Before:

   ```objc
   [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"APP_IDENTIFIER"];
   [[BITHockeyManager sharedHockeyManager] startManager];
   ```
   ```swift
   BITHockeyManager.shared().configure(withIdentifier: "APP_IDENTIFIER")
   BITHockeyManager.shared().start()
   ```

   After:

   ```objc
   [MSAppCenter start:@"{Your app secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
   ```
   ```swift
   MSAppCenter.start("{Your app secret}", withServices: [MSAnalytics.self, MSCrashes.self])
   ```

1. Replace HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Adjust log level | [[BITHockeyManager sharedHockeyManager].logLevel = BITLogLevelVerbose](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-macos#3-7-debug-information) | [[MSAppCenter setLogLevel:MSLogLevelVerbose]](~/sdk/other-apis/macos.md#adjust-the-log-level)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Adjust log level | [BITHockeyManager.shared().logLevel = BITLogLevel.verbose](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-macos#3-7-debug-information) | [MSAppCenter.setLogLevel(MSLogLevel.Verbose)](~/sdk/other-apis/macos.md#adjust-the-log-level)

* * *

### Analytics

The HockeySDK collects metrics per default.
The App Center SDK does not collect any (analytics) metrics per default. To collect metrics using the App Center SDK, pass `MSAnalytics` to the `start:` method.

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically track sessions | [Documentation (enabled by default)](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-3-user-metrics) | [Documentation (enabled by default)](~/sdk/analytics/macos.md#session-and-device-information)
Custom events with properties| [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-3-1-custom-events) | [[MSAnalytics trackEvent:withProperties:]](~/sdk/analytics/macos.md#custom-events)
Disable service at runtime | [[BITHockeyManager sharedHockeyManager].disableMetricsManager = YES](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-3-user-metrics) | [[MSAnalytics setEnabled:NO]](~/sdk/analytics/macos.md#enable-or-disable-app-center-analytics-at-runtime)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically track sessions | [Documentation (enabled by default)](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-3-user-metrics) | [Documentation (enabled by default)](~/sdk/analytics/macos.md#session-and-device-information)
Custom events with properties | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-3-1-custom-events) | [MSAnalytics.trackEvent(eventName, withProperties: properties)](~/sdk/analytics/macos.md#custom-events)
Disable service at runtime | [BITHockeyManager.shared().isMetricsManagerDisabled = true](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-3-user-metrics) | [MSAnalytics.setEnabled(false)](~/sdk/analytics/macos.md#enable-or-disable-app-center-analytics-at-runtime)

* * *

### Crashes

The HockeySDK reports crashes per default. Crashes will be immediately sent to the server the next time the app is launched.
The App Center SDK does not report any crashes per default. To collect crashes using the App Center SDK, pass `MSCrashes` to the `start:` method.

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically send crashes | [[[Documentation (enabled by default)]](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-2-2-how-are-crash-reports-sent-to-hockeyapp-) | [Documentation (enabled by default)](~/sdk/crashes/macos.md#should-the-crash-be-processed)
Generate a test crash | `[[BITHockeyManager sharedHockeyManager].crashManager generateTestCrash]` | [[MSCrashes generateTestCrash]](~/sdk/crashes/macos.md#generate-a-test-crash)
Info about the previous crash | `[[BITHockeyManager sharedHockeyManager].crashManager lastSessionCrashDetails]` | [[MSCrashes lastSessionCrashReport]](~/sdk/crashes/macos.md#details-about-the-last-crash)
Mach exception handling | `[[BITHockeyManager sharedHockeyManager].disableMachExceptionHandler = YES]` | [Documentation (enabled by default)](~/sdk/crashes/macos.md#disabling-mach-exception-handling)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-2-4-attach-additional-data) | [Documentation (can be attached from delegate)](~/sdk/crashes/macos.md#add-attachments-to-a-crash-report) |
Customize user dialog | [setCrashReportUIHandler](https://github.com/bitstadium/HockeySDK-tvOS/blob/62f4cff75262ca3e58ec80b2db3c7414637be8c3/Classes/BITCrashManager.h#L310) | [Documentation (not provided by default)](~/sdk/crashes/macos.md#ask-for-the-users-consent-to-send-a-crash-log)
Disable service at runtime | [[[BITHockeyManager sharedHockeyManager] setDisableCrashManager: YES]](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-2-1-disable-crash-reporting) | [[MSCrashes setEnabled:NO]](~/sdk/crashes/macos.md#enable-or-disable-app-center-crashes-at-runtime)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically send Crashes | [BITHockeyManager.shared().crashManager.isAutoSubmitCrashReport = true](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-2-2-how-are-crash-reports-sent-to-hockeyapp-) | [Documentation (enabled by default)](~/sdk/crashes/macos.md#should-the-crash-be-processed)
Generate a test crash | `BITHockeyManager.shared().crashManager.generateTestCrash()` | [MSCrashes.generateTestCrash()](~/sdk/crashes/macos.md#generate-a-test-crash)
Info about the previous crash | `BITHockeyManager.shared().crashManager.lastSessionCrashDetails` | [MSCrashes.lastSessionCrashReport()](~/sdk/crashes/macos.md#details-about-the-last-crash)
Mach exception handling | `BITHockeyManager.shared().disableMachExceptionHandler = true]` | [Documentation (enabled by default)](~/sdk/crashes/macos.md#disabling-mach-exception-handling)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-2-4-attach-additional-data) | [Documentation (can be attached from delegate)](~/sdk/crashes/macos.md#add-attachments-to-a-crash-report) |
Customize user dialog | [setCrashReportUIHandler](https://github.com/bitstadium/HockeySDK-tvOS/blob/62f4cff75262ca3e58ec80b2db3c7414637be8c3/Classes/BITCrashManager.h#L310) | [Documentation (not provided by default)](~/sdk/crashes/macos.md#ask-for-the-users-consent-to-send-a-crash-log)
Disable service at runtime | [BITHockeyManager.shared().isCrashManagerDisabled = true](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeysdk-for-tvos#3-2-1-disable-crash-reporting) | [MSCrashes.setEnabled(false)](~/sdk/crashes/macos.md#enable-or-disable-app-center-crashes-at-runtime)

* * *

### Feedback

This service wont be supported in App Center.

## 4. Contact us

In case you have any questions or feedback related to the SDK migration, please contact us via support by clicking on the blue icon in App Center portal or leaving us a note in the docs itself.

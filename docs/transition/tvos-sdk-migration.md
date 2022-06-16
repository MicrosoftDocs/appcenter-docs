---
title: HockeySDK for tvOS Migration
description: Migrate from the HockeySDK to App Center SDK (tvOS)
author: lucen-ms
ms.author: lucen
ms.date: 06/13/2022
ms.topic: article
ms.assetid: 44a08a47-85e2-4456-9b15-d524037df036
ms.service: vs-appcenter
---

# Migrate from the HockeySDK to App Center SDK for tvOS

[!INCLUDE [sdk migration dropdown](includes/sdk-migration-dropdown.md)]

## 1. Update the libraries

### 1.1 Remove old HockeySDK

#### Manual

If you've added the SDK manually, follow these steps:

1. Remove `HockeySDK.framework` reference from the XCode project. Click the _Remove reference_ button, don't click _Move to Trash_ button.

1. Open your project settings and under **Build Settings** tab in the **Header Search Paths** / **Framework Search Paths** sections, remove the locations for header files related to HockeySDK.

1. Open your project settings and under **Build Phases** tab in the **Link Binary with Libraries** section, remove the dependency entries related to HockeySDK.

1. Delete `HockeySDK.framework` from the file system.

#### Podfile

If you've added the SDK using **CocoaPods**, remove the `pod "HockeySDK-tvOS"` line from the Podfile, then run `pod install`.

#### Carthage

1. Remove HockeySDK references from the `Cartfile`. Delete `Cartfile.Resolved` from the file system.

1. Delete `HockeySDK.framework` and `HockeySDK.framework.dSYM` from the XCode project and click the **Move to Trash** button.

1. Open the **Build Phases** tab and locate the **Run Script** section. Remove HockeyApp from the `input.xcfilelist` and `output.xcfilelist`.

### 1.2 Add the new App Center SDK

The App Center SDK supports integration via Cocoapods, Carthage, Swift Package Manager and by using the Frameworks in your Xcode project. Read detailed instructions how to how to integrate the App Center SDK in the [App Center SDK documentation](~/sdk/getting-started/tvos.md#3-add-the-app-center-sdk-modules).

> [!NOTE]
> The App Center SDK is designed with a modular approach so you can use any or all of the services. See the equivalences in the next table:
> 
> HockeyApp class  | App Center module
> ---------------- | -----------------
> `MetricsManager` | `Analytics`
> `CrashManager`   | `Crashes`

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
   [MSACAppCenter start:@"{Your app secret}" withServices:@[[MSACAnalytics class], [MSACCrashes class]]];
   ```
   ```swift
   AppCenter.start(withAppSecret: "{Your App Secret}", services: [Analytics.self, Crashes.self])
   ```

1. Replace HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

#### [Objective-C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Adjust log level | `[BITHockeyManager sharedHockeyManager].logLevel = BITLogLevelVerbose` | [[MSACAppCenter setLogLevel:MSACLogLevelVerbose]](~/sdk/other-apis/tvos.md#adjust-the-log-level)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Adjust log level | `BITHockeyManager.shared().logLevel = BITLogLevel.verbose` | [MSACAppCenter.setLogLevel(MSACLogLevel.Verbose)](~/sdk/other-apis/tvos.md#adjust-the-log-level)

* * *

### Analytics

The HockeySDK collects metrics by default. The App Center SDK doesn't collect any (analytics) metrics by default. To collect metrics using the App Center SDK, pass `MSACAnalytics` to the `start:` method.

#### [Objective-C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically track sessions | Enabled by default | [Documentation (enabled by default)](~/sdk/analytics/tvos.md#session-and-device-information)
Custom events with properties | Yes | [[MSACAnalytics trackEvent:withProperties:]](~/sdk/analytics/tvos.md#custom-events)
Disable service at runtime | `[BITHockeyManager sharedHockeyManager].disableMetricsManager = YES` | [[MSACAnalytics setEnabled:NO]](~/sdk/analytics/tvos.md#enable-or-disable-app-center-analytics-at-runtime)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically track sessions | Enabled by default | [Documentation (enabled by default)](~/sdk/analytics/tvos.md#session-and-device-information)
Custom events with properties | Yes | [MSACAnalytics.trackEvent(eventName, withProperties: properties)](~/sdk/analytics/tvos.md#custom-events)
Disable service at runtime | `BITHockeyManager.shared().isMetricsManagerDisabled = true` | [MSACAnalytics.setEnabled(false)](~/sdk/analytics/tvos.md#enable-or-disable-app-center-analytics-at-runtime)

* * *

### Crashes

The HockeySDK reports crashes by default. Crashes will be immediately sent to the server the next time the app is launched.
The App Center SDK doesn't report any crashes by default. To collect crashes using the App Center SDK, pass `MSACCrashes` to the `start:` method.

#### [Objective-C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically send crashes | Enabled by default | [Documentation (enabled by default)](~/sdk/crashes/tvos.md#should-the-crash-be-processed)
Generate a test crash | `[[BITHockeyManager sharedHockeyManager].crashManager generateTestCrash]` | [[MSACCrashes generateTestCrash]](~/sdk/crashes/tvos.md#generate-a-test-crash)
Info about the previous crash | `[[BITHockeyManager sharedHockeyManager].crashManager lastSessionCrashDetails]` | [[MSACCrashes lastSessionCrashReport]](~/sdk/crashes/tvos.md#details-about-the-last-crash)
Attach additional meta data | Yes | [Documentation (can be attached from delegate)](~/sdk/crashes/tvos.md#add-attachments-to-a-crash-report) |
Customize user dialog | [setCrashReportUIHandler](https://github.com/bitstadium/HockeySDK-tvOS/blob/62f4cff75262ca3e58ec80b2db3c7414637be8c3/Classes/BITCrashManager.h#L310) | [Documentation (not provided by default)](~/sdk/crashes/tvos.md#ask-for-the-users-consent-to-send-a-crash-log)
Disable service at runtime | `[[BITHockeyManager sharedHockeyManager] setDisableCrashManager: YES]` | [[MSACCrashes setEnabled:NO]](~/sdk/crashes/tvos.md#enable-or-disable-app-center-crashes-at-runtime)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically send Crashes | `BITHockeyManager.shared().crashManager.isAutoSubmitCrashReport = true` | [Documentation (enabled by default)](~/sdk/crashes/tvos.md#should-the-crash-be-processed)
Generate a test crash | `BITHockeyManager.shared().crashManager.generateTestCrash()` | [MSACCrashes.generateTestCrash()](~/sdk/crashes/tvos.md#generate-a-test-crash)
Info about the previous crash | `BITHockeyManager.shared().crashManager.lastSessionCrashDetails` | [MSACCrashes.lastSessionCrashReport()](~/sdk/crashes/tvos.md#details-about-the-last-crash)
Attach additional meta data | Yes | [Documentation (can be attached from delegate)](~/sdk/crashes/tvos.md#add-attachments-to-a-crash-report) |
Customize user dialog | [setCrashReportUIHandler](https://github.com/bitstadium/HockeySDK-tvOS/blob/62f4cff75262ca3e58ec80b2db3c7414637be8c3/Classes/BITCrashManager.h#L310) | [Documentation (not provided by default)](~/sdk/crashes/tvos.md#ask-for-the-users-consent-to-send-a-crash-log)
Disable service at runtime | `BITHockeyManager.shared().isCrashManagerDisabled = true` | [MSACCrashes.setEnabled(false)](~/sdk/crashes/tvos.md#enable-or-disable-app-center-crashes-at-runtime)

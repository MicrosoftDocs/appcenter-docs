---
title: HockeySDK for iOS Migration
description: Migrate from the HockeySDK to App Center SDK for iOS
author: elamalani
ms.author: emalani
ms.date: 10/09/2019
ms.topic: article
ms.assetid: 7c93b0de-5900-432c-9f15-5f9d2a51187d
ms.service: vs-appcenter
ms.tgt_pltfrm: ios
dev_langs:
 - swift
 - objc
---

# Migrate from the HockeySDK to App Center SDK for iOS

[!include[](sdk-migration-dropdown.md)]

## 1. Update the libraries

### 1.1 Remove old HockeySDK

#### Manual

If you have added the SDK manually, follow these steps:

1. Remove `HockeySDK.embeddedframework` reference from the XCode project. Do not click _Move to Trash_ button, just click the _Remove reference_ button.

1. Open your project settings and under **Build Settings** tab in the **Header Search Paths** / **Framework Search Paths** sections, remove the locations for header files related to HockeySDK.

1. Open your project settings and under **Build Phases** tab in the **Link Binary with Libraries** section, remove the dependency entries related to HockeySDK.

1. Delete `HockeySDK.embeddedframework` from the file system.

#### Podfile

If you have added the SDK using **CocoaPods**, remove the `pod "HockeySDK"` line from the Podfile, then run `pod install`.

#### Carthage

If you have added the SDK using **Carthage**, remove the line `github "bitstadium/HockeySDK-iOS"` from your `Cartfile` and clean up the dependencies from your project.

### 1.2 Add the App Center SDK

The App Center SDK supports to be integrated via Cocoapods, Carthage and using the Frameworks in your Xcode project. Read detailed instructions how to how to integrate the App Center SDK in the [App Center SDK documentation](~/sdk/getting-started/ios.md#3-add-the-app-center-sdk-modules).

> [!NOTE]
> The App Center SDK is designed with a modular approach – you can integrate only those services that you're interested in. See the equivalences in the next table:

HockeyApp class  | App Center module
---------------- | -----------------
`MetricsManager` | `Analytics`
`CrashManager`   | `Crashes`
`UpdateManager`  | `Distribute`

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
   @import AppCenterDistribute;
   ```
   ```swift
   import AppCenter
   import AppCenterAnalytics
   import AppCenterCrashes
   import AppCenterDistribute
   ```

1. Replace registration code

   Find the `didFinishLaunchingWithOptions` method and replace HockeyApp code occurrences.

   Before:

   ```objc
   [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"APP_IDENTIFIER"];
   [[BITHockeyManager sharedHockeyManager] startManager];
   [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
   ```
   ```swift
   BITHockeyManager.shared().configure(withIdentifier: "APP_IDENTIFIER")
   BITHockeyManager.shared().start()
   BITHockeyManager.shared().authenticator.authenticateInstallation()
   ```

   After:

   ```objc
   [MSAppCenter start:@"{Your app secret}" withServices:@[[MSAnalytics class], [MSCrashes class], [MSDistribute class]]];
   ```
   ```swift
   MSAppCenter.start("{Your app secret}", withServices: [MSAnalytics.self, MSCrashes.self, MSDistribute.self])
   ```

   > [!NOTE]
   > App Center SDK does not have equivalents for `[[BITHockeyManager sharedHockeyManager] configureWithBetaIdentifier:liveIdentifier:delegate]`.

1. [Optional] Modify the project's **Info.plist**

    If you intend to use **Distribute**, follow the steps above:

    - Add a new key for `URL types` or `CFBundleURLTypes` in your **Info.plist** file (in case XCode displays your Info.plist as source code).
    - Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
    - Enter `appcenter-${APP_SECRET}` as the URL scheme and replace `${APP_SECRET}` with the App Secret of your app.

    For more information on this, refer to [App Center Distribute documentation](~/sdk/distribute/ios.md#23-modify-the-projects-infoplist).

1. Replace HockeyApp API calls throughout the application. The detailed API mapping tables are given below.

## 3. Services and feature comparison

### Core

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Adjust log level | [[BITHockeyManager sharedHockeyManager].logLevel = BITLogLevelVerbose](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-12-debug-information) | [[MSAppCenter setLogLevel:MSLogLevelVerbose]](~/sdk/other-apis/ios.md#adjust-the-log-level)
Identify installations | `[BITHockeyManager sharedHockeyManager].installString` | [[MSAppCenter installId]](~/sdk/other-apis/ios.md#identify-installations)
Identify users | `[BITHockeyManager sharedHockeyManager].userID` | [[MSAppCenter setUserId:@"your-user-id"]](~/sdk/other-apis/ios.md#identify-users)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Adjust log level | [BITHockeyManager.shared().logLevel = BITLogLevel.verbose](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-12-debug-information) | [MSAppCenter.setLogLevel(MSLogLevel.Verbose)](~/sdk/other-apis/ios.md#adjust-the-log-level)
Identify installations | `BITHockeyManager.shared().installString` | [MSAppCenter.installId()](~/sdk/other-apis/ios.md#identify-installations)
Identify users | `BITHockeyManager.shared().userID` | [MSAppCenter.setUserId("your-user-id")](~/sdk/other-apis/ios.md#identify-users)

* * *

### Analytics

The HockeySDK enables metrics collecting per default.
App Center SDK registers Analytics service only if you pass `MSAnalytics` class to the `start:` method.

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically track sessions | [Documentation (can't be disabled)](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-7-user-metrics) | [Documentation (can't be disabled)](~/sdk/analytics/ios.md#session-and-device-information)
Custom events with properties | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-7-2-attaching-custom-properties-and-measurements-to-a-custom-event) | [[MSAnalytics trackEvent:withProperties:]](~/sdk/analytics/ios.md#custom-events)
Disable service at runtime | [[BITHockeyManager sharedHockeyManager].disableMetricsManager = YES](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-7-user-metrics) | [[MSAnalytics setEnabled:NO]](~/sdk/analytics/ios.md#enable-or-disable-app-center-analytics-at-runtime)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically track sessions | [Documentation (enabled by default)](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-7-user-metrics) | [Documentation (enabled by default)](~/sdk/analytics/ios.md#session-and-device-information)
Custom events with properties | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-7-2-attaching-custom-properties-and-measurements-to-a-custom-event) | [MSAnalytics.trackEvent(eventName, withProperties: properties)](~/sdk/analytics/ios.md#custom-events)
Disable service at runtime | [BITHockeyManager.shared().isMetricsManagerDisabled = true](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-7-user-metrics) | [MSAnalytics.setEnabled(false)](~/sdk/analytics/ios.md#enable-or-disable-app-center-analytics-at-runtime)

* * *

### Crashes

The HockeySDK enables crash reporting per default. Crashes will be immediately sent to the server the next time the app is launched.
App Center SDK registers Crashes service only if you pass `MSCrashes` class to the `start:` method.

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically send crashes | [[[BITHockeyManager sharedHockeyManager].crashManager setCrashManagerStatus: BITCrashManagerStatusAutoSend]](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-2-autosend-crash-reports) | [Documentation (enabled by default)](~/sdk/crashes/ios.md#should-the-crash-be-processed)
Generate a test crash | `[[BITHockeyManager sharedHockeyManager].crashManager generateTestCrash]` | [[MSCrashes generateTestCrash]](~/sdk/crashes/ios.md#generate-a-test-crash)
Info about the previous crash | `[[BITHockeyManager sharedHockeyManager].crashManager lastSessionCrashDetails]` | [[MSCrashes lastSessionCrashReport]](~/sdk/crashes/ios.md#get-more-information-about-a-previous-crash)
Mach exception handling | [Documentation (disabled by default)](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-3-mach-exception-handling) | [Documentation (enabled by default)](~/sdk/crashes/ios.md#disabling-mach-exception-handling)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-4-attach-additional-data) | [Documentation (can be attached from delegate)](~/sdk/crashes/ios.md#add-attachments-to-a-crash-report) |
Customize user dialog | [setAlertViewHandler](https://github.com/bitstadium/HockeySDK-iOS/blob/5.1.4/Classes/BITCrashManager.h#L341-L361setCrashReportUIHandler) | [Documentation (not provided by default)](~/sdk/crashes/ios.md#ask-for-the-users-consent-to-send-a-crash-log)
Disable service at runtime | [[[BITHockeyManager sharedHockeyManager] setDisableCrashManager: YES]](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-1-disable-crash-reporting) | [[MSCrashes setEnabled:NO]](~/sdk/crashes/ios.md#enable-or-disable-app-center-crashes-at-runtime)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | ---------- | ---
Automatically send Crashes | [BITHockeyManager.shared().crashManager.crashManagerStatus = BITCrashManagerStatus.autoSend](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-2-autosend-crash-reports) | [Documentation (enabled by default)](~/sdk/crashes/ios.md#should-the-crash-be-processed)
Generate a test crash | `BITHockeyManager.shared().crashManager.generateTestCrash()` | [MSCrashes.generateTestCrash()](~/sdk/crashes/ios.md#generate-a-test-crash)
Info about the previous crash | `BITHockeyManager.shared().crashManager.lastSessionCrashDetails` | [MSCrashes.lastSessionCrashReport()](~/sdk/crashes/ios.md#get-more-information-about-a-previous-crash)
Mach exception handling | [Documentation (disabled by default)](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-3-mach-exception-handling) | [Documentation (enabled by default)](~/sdk/crashes/ios.md#disabling-mach-exception-handling)
Attach additional meta data | [Documentation](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-4-attach-additional-data) | [Documentation (can be attached from delegate)](~/sdk/crashes/ios.md#add-attachments-to-a-crash-report) |
Customize user dialog | [setAlertViewHandler](https://github.com/bitstadium/HockeySDK-iOS/blob/5.1.4/Classes/BITCrashManager.h#L341-L361setCrashReportUIHandler) | [Documentation (not provided by default)](~/sdk/crashes/ios.md#ask-for-the-users-consent-to-send-a-crash-log)
Disable service at runtime | [BITHockeyManager.shared().isCrashManagerDisabled = true](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-6-1-disable-crash-reporting) | [MSCrashes.setEnabled(false)](~/sdk/crashes/ios.md#enable-or-disable-app-center-crashes-at-runtime)

* * *

### Distribute

> [!NOTE]
> Unlike in HockeyApp, App Center in-app updates feature will ONLY work with builds that are distributed using the App Center Distribute service. Distribute won't work when the debugger is attached.
Also, once the app is installed and opened for the first time after the App Center Distribute SDK has been added, a browser window will open to enable in-app updates. This is a one-time step that will not occur for subsequent releases of your app. Please refer to the [App Center Distribute Documentation](~/sdk/distribute/ios.md#how-do-in-app-updates-work) for more details.

The HockeySDK does not enable in-app updates by default.
App Center SDK registers in-app updates service only if you pass `MSDistribute` class to the `start:` method. This module is enabled by default, unlike in the HockeySDK.

#### [Objective C](#tab/objc/)

Feature | HockeyApp | App Center
------- | --------- | ---
Restricted in-app updates | [[[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation]](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/authenticating-users-on-ios) | [Documentation (works out of the box)](https://docs.microsoft.com/en-us/appcenter/distribution/groups)
Disable service at runtime | [[[BITHockeyManager sharedHockeyManager] setDisableUpdateManager: YES]](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-10-in-app-updates-beta-amp-enterprise-only-) | [[MSDistribute setEnabled:NO]](~/sdk/distribute/ios.md#enable-or-disable-app-center-distribute-at-runtime)
Customize the update dialog | [shouldDisplayUpdateAlertForUpdateManager](https://github.com/bitstadium/HockeySDK-iOS/blob/5.1.4/Classes/BITUpdateManagerDelegate.h#L49-L64) | [Documentation](~/sdk/distribute/ios.md#2-customize-the-update-dialog)

#### [Swift](#tab/swift/)

Feature | HockeyApp | App Center
------- | --------- | ---
Restricted in-app updates | [BITHockeyManager.shared().authenticator.authenticateInstallation()](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/authenticating-users-on-ios) | [Documentation (works out of the box)](https://docs.microsoft.com/en-us/appcenter/distribution/groups)
Disable service at runtime | [BITHockeyManager.shared().isUpdateManagerDisabled = true](https://support.hockeyapp.net/kb/client-integration-ios-mac-os-x-tvos/hockeyapp-for-ios#3-10-in-app-updates-beta-amp-enterprise-only-) | [MSDistribute.setEnabled(false)](~/sdk/distribute/ios.md#enable-or-disable-app-center-distribute-at-runtime)
Customize the update dialog | [shouldDisplayUpdateAlertForUpdateManager](https://github.com/bitstadium/HockeySDK-iOS/blob/5.1.4/Classes/BITUpdateManagerDelegate.h#L49-L64) | [Documentation](~/sdk/distribute/ios.md#2-customize-the-update-dialog)

### Feedback

The feedback service won't be supported in App Center. See [HockeyApp feedback](feedback.md).

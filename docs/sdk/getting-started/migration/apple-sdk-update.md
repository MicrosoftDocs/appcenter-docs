---
title: How to migrate to App Center SDK 4.0.0 and higher
description: How to migrate to App Center SDK 4.0.0 and higher
keywords: sdk, apple
author: king-of-spades
ms.author: kegr
ms.date: 10/22/2020
ms.topic: migration
ms.assetid: 408cdcba-07bb-11eb-adc1-0242ac120002
ms.tgt_pltfrm: apple
dev_langs:
 - swift
 - objc
---

# Migrate to App Center SDK 4.0.0 and higher

In order to avoid a naming conflict with classes in Apple's private frameworks, SDK now uses `MSAC` prefix instead of `MS` which changes the SDK API.

Swift API has now a more _swifty_ style, and all classes should be used without a prefix, e.g. `AppCenter`. There are also changes in functions and properties naming based on Apple Swift best practices.

## Update the App Center SDK

First, update the App Center SDK by using one of the dependency managers.

## Usage of APIs

The fastest and the most convenient way to update the App Center SDK API is to use autocorrect. After the replacement, you should get the result as shown below.

Before updating App Center SDK to `4.0.0` and higher.

```objc
[MSAppCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```
```swift
MSAppCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```

After updating App Center SDK to `4.0.0` and higher.

```objc
[MSACAppCenter start:@"{Your App Secret}" withServices:@[[MSACAnalytics class], [MSACCrashes class]]];
```
```swift
AppCenter.start(withAppSecret: "{Your App Secret}", services: [Analytics.self, Crashes.self])
```

In addition, the getter `[MSACWrapperCrashesHelper getCrashHandlerSetupDelegate]` is now deprecated, please use `[MSACWrapperCrashesHelper crashHandlerSetupDelegate]` instead.

The following tables show the APIs that have been renamed.

| App Center Core lower `4.0.0`        | App Center Core `4.0.0`+ (ObjC)       | App Center Core `4.0.0`+ (Swift) |
| ------------------------------------ | ---------------------------------------------- | -------------------------------------- |
|  MSAppCenter                         | MSACAppCenter                                  | AppCenter                              |
|  MSLogLevel                          | MSACLogLevel                                   | LogLevel                               |
|  MSLogLevelVerbose                   | MSACLogLevelVerbose                            | LogLevel.verbose                       |
|  MSLogLevelWarning                   | MSACLogLevelWarning                            | .warning                                |
|  MSLogLevelInfo                      | MSACLogLevelInfo                               | .info                                   |
|  MSLogLevelAssert                    | MSACLogLevelAssert                             | .assert                                 |
|  MSCustomProperties                  | MSACCustomProperties                           | CustomProperties                       |

| App Center Analytics lower `4.0.0`   | App Center Analytics `4.0.0`+ (ObjC)  | App Center Alanlytics `4.0.0`+ (Swift) |
| ------------------------------------ | ---------------------------------------------- | -------------------------------------- |
|  MSAnalytics                         | MSACAnalytics                                  | Analytics                              |
|  MSFlags                             | MSACFlags                                      | Flags                                  |
|  MSFlagsNormal                       | MSACFlagsNormal                                | Flags.normal                           |
|  MSFlagsCritical                     | MSACFlagsCritical                              | .critical                              |
|  MSFlagsDefault                      | MSACFlagsDefault                               | .default                               |
|  MSEventProperties                   | MSACEventProperties                            | EventProperties                        |

| App Center Crashes lower `4.0.0`     | App Center Crashes `4.0.0`+ (ObjC)    | App Center Crashes `4.0.0`+ (Swift)    |
| ------------------------------------ | --------------------------------------------- | -------------------------------------- |
|  MSCrashes                           | MSACCrashes                                   | Crashes                                |
|  MSCrashesDelegate                   | MSACCrashesDelegate                           | CrashesDelegate                        |
|  MSErrorReport                       | MSACErrorReport                               | ErrorReport                            |
|  MSErrorAttachmentLog                | MSACErrorAttachmentLog                        | ErrorAttachmentLog                     |
|  MSUserConfirmationDontSend          | MSACUserConfirmationDontSend                  | UserConfirmation.dontSend              |
|  MSUserConfirmationSend              | MSACUserConfirmationSend                      | .send                                  |
|  MSUserConfirmationAlways            | MSACUserConfirmationAlways                    | .always                                |

| App Center Distribute lower `4.0.0`  | App Center Distribute `4.0.0`+ (ObjC) | App Center Distribute `4.0.0`+ (Swift) |
| ------------------------------------ | ------------------------------------- | -------------------------------------- |
|  MSDistribute                        | MSACDistribute                        | Distribute                             |
|  MSDistributeDelegate                | MSACDistributeDelegate                | DistributeDelegate                     |
|  MSReleaseDetails                    | MSACReleaseDetails                    | ReleaseDetails                         |
|  MSUpdateAction                      | MSACUpdateAction                      | UpdateAction                           |
|  MSUpdateActionUpdate                | MSACUpdateActionUpdate                | UpdateAction.update                    |
|  MSUpdateActionPostpone              | MSACUpdateActionPostpone              | .postpone                              |
|  MSUpdateTrack                       | MSACUpdateTrack                       | UpdateTrack                            |
|  MSUpdateTrackPublic                 | MSACUpdateTrackPublic                 | UpdateTrack.public                     |
|  MSUpdateTrackPrivate                | MSACUpdateTrackPrivate                | .private                               |

### Swift API changes

| App Center Core lower `4.0.0`                                           | App Center Core `4.0.0`+                                                   |
| ----------------------------------------------------------------------- | -------------------------------------------------------------------------- |
| MSAppCenter.isEnabled()                                                 | AppCenter.enabled                                                          |
| MSAppCenter.setEnabled(true)                                            | AppCenter.enabled = true                                                   |
| MSAppCenter.isConfigured()                                              | AppCenter.isConfigured                                                     |
| MSAppCenter.isRunningInAppCenterTestCloud()                             | AppCenter.isRunningInAppCenterTestCloud                                    |
| MSAppCenter.isAppDelegateForwarderEnabled()                             | AppCenter.isAppDelegateForwarderEnabled                                    |
| MSAppCenter.installId()                                                 | AppCenter.installId                                                        |
| MSAppCenter.isDebuggerAttached()                                        | AppCenter.isDebuggerAttached                                               |
| MSAppCenter.sdkVersion()                                                | AppCenter.sdkVersion                                                       |
| MSAppCenter.setLogUrl("{Log Url}")                                      | AppCenter.logUrl = "{Log Url}"                                             |
| MSAppCenter.setLogLevel(.verbose)                                       | AppCenter.logLevel = .verbose                                              |
| MSAppCenter.setLogHandler(logHandler)                                   | AppCenter.logHandler = logHandler                                          |
| MSAppCenter.setCustomProperties(props)                                  | AppCenter.customProperties = props                                         |
| MSAppCenter.SetUserId("{User Id}")                                      | AppCenter.userId = "{User Id}"                                             |
| MSAppCenter.setCountryCode("{Country Code}")                            | AppCenter.countryCode = "{Country Code}"                                   |
| MSAppCenter.setAppSecret("{App Secret}")                                | AppCenter.appSecret = "{App Secret}"                                       |
| MSAppCenter.setString("value", forKey: "key")                           | AppCenter.setString("value", for: "key")                                   |
| MSServiceAbstract.isAppSecretRequired()                                 | ServiceAbstract.isAppSecretRequired                                        |
| MSAppCenter.addChannelUnitWithConfiguration(configuration)              | AppCenter.addChannelUnit(withConfiguration:configuration)                  |
| MSAppCenter.configureWithAppSecret("{App Secret}")                      | AppCenter.configure(withAppSecret:"{App Secret}")                          |
| MSAppCenter.start("{App Secret}", withServices: [MSAnalytics.self])     | AppCenter.start(withAppSecret: "{App Secret}", services: [Analytics.self]) |
| MSAppCenter.startWithServices([MSAnalytics.self, MSCrashes.self])       | AppCenter.start(services: [Analytics.self, Crashes.self])                  |
| MSAppCenter.startFromLibraryWithServices([MSAnalytics.self])            | AppCenter.startFromLibrary(services: [Analytics.self]) ")                  |

| App Center Analytics lower `4.0.0`                    | App Center Analytics `4.0.0`+                  |
| ----------------------------------------------------- | ---------------------------------------------- |
| MSAnalytics.isEnabled()                               | Analytics.enabled                              |
| MSAnalytics.setEnabled(true)                          | Analytics.enabled = true                       |
| MSAnalytics.setTransmissionInterval(600)              | Analytics.transmissionInterval = 600           |

| App Center Crashes lower `4.0.0`                      | App Center Crashes `4.0.0`+                    |
| ----------------------------------------------------- | ---------------------------------------------- |
| MSCrashes.isEnabled()                                 | Crashes.enabled                                |
| MSCrashes.setEnabled(true)                            | Crashes.enabled = true                         |
| MSCrashes.setDelegate(delegate)                       | Crashes.delegate = delegate                    |
| MSCrashes.hasCrashedInLastSession()                   | Crashes.hasCrashedInLastSession                |
| MSCrashes.hasReceivedMemoryWarningInLastSession()     | Crashes.hasReceivedMemoryWarningInLastSession  |
| MSErrorReport.isAppKill()                             | ErrorReport.isAppKill                          |
| MSCrashes.lastSessionCrashReport()                    | Crashes.lastSessionCrashReport                 |
| MSCrashes.setAutomaticProcessing(true)                | Crashes.automaticProcessing = true             |
| MSWrapperCrashesHelper.getCrashHandlerSetupDelegate   | WrapperCrashesHelper.crashHandlerSetupDelegate |
| MSCrashes.setUserConfirmationHandler(handler)         | Crashes.userConfirmationHandler = handler      |

| App Center Distribute lower `4.0.0`                   | App Center Distribute `4.0.0`+                 |
| ----------------------------------------------------- | ---------------------------------------------- |
| MSDistribute.isEnabled()                              | Distribute.enabled                             |
| MSDistribute.setEnabled(true)                         | Distribute.enabled = true                      |
| MSDistribute.setDelegate(delegate)                    | Distribute.delegate = delegate                 |
| MSDistribute.setApiUrl("{API URL}")                   | Distribute.apiUrl = "{API URL}"                |
| MSDistribute.setInstallUrl("{Install URL}")           | Distribute.installUrl = "{Instal URL}"         |

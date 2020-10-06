---
title: How migrate to App Center SDK 4.0.0 and higher
description: How migrate to App Center SDK 4.0.0 and higher
keywords: sdk, apple
author: king-of-spades
ms.author: kegr
ms.date: 10/06/2020
ms.topic: migration
ms.assetid: 408cdcba-07bb-11eb-adc1-0242ac120002
ms.tgt_pltfrm: apple
dev_langs:  
 - swift
 - objc
---

# Migrate to App Center SDK 4.0.0 and higher
In order to avoid a naming conflict with classes in Apple's private frameworks, SDK now uses `MSAC` prefix instead of `MS` which changes the SDK API.

## Update the App Center SDK 
First update the App Center SDK by using one of the dependency managers.

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
MSACAppCenter.start("{Your App Secret}", withServices: [MSACAnalytics.self, MSACCrashes.self])
```

The following tables show the APIs that have been renamed.

| App Center Core lower `4.0.0`        | App Center Core `4.0.0` and higher            |
| ------------------------------------ | ----------------------------------------------|
|  MSAppCenter                         | MSACAppCenter                                 |
|  MSLogLevel                          | MSACLogLevel                                  |
|  MSLogLevelVerbose                   | MSACLogLevelVerbose                           |
|  MSLogLevelWarning                   | MSACLogLevelWarning                           |
|  MSLogLevelInfo                      | MSACLogLevelInfo                              |
|  MSLogLevelAssert                    | MSACLogLevelAssert                            |
|  MSCustomProperties                  | MSACCustomProperties                          |

| App Center Analytics lower `4.0.0`   | App Center Analytics `4.0.0` and higher       |
| ------------------------------------ | ----------------------------------------------|
|  MSAnalytics                         | MSACAnalytics                                 |
|  MSFlags                             | MSACFlags                                     |
|  MSFlagsNormal                       | MSACFlagsNormal                               |
|  MSFlagsCritical                     | MSACFlagsCritical                             |
|  MSEventProperties                   | MSACEventProperties                           |

| App Center Crashes lower `4.0.0`     | App Center Crashes `4.0.0` and higher         |
| ------------------------------------ | ----------------------------------------------|
|  MSCrashes                           | MSACCrashes                                   |
|  MSCrashesDelegate                   | MSACCrashesDelegate                           |
|  MSErrorReport                       | MSACErrorReport                               |
|  MSErrorAttachmentLog                | MSACErrorAttachmentLog                        |
|  MSUserConfirmationDontSend          | MSACUserConfirmationDontSend                  |
|  MSUserConfirmationSend              | MSACUserConfirmationSend                      |
|  MSUserConfirmationAlways            | MSACUserConfirmationAlways                    |

| App Center Distribute lower `4.0.0`  | App Center Distribute `4.0.0` and higher      |
| ------------------------------------ | ----------------------------------------------|
|  MSDistribute                        | MSACDistribute                                |
|  MSDistributeDelegate                | MSACDistributeDelegate                        |
|  MSReleaseDetails                    | MSACReleaseDetails                            |
|  MSUpdateAction                      | MSACUpdateAction                              |
|  MSUpdateActionUpdate                | MSACUpdateActionUpdate                        |
|  MSUpdateActionPostpone              | MSACUpdateActionPostpone                      |
|  MSUserConfirmationAlways            | MSACUserConfirmationAlways                    |
|  MSUpdateTrack                       | MSACUpdateTrack                               |
|  MSUpdateTrackPublic                 | MSACUpdateTrackPublic                         |
|  MSUpdateTrackPrivate                | MSACUpdateTrackPrivate                        |
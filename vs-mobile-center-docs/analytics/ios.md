---
title: iOS  Analytics
description: Analytics for iOS apps
keywords: ios
author:
ms.author:
ms.date: 01/20/17
ms.topic: article
ms.assetid: 75fe684d-c3a6-4db6-9e69-ba2b499a06ab
ms.service: mobile-center
ms.tgt_pltfrm: ios
---

# iOS Analytics

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [React Native](react-native.md)

This page gives a summary of how to integrate the SDK for Analytics. Should you need more details, the detailed integration instruction can be found at [in the SDK section](~/sdk/getting-started/ios.md).
The SDK section also contains instruction for using CocoaPods

## 1. Add the SDK to the project

1. Download and unzip the [SDK](https://aka.ms/ehvc9e)
2. Copy the frameworks into your project in the appropriate directory
3. Add `MobileCenter.framework` and `MobileCenterAnalytics.framework` to your project

## 2. Start the SDK

Add the following to your `didFinishLaunchingWithOptions` delegate:

> [!div class="tabbedCodeSnippets" objectivec='Objective-C' swift='Swift']
```objectivec
[MSMobileCenter start:@"{Your App Secret}" withFeatures:@[[MSAnalytics class]]];
```
```swift
MSMobileCenter.start("{Your App Secret}", withFeatures: [MSAnalytics.self])
```

Make sure that the `imports` are added.

You will find your app secret on the **Manage App** section on the Mobile Center portal.

## 3. Analyse

Now build and launch your app, then go to the Analytics section.  You should see 1 Active user and at least 1 session!
The charts will get more relevant as you get more users.

---
title: iOS Advanced APIs
description: iOS APIs in the Android Mobile Center SDK
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 01/20/17
ms.topic: article
ms.assetid: f79abed4-6e50-4d1c-aa1e-0b78b764908d
ms.service: mobile-center
ms.tgt_pltfrm: ios
---

# iOS Advanced APIs

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [Xamarin](xamarin.md)
- [React Native](react-native.md)

* **Debugging**: You can control the amount of log messages that show up from the Mobile Center SDK. Use the `setLogLevel` API to enable additional logging while debugging. By default, it is set to `MSLogLevelAssert` for App Store environment, `MSLogLevelWarning` otherwise.

    **Objective-C**

        [MSMobileCenter setLogLevel:MSLogLevelVerbose];


    **Swift**

        MSMobileCenter.setLogLevel(MSLogLevel.Verbose)


* **Get Install Identifier**: The Mobile Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed. The following API is useful for debugging purposes.

    **Objective-C**

        NSUUID *installId = [MSMobileCenter  installId];


    **Swift**

        var installId = MSMobileCenter.installId()


* **Enable/Disable the Mobile Center SDK:** If you want the Mobile Center SDK to be disabled completely, use the `setEnabled` API. When disabled, the SDK will not forward any information to Mobile Center.

    **Objective-C**

        [MSMobileCenter setEnabled:NO];


    **Swift**

        MSMobileCenter.setEnabled(false)

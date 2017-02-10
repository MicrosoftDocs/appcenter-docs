---
title: iOS Analytics
description: iOS for Android using Mobile Center
keywords: analytics
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: f5270e0d-6012-4717-9ce5-a7097e8f323e
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# iOS Analytics

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [Xamarin](xamarin.md)
- [React Native](react-native.md)

* **Track Session, Device Properties:**  Once the Analytics module is included in your app and the SDK is started, it will automatically track sessions, device properties like OS version, model, manufacturer etc. and you don’t need to add any additional code.
    Look at this section on how to [Get Started](/sdk/iOS/getting-started) if you haven't started it yet.

* **Custom Events:** You can track your own custom events with up to five properties to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal. For more information about custom events in Mobile Center, go to [Events Metrics](/analytics/understand-events). Once you have started the SDK, use the `trackEvent()` method to track your events with properties. You can send up to 200 distinct events. Also, note that there is a maximum of 256 characters supported per event name and 64 characters per event property name and event property value.

    **Objective-C**

        NSDictionary *properties = @{@"Category" : @"Music", @"FileName" : @"favorite.avi"};
        [MSAnalytics trackEvent:@"Video clicked" withProperties: properties];

    **Swift**

        MSAnalytics.trackEvent("Video clicked", withProperties: ["Category" : "Music", "FileName" : "favorite.avi"])


   Properties for events are entirely optional. If you just want to track an event, use this sample instead:

    **Objective-C**

        [MSAnalytics trackEvent:@"Video clicked"];


    **Swift**

        MSAnalytics.trackEvent("Video clicked")


* **Enable or disable Analytics:**  You can change the enabled state of the Analytics module at runtime by calling the `setEnabled` method. If you disable it, the SDK will not collect any more analytics information for the app. To re-enable it, pass `true` as a parameter in the same method.

    **Objective-C**

        [MSAnalytics setEnabled:NO];


    **Swift**

        MSAnalytics.setEnabled(false)


    You can also check if the module is enabled or not using the `isEnabled` method:

    **Objective-C**

        BOOL enabled = [MSAnalytics isEnabled];


    **Swift**

        var enabled = MSAnalytics.isEnabled()

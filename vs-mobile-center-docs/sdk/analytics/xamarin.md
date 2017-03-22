---
title: Xamarin Analytics
description: Analytics for Xamarin using Mobile Center
keywords: analytics
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: d70cdd52-e53c-45df-89df-6394ed887174
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Xamarin Analytics

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)
> * [React Native](react-native.md)

Analytics module lets you automatically track session, device properties and pages when you start the SDK and you can use API to track your custom events. Follow the [Getting Started](~/sdk/getting-started/xamarin.md) section if you haven't setup and started the SDK in your application yet.

* **Track Session, Device Properties:**  Once the Analytics module is included in your app and the SDK is started, it will automatically track sessions, device properties like OS Version, model, manufacturer etc. and you don’t need to add any additional code.
    Look at the information on how to [Start the SDK](~/sdk/getting-started/xamarin.md#4-start-the-sdk) if you haven't started it yet.

* **Custom Events:** You can track your own custom events with up to five properties to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal. For more information about custom events in Mobile Center, go to [Events Metrics](~/analytics/understand-events.md). Once you have started the SDK, use the `trackEvent()` method to track your events with properties. You can send up to 200 distinct events. Also, note that there is a maximum of 256 characters supported per event name and 64 characters per event property name and event property value.

        Analytics.TrackEvent("Video clicked", new Dictionary<string, string> { { "Category", "Music" }, { "FileName", "favorite.avi"}});

* **Enable or disable Analytics:**  You can change the enabled state of the Analytics module at runtime by calling the `Analytics.Enabled` property. If you disable it, the SDK will not collect any more analytics information for the app. To re-enable it, set property value as `true`.

       Analytics.Enabled = true;

    You can also check if the module is enabled or not using:

        bool isEnabled = Analytics.Enabled;

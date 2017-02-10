---
title: React Native Analytics
description: Analytics for React Native using Mobile Center
keywords: analytics
author: elamalani
ms.author: emalani
ms.date: 01/20/2017
ms.topic: article
ms.assetid: fde989ce-6c8b-4ec5-9efb-07d14bc22afb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# React Native Analytics

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [Xamarin](xamarin.md)
- [React Native](react-native.md)

Analytics module lets you automatically track session, device properties and pages when you start the SDK and you can use API to track your custom events. Follow the [Getting Started](/sdk/React-Native/getting-started#2-add-Mobile-Center-sdk-modules) section if you haven't setup and started the SDK in your application yet.

* **Using the Analytics API:**

   In files where you are using the Analytics SDK, import the library.

        // import the Analytics library at the top of the file
        import Analytics from "mobile-center-analytics";

* **Track Session, Device Properties:**  Once the Analytics module is included in your app and the SDK is started, it will automatically track sessions, device properties like OS Version, model, manufacturer etc. and you don’t need to add any additional code.

* **Custom Events:** You can track your own custom events with up to five properties to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal. For more information about custom events in Mobile Center, go to [Events Metrics](/analytics/understand-events). Once you have started the SDK, use the `trackEvent()` method to track your events with properties. You can send up to 200 distinct events. Also, note that there is a maximum of 256 characters supported per event name and 64 characters per event property name and event property value.

        Analytics.trackEvent(String name, Map<String,String> properties);

    This function returns a promise, in which the success case returns an empty string, and the error case returns the error.

    Properties for events are entirely optional. If you just want to track an event, use this sample instead:

        Analytics.trackEvent("My first event");

* **Enable or disable Analytics:**  You can change the enabled state of the Analytics module at runtime by calling the `setEnabled` method. If you disable it, the SDK will not collect any more analytics information for the app. To re-enable it, pass `true` as a parameter in the same method.

        Analytics.setEnabled(false);

    This function returns a promise, in which the success case returns an empty string, and the error case returns the error.

    You can also check if the module is enabled or not using the `isEnabled` method:

        boolean isEnabled = Analytics.isEnabled();

    This function returns a promise, in which the success case returns a `boolean`, and the error case returns the error.

* <a name="enable-javascript"></a>**Wait for JS to enable analytics:** In some cases, an application may want to ask users whether they want to share analytics information. In that case, during installation, you should select `I will manually enable events sending` during `react-native link`.

        For the [platform] app, should user tracking be enabled automatically ? (Use arrow keys)
        ❯ Enable Automatically
          Enable in JavaScript

    This means that for any information to be sent to Mobile Center (even basic session information), the developer must first enable Analytics inside the app by adding the following line to his code.

        Analytics.setEnabled(true);

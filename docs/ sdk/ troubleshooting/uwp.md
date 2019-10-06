---
title: UWP SDK Troubleshooting
description: Troubleshooting the App Center SDK for UWP
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 11/29/2017
ms.topic: article
ms.assetid: ef67ec59-c868-49e7-99e8-42b0399bde92
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: uwp
---

# UWP SDK Troubleshooting

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [React Native](react-native.md)
> * [Cordova](cordova.md)

## Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `Start()` method call. You can copy the exact `Start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

   ```csharp
   AppCenter.LogLevel = LogLevel.Verbose;
   ```

5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if App Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent

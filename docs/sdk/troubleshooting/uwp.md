---
title: UWP, WPF, and WinForms SDK Troubleshooting
description: Troubleshooting the App Center SDK for UWP
keywords: sdk
author: lucen-ms
ms.author: lucen
ms.date: 01/25/2021
ms.topic: article
ms.assetid: 77daff4a-81f7-480d-8582-ea4159c4bd40
ms.tgt_pltfrm: uwp
---

# UWP, WPF, and WinForms SDK Troubleshooting

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [macOS](macos.md)
> * [tvOS](tvOS.md)
> * [React Native](react-native.md)
> * [Cordova](cordova.md)
> * [Unity](unity.md)
> * [Windows](uwp.md)
> * [Xamarin](xamarin.md)

## Analytics data doesn't show up in the portal

1. Make sure you've integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `Start()` method call. You can copy the exact `Start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This log verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

   ```csharp
   AppCenter.LogLevel = LogLevel.Verbose;
   ```

5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Wait for some time if that’s the case.
7. To check if App Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it's been sent.

## Use App Center in the background tasks
The App Center SDK doesn't support sending logs from a background task. It happens due to the process of background task can terminate unexpectedly and doesn't wait for the finnishing job of async tasks. Read more about [background tasks](https://docs.microsoft.com/windows/uwp/launch-resume/support-your-app-with-background-tasks).

## Protect the App Center secret value

[!INCLUDE [app secret secure](../includes/app-secret-secure.md)]

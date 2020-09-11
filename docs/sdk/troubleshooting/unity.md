---
title: Unity SDK Troubleshooting
description: Troubleshooting the App Center SDK for Unity
keywords: sdk
author: king-of-spades
ms.author: kegr
ms.date: 06/08/2020
ms.topic: article
ms.assetid: afa02dbc-47ec-4256-b93c-0c286bb0483b
---

# Unity SDK Troubleshooting

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
2. Make sure your project is included the "App Center" object with attached `AppCenterBehavior` and your app secrets are added to the corresponding fields in the Inspector window. Make sure to also check the "Use _{service}_" boxes for each App Center service you intend to use.
3. Check the logs say "App Center SDK configured successfully" (in **Verbose** log level), then check if you see HTTPS request logs.
4. Make sure your device is online.
5. At times, logs might take a few minutes to surface in the portal. Wait for some time if that’s the case.
6. To check if App Center backend received your data, go to the **Log flow** section in Analytics service. Your events should appear once it has been sent.

## Crashes don't show up in the portal

1. Make sure you've integrated the SDK modules correctly.
2. Make sure your project is included the "App Center" object with attached `AppCenterBehavior` and your app secrets are added to the corresponding fields in the Inspector window. Make sure to also check the "Use _{service}_" boxes for each App Center service you intend to use.
3. Restart the app after a crash. App Center Crashes will forward the crash log only after it's restarted. The SDK won't save any crash log if you attached a debugger. Make sure the debugger isn't attached when you crash the app.
4. Check the logs say "App Center SDK configured successfully" (in **Verbose** log level), then check if you see HTTPS request logs.
5. Make sure your device is online.
6. At times, logs might take a few minutes to surface in the portal. Wait for some time if that’s the case.
7. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
8. To check if App Center backend received the crash, go to the **Log flow** section in the Analytics service. Your crashes should appear there, once it has been sent.
9. Make sure that the app has actually crashed and restarted: Unity catches most of the unhandled exceptions by default, meaning the app doesn't exit and therefore isn't considered a crash. If a crash is caught by Unity, it will be reported as "Error" by the SDK.

## Protect the App Center secret value

[!INCLUDE [app secret secure](../includes/app-secret-secure.md)]

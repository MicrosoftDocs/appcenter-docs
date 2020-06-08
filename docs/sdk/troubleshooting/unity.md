---
title: Unity SDK Troubleshooting
description: Troubleshooting the App Center SDK for Unity
keywords: sdk
author: ahdbilal
ms.author: ahbilal
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

1. Make sure you have integrated the SDK modules correctly.
2. Make sure your project is included the "App Center" object with attached `AppCenterBehavior` and your app secrets are added to the corresponding fields in the Inspector window. Make sure to also check the "Use _{service}_" boxes for each App Center service you intend to use.
3. Check the logs say "App Center SDK configured successfully" (in **Verbose** log level), then check if you see HTTPS request logs.
4. Make sure your device is online.
5. At times, logs might take a few minutes to surface in the portal. Please wait for some time if that’s the case.
6. To check if App Center backend received your data, go to the **Log flow** section in Analytics service. Your events should appear once it has been sent.

## Crashes don't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure your project is included the "App Center" object with attached `AppCenterBehavior` and your app secrets are added to the corresponding fields in the Inspector window. Make sure to also check the "Use _{service}_" boxes for each App Center service you intend to use.
3. You need to restart the app after a crash and App Center Crashes will forward the crash log only after it is restarted. The SDK will not save any crash log if you attached a debugger. Make sure the debugger is not attached when you crash the app.
4. Check the logs say "App Center SDK configured successfully" (in **Verbose** log level), then check if you see HTTPS request logs.
5. Make sure your device is online.
6. At times, logs might take a few minutes to surface in the portal. Please wait for some time if that’s the case.
7. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
8. To check if App Center backend received the crash, go to the **Log flow** section in the Analytics service. Your crashes should appear there, once it has been sent.
9. Make sure that the app has actually crashed and restarted: Unity catches most of the unhandled exceptions by default, meaning the app doesn't exit and therefore is not considered a crash. If a crash is caught by Unity, it will be reported as "Error" by the SDK.

## Protect the App Center secret value

The AppCenter secret is an identifier you app. The biggest risk if your **app_secret** is exposed is sending bad/unrelated traffic to your crashes and logging, as our SDKs use the app secret to know which app the traffic applies to. 
Our APIs are protected such that authorization happens at a user level, in which the user must provide an API token (which can be generated on the `App Center` site), and we check that they're authorized to perform the request operation with the app and organization specified. 
There is no way to be 100% secure the **app_secret**. As a way to increased security your application is using custom inject system your **app_secret** into your code via an environment variable so that at least the **app_secret** is not in clear in the code. 

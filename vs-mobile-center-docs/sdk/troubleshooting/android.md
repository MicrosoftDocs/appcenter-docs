---
title: Android SDK Troubleshooting
description: Troubleshooting the App Center SDK for Android
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 07/12/2017
ms.topic: article
ms.assetid: 4ad55002-05c9-4f5b-82b7-d29ba1234ce1
ms.service: mobile-center
ms.custom: sdk
---

# Android SDK Troubleshooting

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

## What Android permissions are required?

Depending on the services you use, the following permissions are required:

- All services: `INTERNET`, `ACCESS_NETWORK_STATE`
- Distribute: `REQUEST_INSTALL_PACKAGES`, `DOWNLOAD_WITHOUT_NOTIFICATION`

Required permissions are automatically merged into your app's manifest by the SDK.

None of these permissions require user approval at runtime, those are all install time permissions.

## Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start()` method call. You can copy the exact `start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  ```java
  MobileCenter.setLogLevel(Log.VERBOSE);
  ```

5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if App Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## Crashes don't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start()` method call. You can copy the exact `start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "App Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and our SDK will forward the crash log only after it is restarted.
5. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  ```java
  MobileCenter.setLogLevel(Log.VERBOSE);
  ```

6. Make sure your device is online.
7. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
8. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
9. To check if App Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.

## Distribute and in-app updates are blocking my automated UI tests

If you are running automated UI tests, enabled in-app updates will block your automated UI tests as they will try to authenticate against the App Center backend. We recommend to not enable App Center Distribute for your UI tests. 
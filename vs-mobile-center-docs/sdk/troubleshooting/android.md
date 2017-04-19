---
title: SDK Troubleshooting
description: Troubleshooting the Mobile Center SDK for Android
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 04/17/2017
ms.topic: article
ms.assetid: 4ad55002-05c9-4f5b-82b7-d29ba1234ce1
ms.service: mobile-center
ms.custom: sdk
---

# Troubleshooting

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

## 1. What Android permissions are required?

Depending on the services you use, the following permissions are required:

- All services: `INTERNET`, `ACCESS_NETWORK_STATE`
- Distribute: `REQUEST_INSTALL_PACKAGES`, `DOWNLOAD_WITHOUT_NOTIFICATION`

Required permissions are automatically merged into your app's manifest by the SDK.
    
None of these permissions require user approval at runtime, those are all install time permissions.

## 2. Analytics data doesn't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start()` method call. You can copy the exact `start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  ```java
  MobileCenter.setLogLevel(Log.VERBOSE);
  ```
  
5. Make sure your device is online.
6. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
7. To check if Mobile Center backend received your data, go to the Log flow section in Analytics service. Your events should appear once it has been sent.

## 3. Crashes don't show up in the portal

1. Make sure you have integrated the SDK modules correctly.
2. Make sure correct App Secret is included along with the `start()` method call. You can copy the exact `start()` code by opening the app in the portal and navigating to Getting Started page.
3. In the console, look for an Assert log with the message - "Mobile Center SDK configured successfully". This verifies that the SDK is configured successfully and your logs will be forwarded.
4. You need to restart the app after a crash and our SDK will forward the crash log only after it is restarted.
5. If you want to see the logs that get sent to the backend, change the log level to **Verbose** in your application and the SDK will print logs in the console. Call the API below before you start the SDK.

  ```java
  MobileCenter.setLogLevel(Log.VERBOSE);
  ```
  
6. Don't use any other library that provides Crash Reporting functionality. You can only have one crash reporting SDK integrated in your app.
7. Make sure your device is online.
8. At times, logs might take few minutes to surface in the portal. Please wait for some time if that’s the case.
9. If you want to check if the SDK detected the crash on the next app start, you can call the API to check whether the app crashed in the last session and shows an alert. Or you can extend the crash callback to see if it was successfully sent to the server.
10. To check if Mobile Center backend received the crash, go to the Log flow section in the Analytics service. Your crashes should appear there, once it has been sent.

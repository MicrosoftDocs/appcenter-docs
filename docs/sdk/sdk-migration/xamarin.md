---
title: App Center SDK Documentation
description: Using the App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 10/06/2017
ms.topic: article
ms.assetid: 278e0ad2-1616-4a3c-907a-092b57c81e96
ms.service: vs-appcenter
ms.custom: sdk
---

# Migrate to App Center Xamarin SDK

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

Follow these steps to update your current preview SDK to App Center Xamarin SDK.

1. Replace the following NuGet packages:

    * Uninstall **Microsoft.Azure.Mobile.Analytics** and install **Microsoft.AppCenter.Analytics**.
    * Uninstall **Microsoft.Azure.Mobile.Crashes** and install **Microsoft.AppCenter.Crashes**.
    * Uninstall **Microsoft.Azure.Mobile.Distribute** and install **Microsoft.AppCenter.Distribute**.
    * Uninstall **Microsoft.Azure.Mobile.Push** and install **Microsoft.AppCenter.Push**.
    * Uninstall **Microsoft.Azure.Mobile** after you replaced other packages if you still have it.

    Don't forget to update your PCL or .NET standard projects along with your Android or iOS specific projects if you have Mobile Center integrated in portable code (such as when you use **Xamarin Forms**).

2. Replace the using statements:

    ```csharp
    using Microsoft.Azure.Mobile;
    using Microsoft.Azure.Mobile.Analytics;
    using Microsoft.Azure.Mobile.Crashes;
    using Microsoft.Azure.Mobile.Distribute;
    using Microsoft.Azure.Mobile.Push;
    ```

    with

    ```csharp
    using Microsoft.AppCenter;
    using Microsoft.AppCenter.Analytics;
    using Microsoft.AppCenter.Crashes;
    using Microsoft.AppCenter.Distribute;
    using Microsoft.AppCenter.Push;
    ```

3. Replace the `Start` method API signature in your app code:

    ```csharp
    MobileCenter.Start(...);
    ```

    with

    ```csharp
    AppCenter.Start(...);
    ```

    Do the same class name replacement for any other `MobileCenter` call or property that you might have, such as `LogLevel` or `SetEnabledAsync`.

4. **For Distribute in-app updates** feature, replace URL scheme in your app:

    * Find a key for `URL types` (when using Visual Studio) or `CFBundleURLTypes` (if editing the file outside Visual Studio) in your *Info.plist* file.
    * Find a key of the first child item for `URL Schemes` (when using Visual Studio) or `CFBundleURLSchemes` (if editing the file outside Visual Studio).
    * Replace `mobilecenter-${APP_SECRET}` with `appcenter-${APP_SECRET}` for URL scheme. `${APP_SECRET}` is the App Secret of your app.

5. Build your application in Visual Studio and make sure you don’t see any compile or build time errors. Your application should now build locally.

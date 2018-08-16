---
title: App Center SDK Documentation
description: Migration to App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 11/15/2017
ms.topic: article
ms.assetid: 278e6ad2-2616-4a3c-907a-092b57c81e96
ms.service: vs-appcenter
ms.custom: sdk
---

# Migrate to App Center UWP SDK v1.0.0

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

Follow these steps to update your current preview SDK to App Center UWP SDK v1.0.0:

1. Replace following NuGet packages:

   * Uninstall **Microsoft.Azure.Mobile.Analytics** and install **Microsoft.AppCenter.Analytics**.
   * Uninstall **Microsoft.Azure.Mobile.Push** and install **Microsoft.AppCenter.Push**.
   * Uninstall **Microsoft.Azure.Mobile** after you replaced other packages if you still have it.

     If you are using **project.json** you can just search and replace the packages IDs and restore (in that case you also need to change version to **1.0.0**), but that does not work for **packages.config**-based projects (for those you have to uninstall and reinstall).

     Don't forget to update your PCL or .NET standard projects along with your UWP-specific project if you have Mobile Center integrated in portable code (such as when you use **Xamarin Forms**).

2. Replace the using statements:

    ```csharp
    using Microsoft.Azure.Mobile;
    using Microsoft.Azure.Mobile.Analytics;
    using Microsoft.Azure.Mobile.Push;
    ```

    with

    ```csharp
    using Microsoft.AppCenter;
    using Microsoft.AppCenter.Analytics;
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

4. Build your application in Visual Studio and make sure you don’t see any compile or build time errors. Your application should now build locally.

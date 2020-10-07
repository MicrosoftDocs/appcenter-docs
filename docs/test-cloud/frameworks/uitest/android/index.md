---
title: Preparing Xamarin.Android app for testing
description: A step-by-step guide to configure Xamarin.UITest for Xamarin.Android apps
author: king-of-spades
ms.author: kegr
ms.date: 10/06/2020
ms.topic: article 
ms.assetid: BA781EFD-92DB-44BA-8CA9-42567A5E5290 
ms.service: vs-appcenter
---

# Preparing Xamarin.Android Apps
This guide provides instructions for preparing Xamarin.UITests for upload to App Center Test. Select your platform to begin.

> [!IMPORTANT]
> Running Xamarin.UITest on Windows requires [setting the ANDROID_HOME environment variable with the path to the Android SDK](https://www.360logica.com/blog/how-to-set-path-environmental-variable-for-sdk-in-windows/)

To prepare a Xamarin.Android app and Xamarin.UITests for submission to App Center for Test:
1. Ensure that the app requests the `INTERNET` permission by inserting this snippet `<uses-permission android:name="android.permission.INTERNET" />` into the AndroidManifest.xml, outside the `<application>` tag.
2. Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test, and the CLI will throw the error "Mono Shared Runtime is not supported."


## Visual studio for Mac 
Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test.

In Visual Studio for Mac, open **Build > Android Build** then select **Project Options**. On the **General** tab, look for **Packaging and Deployment** and uncheck the **Use Shared Mono Runtime** checkbox.

![Remove Use Shared Runtime (macOS)](../images/remove-share-runtime-vsmac.png)


## Visual Studio (Windows)
Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test, and may throw a `Mono dependency error` during upload.

In Visual Studio 2019, open the project properties, and select the **Android Options** tab. In the first section, look for **Packaging Properties**, then uncheck the **Use Shared Runtime** checkbox.

![Remove Use Shared Runtime (Windows)](../images/remove-share-runtime-vs2019.png)

---
title: Preparing Xamarin.Android app for testing
description: A step-by-step guide to set up Xamarin.UITest for Xamarin.Android apps
author: oddj0b
ms.author: vigimm
ms.date: 05/30/2019
ms.topic: article 
ms.assetid: BA781EFD-92DB-44BA-8CA9-42567A5E5290 
ms.service: vs-appcenter
---

# Preparing Xamarin.Android Apps

The section below provides instructions for preparing Xamarin.UITests for upload to App Center Test. Select your platform to begin.

> [!IMPORTANT]
> Running Xamarin.UITest on Windows requires [setting the ANDROID_HOME environment variable with the path to the Android SDK](https://www.360logica.com/blog/how-to-set-path-environmental-variable-for-sdk-in-windows/)

To prepare a Xamarin.Android app and Xamarin.UITests for submission to App Center for Test:

1. Ensure that the app requests the `INTERNET` permission by inserting this snippet `<uses-permission android:name="android.permission.INTERNET" />` into the AndroidManifest.xml, outside the `<application>` tag.
2. Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test.

//TODO Insert switcher for the two options.

## Visual studio for Mac
Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test.

   In Visual Studio for Mac, open **Build > Android Build** then select **Project Options**. On the **General** tab, look for **Packaging and Deployment** and uncheck the **Use Shared Mono Runtime** checkbox.

![Remove Use Share Runtime](./images/remove-share-runtime-vsmac.png)

## Visual Studio (Windows)

Disable **Use Shared Mono Runtime**. The Shared Mono Runtime will prevent Xamarin.UITests from running in App Center for Test.

   In Visual Studio 2017, open the project properties, and select the **Android Options** tab. In the first section, look for **Packaging Properties**, then uncheck the **Use Shared Runtime** checkbox.

![Remove Use Shared Runtime](./images/remove-share-runtime-vs2019.png)

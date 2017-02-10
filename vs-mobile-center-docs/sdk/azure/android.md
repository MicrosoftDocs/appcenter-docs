---
title: Android Azure
description: Setting up Azure for Android
keywords: sdk,azure
author: ysxu
ms.author: yuaxu
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 0913454a-9804-4ac7-b5e6-936e88cd64d7
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Android Azure


> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)

The Android SDK supports API levels 19 through 24 (KitKat through Nougat).

You will need:
* your Mobile Center app secret, which you can find at by going to **Mobile Center > _your app_ > Getting Started > Manage app > App secret**.

## Add Azure Android SDK to your app
1. Add this code to the Project level build.gradle file inside the buildscript tag:
```
buildscript {
    repositories {
        jcenter()
    }
}
```

2. Add this code to the Module app level build.gradle file inside the dependencies tag:
```
    compile 'com.microsoft.azure:azure-mobile-android:3.1.0'
```

3. To access Azure, your app must have the INTERNET permission enabled. If it's not already enabled, add the following line of code to your AndroidManifest.xml file:
```
    <uses-permission android:name="android.permission.INTERNET" />
```

4. Create an _MSClient_ in your app to work with Azure features.
```
MobileServiceClient azureMobileClient = new MobileServiceClient(
    "_https://mobile-{app secret}.azurewebsites.net_", this)
```

## Use Azure features in your app
* [Identity]

## Documentation References
* [Javadocs API reference]

[Identity]: ~/sdk/azure/identity/android.md
[Javadocs API reference]: http://azure.github.io/azure-mobile-apps-android-client/

---
title: App Center SDK Documentation
description: Migration to App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 11/17/2018
ms.topic: article
ms.assetid: 298e0ad2-2626-4a3c-907a-092b57c81e96
ms.service: vs-appcenter
ms.custom: sdk
---

# Migrate to App Center Android SDK v1.10.0

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

Follow these steps to update your current preview SDK to App Center Android SDK v1.10.0:

1. Change **build.gradle** in your project that specifies Mobile Center to App Center.
    Open your app level **build.gradle** file (**app/build.gradle**) and change group ID, artifact ID and the SDK version:

    ```groovy
    def mobileCenterSdkVersion = '...'
    implementation "com.microsoft.azure.mobile:mobile-center-analytics:${mobileCenterSdkVersion}"
    implementation "com.microsoft.azure.mobile:mobile-center-crashes:${mobileCenterSdkVersion}"
    implementation "com.microsoft.azure.mobile:mobile-center-distribute:${mobileCenterSdkVersion}"
    implementation "com.microsoft.azure.mobile:mobile-center-push:${mobileCenterSdkVersion}"
    ```

    with

    ```groovy
    def appCenterSdkVersion = '1.10.0'
    implementation "com.microsoft.appcenter:appcenter-analytics:${appCenterSdkVersion}"
    implementation "com.microsoft.appcenter:appcenter-crashes:${appCenterSdkVersion}"
    implementation "com.microsoft.appcenter:appcenter-distribute:${appCenterSdkVersion}"
    implementation "com.microsoft.appcenter:appcenter-push:${appCenterSdkVersion}"
    ```

   > [!NOTE]
   > If the version of your Android Gradle plugin is lower than 3.0.0, then you need to replace the word **implementation** by **compile**.

2. Remove the old import statements for Mobile Center and update them with below:

    ```java
    import com.microsoft.appcenter.AppCenter;
    import com.microsoft.appcenter.analytics.Analytics;
    import com.microsoft.appcenter.crashes.Crashes;
    import com.microsoft.appcenter.distribute.Distribute;
    import com.microsoft.appcenter.push.Push;
    ```

3. Replace the `start` method API signature in your app code:

    ```java
    MobileCenter.start(...);
    ```

    with

    ```java
    AppCenter.start(...);
    ```

    Do the same class name replacement for any other `MobileCenter` call that you might have, such as `SetLogLevel` or `SetEnabled`.

4. If you customized or translated in-app updates texts, please update the string keys from `mobile_center_distribute_*` to `appcenter_distribute_*`.

5. Build your application in Android Studio and make sure you don’t see any compile or build time errors. Your application should now build locally.

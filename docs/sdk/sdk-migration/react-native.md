---
title: App Center SDK Documentation
description: Migration to App Center SDK
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 05/17/2018
ms.topic: article
ms.assetid: 279e0ad3-1616-4a3c-907a-092b57c81e96
ms.service: vs-appcenter
ms.custom: sdk
---

# Migrate to App Center React Native SDK v1.0.0

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

Follow these steps to update your current preview SDK to App Center React Native SDK v1.0.0:

1. Uninstall the old mobile-center packages and install the new appcenter packages:

    ```
    npm uninstall mobile-center --save
    npm uninstall mobile-center-link-scripts --save
    npm uninstall mobile-center-analytics --save
    npm uninstall mobile-center-crashes --save
    npm uninstall mobile-center-push --save

    npm install appcenter-analytics --save
    npm install appcenter-crashes --save
    npm install appcenter-push --save
    npm install appcenter --save
    ```

2. Remove `ios/{appname}/MobileCenter-config.plist` where `{appname}` is your app name. Remove `android/app/src/main/assets/mobile-center-config.json`.

3. [iOS] Remove the old MobileCenter pods in your ios Podfile:

    ```ruby
    pod 'RNMobileCenterShared'
    pod 'MobileCenter/Analytics'
    pod 'MobileCenter/Crashes'
    pod 'MobileCenter/Push'
    ```

4. [iOS] Remove the old import statements and `register` method calls for Mobile Center in **AppDelegate.m**:

    ```obj-c
    #import <RNMobileCenter/RNMobileCenter.h>
    #import <RNAnalytics/RNAnalytics.h>
    #import <RNCrashes/RNCrashes.h>
    #import <RNPush/RNPush.h>
    
    [RNMobileCenter register];
    [RNAnalytics registerWithInitiallyEnabled:true];
    [RNCrashes register];
    [RNPush register];
    ```

5. [iOS optional] If you use native iOS Mobile Center `setLogLevel` API to adjust log level, you will need to replace the method call from `MSMobileCenter` to `MSAppCenter`:

    ```obj-c
    @import MobileCenter;
    
    [MSMobileCenter setLogLevel: MSLogLevelVerbose];
    ```

    with

    ```obj-c
    @import AppCenter;
    
    [MSAppCenter setLogLevel: MSLogLevelVerbose];
    ```

6. [Android] Remove the old import statements for Mobile Center in **MainApplication.java**:

    ```java
    import com.microsoft.azure.mobile.react.mobilecenter.RNMobileCenterPackage;
    import com.microsoft.azure.mobile.react.push.RNPushPackage;
    import com.microsoft.azure.mobile.react.crashes.RNCrashesPackage;
    import com.microsoft.azure.mobile.react.analytics.RNAnalyticsPackage;
    ```

7. [Android] Remove the initialization call in `@Override protected List<ReactPackage> getPackages` method in **MainApplication.java**:

    ```java
    new RNPushPackage(MainApplication.this),
    new RNCrashesPackage(MainApplication.this, getResources().getString(R.string.mobileCenterCrashes_whenToSendCrashes)),
    new RNAnalyticsPackage(MainApplication.this, getResources().getString(R.string.mobileCenterAnalytics_whenToEnableAnalytics)),
    new RNMobileCenterPackage(MainApplication.this),
    ```

8. [Android] Remove Mobile Center dependencies in **android/app/build.gradle**:

    ```groovy
    compile project(':mobile-center-push')
    compile project(':mobile-center-crashes')
    compile project(':mobile-center-analytics')
    compile project(':mobile-center')
    ```

9. [Android] Remove Mobile Center references in **android/settings.gradle**:

    ```groovy
    include ':mobile-center-push'
    project(':mobile-center-push').projectDir = new File(rootProject.projectDir, '../node_modules/mobile-center-push/android')
    include ':mobile-center-crashes'
    project(':mobile-center-crashes').projectDir = new File(rootProject.projectDir, '../node_modules/mobile-center-crashes/android')
    include ':mobile-center-analytics'
    project(':mobile-center-analytics').projectDir = new File(rootProject.projectDir, '../node_modules/mobile-center-analytics/android')
    include ':mobile-center'
    project(':mobile-center').projectDir = new File(rootProject.projectDir, '../node_modules/mobile-center/android')
    ```

10. [Android optional] If you use native Android Mobile Center `setLogLevel` API to adjust log level, you will need to change the method call from `MobileCenter` to `AppCenter`:

    ```java
    import com.microsoft.azure.mobile.MobileCenter;
    
    MobileCenter.setLogLevel(Log.VERBOSE);
    ```

    with

    ```java
    import com.microsoft.appcenter.AppCenter;
    
    AppCenter.setLogLevel(Log.VERBOSE);
    ```
11. [Android optional] If you use `mobile-center-analytics` or `mobile-center-crashes`, you may remove mobile center string resources in **android/app/src/main/res/values/strings.xml**:

    ```xml
    <string moduleConfig="true" name="mobileCenterCrashes_whenToSendCrashes">ALWAYS_SEND</string>
    <string moduleConfig="true" name="mobileCenterAnalytics_whenToEnableAnalytics">ALWAYS_SEND</string>
    ```

12. Link the plugins to the React Native app by using the `react-native link` command.

13. [JavaScript] Replace the old `mobile-center` import statements in JS with `appcenter`:

    ```javascript
    import Analytics from 'mobile-center-analytics';
    import Crashes from 'mobile-center-crashes';
    import Push from 'mobile-center-push';
    import MobileCenter from 'mobile-center';
    ```

    with

    ```javascript
    import Analytics from 'appcenter-analytics';
    import Crashes from 'appcenter-crashes';
    import Push from 'appcenter-push';
    import AppCenter from 'appcenter';
    ```

14. Run `react-native run-ios` and `react-native run-android` should build and launch your iOS and Android application.

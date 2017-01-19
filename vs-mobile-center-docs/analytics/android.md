---
title: Android Analytics
description: Analytics for Android apps
keywords: android
author:
---

# Android Analytics

> [!div class="op_single_selector"]
- [iOS](ios.md)
- [Android](android.md)
- [React Native](react-native.md)

This page gives a summary of how to integrate the SDK for Analytics. Should you need more details, the detailed integration instruction can be found at [in the SDK section](/sdk/Android/getting-started/).

## 1. Add the SDK to the project

In your `app/build.gradle` file add the following *dependency*:
```
dependencies {
    def mobileCenterSdkVersion = '0.2.0'
    compile "com.microsoft.azure.mobile:mobile-center-analytics:${mobileCenterSdkVersion}"
    compile "com.microsoft.azure.mobile:mobile-center-crashes:${mobileCenterSdkVersion}"
}
```

## 2. Start the SDK

Add the following to your `onCreate` callback:
```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class);
```
Make sure that the `imports` get added.

You will find your app secret on the **Manage App** section on the Mobile Center portal.

## 3. Analyse

Now build and launch your app, then go to the Analytics section, you should see 1 Active user and at least 1 session!
The charts will get more relevant as you get more users.

---
title: Get Started with Android
description: Get started
keywords: sdk
author: troublemakerben
ms.author: bereimol
ms.date: 07/11/2017
ms.topic: get-started-article
ms.assetid: ef67ec59-c868-49e7-99e8-42b0399bde92
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Get Started with Android

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)

The Mobile Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up Mobile Center Android SDK in your app to use Mobile Center Analytics and Mobile Center Crashes. To add Mobile Center Distribute to you app, please have a look at the [documentation for Mobile Center Distribute](~/sdk/distribute/android.md).

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* Your Android project is set up in Android Studio.
* You are targeting devices running Android Version 4.0.3 (API level 15) or later.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret

If you have already created your app in the Mobile Center portal, you can skip this step.

1. Head over to [mobile.azure.com](https://mobile.azure.com).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional desciption for your app.
4. Select **Android** as the OS and **Java** as a platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules

1. Open your app level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. If you would want to use Mobile Center Analytics and Crashes, add the following lines:

	```groovy
	dependencies {
		def mobileCenterSdkVersion = '0.11.1'
   		compile "com.microsoft.azure.mobile:mobile-center-analytics:${mobileCenterSdkVersion}"
   		compile "com.microsoft.azure.mobile:mobile-center-crashes:${mobileCenterSdkVersion}"
	}
	```

2. Make sure to trigger a Gradle sync in Android Studio.

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of Mobile Center.

## 4. Start the SDK

### 4.1 Add the start() method

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK. Insert the following line inside your app's main activity class' `onCreate`-callback to use **Mobile Center Analytics** and **Mobile Center Crashes**:

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class);
```

### 4.2 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page on the Mobile Center portal or through the **Manage App** button.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `start()` method and include both Mobile Center Analytics and Mobile Center Crashes.

If you do not want to use one of the two services, remove the corresponding parameter from the method call above.

Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. In addition, the `start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to Mobile Center Analytics, you should modify the `start()` API call as follows:

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class);
```

Android Studio will automatically suggest the required import statements once you insert the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.analytics.Analytics;
import com.microsoft.azure.mobile.crashes.Crashes;
```

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [Mobile Center Analytics](~/sdk/analytics/android.md) and [Mobile Center Crashes](~/sdk/crashes/android.md) to learn how to customize and use more advanced functionalities of both services.

To learn how to get started with in-app updates, read the documentation of [Mobile Center Distribute](~/sdk/distribute/android.md).

To learn how to get started with Push, read the documentation of [Mobile Center Push](~/sdk/push/android.md).

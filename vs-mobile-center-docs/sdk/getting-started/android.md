---
title: Getting Started
description: Getting Started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 03/28/2017
ms.topic: get-started-article
ms.assetid: ef67ec59-c868-49e7-99e8-42b0399bde92
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Android Getting Started

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)
> * [React Native](react-native.md)

Let's get started with setting up Mobile Center Android SDK in your app to use Analytics, Crashes, and Distribute services.

Contents:

1. [Prerequisites](#1-prerequisites)
2. [Add Mobile Center SDK modules](#2-add-mobile-center-sdk-modules)
3. [Start the SDK](#3-start-the-sdk)

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* An Android project that is set up in Android Studio.
* A device running Android Version 4.0.3 or API level 15 or higher.

## 2. Add Mobile Center SDK modules

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

Below are the steps on how to integrate our compiled libraries in your application using Android Studio and Gradle.

1. Open your app level build.gradle file (app/build.gradle) and add the following lines after `apply plugin`. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. If you would want to use include all the services, add the following lines:

        dependencies {
            def mobileCenterSdkVersion = '0.6.1'
            compile "com.microsoft.azure.mobile:mobile-center-analytics:${mobileCenterSdkVersion}"
            compile "com.microsoft.azure.mobile:mobile-center-crashes:${mobileCenterSdkVersion}"
            compile "com.microsoft.azure.mobile:mobile-center-distribute:${mobileCenterSdkVersion}"
        }

2. Save your build.gradle file and make sure to trigger a Gradle sync in Android Studio.

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of Mobile Center services.

## 3. Start the SDK

To start the Mobile Center SDK in your app, follow these steps:

1. **Start the SDK:**  Mobile Center provides developers with three modules to get started – Analytics and Crashes. In order to use these modules, you need to opt in for the module(s) that you'd like, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK. Insert the following line inside your app's main activity class' `onCreate` callback:

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class, Distribute.class);
```

You can also copy paste the start method call from the Getting Started page on Mobile Center portal once your app is selected. It already includes the App Secret so that all the data collected by the SDK corresponds to your application. Make sure to replace `{Your App Secret}` text with the actual value for your application.

The example above shows how to use the `start()` method and include both the Analytics, Crashes and Distribute module. If you wish not to use Analytics, remove the parameter from the method call above. Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. Also, the `start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to Analytics service, you should modify the `start()` API call as shown:

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class);
```

Android Studio will automatically suggest the required import statements once you insert the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.analytics.Analytics;
import com.microsoft.azure.mobile.crashes.Crashes;
import com.microsoft.azure.mobile.distribute.Distribute;
```

Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. Look at [Analytics](~/sdk/analytics/android.md), [Crashes](~/sdk/crashes/android.md) and [Distribute](~/sdk/distribute/ios.md) section for APIs to use in your app.

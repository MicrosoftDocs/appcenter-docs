---
title: Mobile Center Distribute
description: Using in-app updates in Mobile Center Distribute
keywords: sdk, distribute
author: troublemakerben
ms.author: bereimol
ms.date: 04/14/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Mobile Center Distribute

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

Mobile Center Distribute will let your users install a new version of the app when you distribute it via the Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. This feature will NOT work if your app is deployed to the app store and while you are developing your app.

In addition, please have a look at the information on how to [utilize Mobile Center Distribute](~/distribution/index.md) if you haven't integrated it, yet.
While it is possible to use Mobile Center Distribute to distribute a new version of your app without adding any code, adding Mobile Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.

## 1. Add in-app updates to your app

Please follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

### 1.1 Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open your app level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. If you would want to use all the services, add the following lines:

```groovy
dependencies {
	def mobileCenterSdkVersion = '0.6.1'
    compile "com.microsoft.azure.mobile:mobile-center-distribute:${mobileCenterSdkVersion}"
}
```

2. Save your `build.gradle` file and make sure to trigger a Gradle sync in Android Studio.

Now that you've integrated Mobile Center Distribute in your application, it's time to start the SDK and make use of Mobile Center.

### 1.2 Start Mobile Center Distribute

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK. 

Add `Distribute.class` to your `MobileCenter.start()` method to start Mobile Center Distribute together with the other services that you want to use in your app.

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class, Distribute.class);
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Please also check out the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

Android Studio will automatically suggest the required import statement once you add `Distribute.class` to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.analytics.Analytics;
import com.microsoft.azure.mobile.crashes.Crashes;
import com.microsoft.azure.mobile.distribute.Distribute;
```

## 2. Customize or localize the in-app update dialog

You can easily provide your own resource strings if you'd like to change or localize the text displayed in the update dialog. Look at the string files in [this resource file](https://github.com/Microsoft/mobile-center-sdk-android/blob/master/sdk/mobile-center-distribute/src/main/res/values/strings.xml). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app resource files. 

## 3. Enable or disable Mobile Center Distribute at runtime

You can enable and disable Mobile Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality.

```java
Distribute.setEnabled(false);
```
To enable Mobile Center Distribute again, use the same API but pass `true` as a parameter.

```java
Distribute.setEnabled(true);
```

> [!NOTE]
> Note that this will only enable/disable Mobile Center Distribute within the SDK and not the features for the Distribute service (in-app updates for your application). The SDK API has nothing to do with disabling the Distribute service on the Mobile Center portal.

## 4. Check if Mobile Center Distribute is enabled

You can also check if Mobile Center Distribute is enabled or not:

```java
Distribute.isEnabled();
```

---
title: Get Started with Android
description: Get started
keywords: sdk
author: elamalani
ms.author: emalani
ms.date: 11/21/2019
ms.topic: get-started-article
ms.assetid: ef67ec59-c868-49e7-99e8-42b0399bde92
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

# Get Started with Android

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [iOS Extensions](ios-extensions.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [macOS Extensions](macos-extensions.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center Android SDK in your app to use App Center Analytics and App Center Crashes. To add App Center Distribute to you app, please have a look at the [documentation for App Center Distribute](~/sdk/distribute/android.md).

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* Your Android project is set up in Android Studio.
* You are targeting devices running Android Version 4.1 (API level 16) or later.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and click the **Add new** button in the upper-right corner of the page, and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select **Android** as the OS and **Java** as a platform.
5. Click the **Add new app** button.

Once you have created an app, you can obtain its App Secret on the **Getting Started** page under **2. Start the SDK**. Or, you can click **Settings**, and at the top right hand corner, click on the **triple vertical dots** and select **Copy app secret** to get your App Secret.

## 3. Add the App Center SDK modules

1. Open the project's app level **build.gradle** file (`app/build.gradle`) and add the following lines after `apply plugin`. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. If you would want to use App Center Analytics and Crashes, add the following lines:

  ```groovy
  dependencies {
      def appCenterSdkVersion = '2.5.0'
      implementation "com.microsoft.appcenter:appcenter-analytics:${appCenterSdkVersion}"
      implementation "com.microsoft.appcenter:appcenter-crashes:${appCenterSdkVersion}"
  }
  ```

  > [!NOTE]
  > If the version of your Android Gradle plugin is lower than 3.0.0, then you need to replace the word **implementation** by **compile**.

2. Make sure to trigger a Gradle sync in Android Studio.

Now that you've integrated the SDK in your application, it's time to start the SDK and make use of App Center.

3. If you use auto-backup to avoid getting incorrect information about devices please following the next steps:

> [!NOTE]
> Apps that target Android 6.0 (API level 23) or higher are automatically enabled for Auto Backup. 

> [!NOTE]
> If you already have custom file with backup rules please switch on the third step.

  a. Create `appcenter_backup_rule.xml` file in the `res/xml` directory.

  b. Add in `AndroidManifest.xml` the `android:fullBackupContent` attribute to the `<application>` element with indicating on `appcenter_backup_rule.xml` file:

  ```text
  android:fullBackupContent="@xml/appcenter_backup_rule"
  ```

  c. Add the next backup rules in `appcenter_backup_rule.xml` file:

  ```xml
  <full-backup-content xmlns:tools="http://schemas.android.com/tools">
      <exclude domain="sharedpref" path="AppCenter.xml"/>
      <exclude domain="database" path="com.microsoft.appcenter.persistence"/>
      <exclude domain="database" path="com.microsoft.appcenter.persistence-journal"/>
      <exclude domain="file" path="error" tools:ignore="FullBackupContent"/>
      <exclude domain="file" path="appcenter" tools:ignore="FullBackupContent"/>
  </full-backup-content>
  ```

## 4. Start the SDK

### 4.1 Add the start() method

To use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.  
Insert the following line inside your app's main activity class' `onCreate`-callback to use **App Center Analytics** and **App Center Crashes**:

```java
AppCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class);
```
```kotlin
AppCenter.start(application, "{Your App Secret}", Analytics::class.java, Crashes::class.java)
```

### 4.2 Replace the placeholder with your App Secret

Make sure to replace `{Your App Secret}` text with the actual value for your application. The App Secret can be found on the **Getting Started** page or **Settings** page on the App Center portal.

The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the `start()` method and include both App Center Analytics and App Center Crashes.

If you do not want to use one of the two services, remove the corresponding parameter from the method call above.

Note that, unless you explicitly specify each module as parameters in the start method, you can't use that App Center service. In addition, the `start()` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to App Center Analytics, you should modify the `start()` API call as follows:

```java
AppCenter.start(getApplication(), "{Your App Secret}", Analytics.class);
```
```kotlin
AppCenter.start(application, "{Your App Secret}", Analytics::class.java)
```

Android Studio automatically suggests the required import statements once you insert the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.analytics.Analytics;
import com.microsoft.appcenter.crashes.Crashes;
```
```kotlin
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.analytics.Analytics
import com.microsoft.appcenter.crashes.Crashes
```

You are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.

Look at the documentation for [App Center Analytics](~/sdk/analytics/android.md) and [App Center Crashes](~/sdk/crashes/android.md) to learn how to customize and use more advanced functionalities of both services.

To learn how to get started with in-app updates, read the documentation of [App Center Distribute](~/sdk/distribute/android.md).

To learn how to get started with Push, read the documentation of [App Center Push](~/sdk/push/android.md).

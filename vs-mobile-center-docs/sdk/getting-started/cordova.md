---
title: Get Started with Cordova
description: Get Started
keywords: sdk
author: Zakeelm
ms.author: zakeelm
ms.date: 12/19/2017
ms.topic: get-started-article
ms.assetid: 9DBB5B10-4F1F-4A93-9797-BC2ECAE62903
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: cordova
---

# Get Started with Cordova

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center Cordova SDK in your app to use App Center Analytics and App Center Crashes.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* You are using a Cordova project that runs the following:
	* `cordova` engine 6.4.0 or later
	* `cordova-android` engine 4.1.0 or later
	* `cordova-ios` engine 4.3.0 or later
* For iOS, the default way to use the SDK requires CocoaPods. If you haven't installed CocoaPods, please follow the [CocoaPods Getting Started](https://guides.cocoapods.org/using/getting-started.html) to do so.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select the appropriate OS (Android or iOS) and select **Cordova** as the platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** page or **Settings** page on the App Center Portal.

> [!NOTE]
> App secret is like an api key for your app, it allows events and telemetry to be sent to App Center backend. It doesn't provide any access to your account. It can't be used to invoke App Center REST APIs (like trigger builds or send push notifications). If your code is open source, we recommend you inject the secret at build or in a similar way.

## 3. Add the App Center SDK modules

1. Open a Terminal and navigate to the root of your Cordova project, then add any of the following plugins using the CLI to access analytics, crash, or push respectively:

	```
    cordova plugin add cordova-plugin-appcenter-analytics
    cordova plugin add cordova-plugin-appcenter-crashes
    cordova plugin add cordova-plugin-appcenter-push
    ```

	The App Center SDK uses a modular approach, where you add only those modules that you want to use. It makes sense to add **cordova-plugin-appcenter-analytics** and **cordova-plugin-appcenter-crashes** almost to every app, as they provide information without any additional setup required.

2.  Link the plugins to the Cordova app

    To get it working in your app you will need to add some configuration values to your app `config.xml` file. See list of available parameters below

- `APP_SECRET` - _(required)_ App secret enables App Center to map this app to the right user account

  Example:

  ```xml
  <platform name="android">
      <preference name="APP_SECRET" value="0000-0000-0000-0000-000000000000" />
  </platform>
  <platform name="ios">
      <preference name="APP_SECRET" value="0000-0000-0000-0000-000000000000" />
  </platform>
  ```

  Notice that it's likely that Android and iOS platforms will be associated with different applications on App Center portal so you would need to add this preference twice - one for Android (as in example above) and another for iOS.

## 4. Configuration Preferences 

- `APPCENTER_ANALYTICS_ENABLE_IN_JS` - _(optional, default is false)_ This preference controls whether Analytics will be enabled automatically (default option) or will require `Analytics.setEnabled()` to be called in JS code before sending any data about app usage to App Center portal. This might be useful e.g. in case when you want to ask users whether they want to share analytics information before sending it. [Learn more about sending user events manually.](~/sdk/analytics/cordova.md#wait-for-js-to-enable-app-center-analytics)

  Example:

  ```xml
  <preference name="APPCENTER_ANALYTICS_ENABLE_IN_JS" value="true" />
  ```

- `APPCENTER_CRASHES_ALWAYS_SEND` - _(optional, default is true)_ Specifies whether crash reports will be sent automatically or not, in the latter case they would be available for processing in JavaScript code. Choosing to process crashes first of all means more work for the developer, but it also provides greater control over user privacy and allows you to attach a message with crash report. [Learn more about processing on crash reports in JS](~/sdk/crashes/cordova.md).

  Example:

  ```xml
  <preference name="APPCENTER_CRASHES_ALWAYS_SEND" value="false" />
  ```
  
## 5. Start the SDK

Now you can build and launch your application either from command line or from Xcode/Android Studio.

### 5.1 Build and run your application from command line

You may build and launch your _iOS_ application using the following command:

```shell
cordova run ios
```

> [!TIP]
> You can launch it on an **iOS simulator** or **iOS device** by specifying the iOS device name in 

> `cordova run ios --target="myDeviceName".`

You may build and launch your _Android_ application using the following command:

```shell
cordova run android
```

> [!TIP]
> You can launch it on an **android emulator** or **android device** by specifying the device id in 
>
> `cordova run android --target="myDeviceId"` (`deviceId` can be retrieved using `adb devices` command).

### 5.2 Build and run your application from Xcode or Android Studio

For iOS, open your **ios** application (`ios/{appname}.xcworkspace`) in Xcode and build it from there.

For Android, open your **android** project in Android Studio and build it from there.

Great, you are all set to visualize Analytics and Crashes data collected automatically by the SDK on the portal. There is no additional setup required. Look at [Analytics](~/sdk/analytics/cordova.md) and [Crashes](~/sdk/crashes/cordova.md) sections for APIs guides and walkthroughs to learn what App Center can do.

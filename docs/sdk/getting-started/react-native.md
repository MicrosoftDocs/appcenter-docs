---
title: Get Started with React Native
description: Get Started
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 07/23/2019
ms.topic: get-started-article
ms.assetid: 8c185dee-ae25-4582-bd7c-14163e6fe392
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# Get Started with React Native

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

The App Center SDK uses a modular architecture so you can use any or all of the services.

Let's get started with setting up App Center React Native SDK in your app to use App Center Analytics and App Center Crashes.

## 1. Prerequisites

Before you begin, please make sure that the following prerequisites are met:

* You are using a React Native project that runs React Native 0.34 or later.
* You are targeting devices that are running on Android Version 4.1/API level 16 or later, or iOS version 9.0 or later.
* You are not using any other library that provides Crash Reporting functionality on iOS.
* For iOS, the default way to use the SDK requires [CocoaPods](https://cocoapods.org). (If you haven't installed CocoaPods, please follow the [CocoaPods Getting Started](https://guides.cocoapods.org/using/getting-started.html) to do so). Nonetheless, it is possible to link the SDK manually.

## 2. Create your app in the App Center Portal to obtain the App Secret

If you have already created your app in the App Center portal, you can skip this step.

1. Head over to [appcenter.ms](https://appcenter.ms).
2. Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
3. Enter a name and an optional description for your app.
4. Select the appropriate OS (Android or iOS) and select **React Native** as the platform.
5. Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Settings** page on the App Center Portal. At the top right hand corner of the **Settings** page, click on the **triple vertical dots** and select `Copy app secret` to get your App Secret.

## 3. Add the App Center SDK modules

The default integration of the SDK uses CocoaPods for iOS. If you are not using CocoaPods in your app, you need to integrate the React Native SDK manually for your iOS app.

Open a Terminal and navigate to the root of your React Native project, then enter the following line to add App Center Analytics and Crashes to the app:

```shell
npm install appcenter appcenter-analytics appcenter-crashes --save-exact
```

> [!NOTE]
> `--save` or `--save-dev` flag is required in this step. React Native will link modules based on dependencies and devDependencies in your **package.json** file.

In case you prefer `yarn` over `npm`, use the following command to install App Center:

```shell
yarn add appcenter appcenter-analytics appcenter-crashes --exact
```

The App Center SDK uses a modular approach, where you just add the modules for App Center services that you want to use. **appcenter-analytics** and **appcenter-crashes** make sense to add to almost every app, as they provide value with no additional setup required. **appcenter** provides general purpose App Center [APIs](../other-apis/react-native.md), useful for multiple services.

### 3.1 Integrate the SDK automatically for React Native 0.60

#### 3.1.1 Integrate React Native iOS

1. Run `pod install` from iOS directory to install CocoaPods dependencies.

2. Create a new file with the name `AppCenter-Config.plist` with the following content and replace `{APP_SECRET_VALUE}` with your app secret value. Don't forget to add this file to the Xcode project (right-click the app in Xcode and click **Add files to <App Name>...**).

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
        <key>AppSecret</key>
        <string>{APP_SECRET_VALUE}</string>
        </dict>
    </plist>
    ```

3. Modify the app's **AppDelegate.m** file to include code for starting SDK:

    * Add these lines to import section

    ```objc
    #import <AppCenterReactNativeShared/AppCenterReactNativeShared.h>
    #import <AppCenterReactNative.h>
    #import <AppCenterReactNativeAnalytics.h>
    #import <AppCenterReactNativeCrashes.h>
    ```

    * Add these lines to the `didFinishLaunchingWithOptions` method

    ```objc
    [AppCenterReactNative register];
    [AppCenterReactNativeAnalytics registerWithInitiallyEnabled:true];
    [AppCenterReactNativeCrashes registerWithAutomaticProcessing];
    ```

#### 3.1.2 Integrate React Native Android

1. Create a new file with the new `appcenter-config.json` with the following content and replace `{APP_SECRET_VALUE}` with your app secret value. Don't forget to add this file to the **assets** folder of your Android app.

    ```json
    {
        "app_secret": "{APP_SECRET_VALUE}"
    }
    ```

2. Modify the app's **res/values/strings.xml** to include the following lines:

    ```xml
    <string name="appCenterCrashes_whenToSendCrashes" moduleConfig="true" translatable="false">ASK_JAVASCRIPT</string>
    <string name="appCenterAnalytics_whenToEnableAnalytics" moduleConfig="true" translatable="false">ALWAYS_SEND</string>
    ```

### 3.2 Integrate the SDK automatically for React Native lower than 0.60

> [!NOTE]
> If you have your React modules linked using relative path inside your Podfile but not referenced in the project, the linking script will fail because it links App Center using static pod versions. You will either have to follow the steps from the [React Native troubleshooting section](~/sdk/troubleshooting/react-native.md#reactrctdefinesh-file-not-found) if you have already run the linking script, or [link it yourself](#32-ios-only-integrate-the-ios-sdk-without-react-native-link)

1. Link the plugins to the React Native app by using the react-native link command.

    ```shell
    react-native link appcenter
    react-native link appcenter-analytics
    react-native link appcenter-crashes
    ```

    For iOS, it will try to download the [App Center SDK for iOS and macOS](https://cocoapods.org/pods/AppCenter) from **CocoaPods**, if you see an error like:

    ```NA
    Added code to initialize iOS App Center SDK in ios/reactnativesample/AppDelegate.m
    Analyzing dependencies [!] Unable to find a specification for AppCenterReactNativeShared (~> {version}) 
    ```

    Please run the following command:

    ```shell
    pod repo update
    ```

    And then retry running `react-native link`.

    > [!NOTE]
    > App Center SDK does not set up mocks automatically for App Center modules during the linking process. If you are using [Jest test framework](https://facebook.github.io/jest/) in your application and experience errors caused by the App Center SDK while running tests with Jest, add the following to the jest section of package.json file (include only modules in use):
    
    > ```JSON
    > "setupFiles": [
    >    "<rootDir>/node_modules/appcenter/test/AppCenterMock.js",
    >    "<rootDir>/node_modules/appcenter-analytics/test/AppCenterAnalyticsMock.js",
    >    "<rootDir>/node_modules/appcenter-crashes/test/AppCenterCrashesMock.js",
    >    "<rootDir>/node_modules/appcenter-push/test/AppCenterPushMock.js"
    > ]
    >```

    > [!NOTE]
    > Whether processing of crashes is automatic or triggered by Javascript methods, crashes are always processed after the restart of the application. Crashes cannot be processed at the time the application crashes.

2. Edit the project's `android/app/src/main/assets/appcenter-config.json` and replace the `YOUR_APP_SECRET` placeholder value with your App Center project's application secret.

3. Edit the project's `ios/{YourAppName}/AppCenter-Config.plist` file, and replace the `YOUR_APP_SECRET` placeholder value with your App Center project's application secret. If **AppCenter-Config.plist** already exists but not part of your Xcode project, you must add it to the Xcode project manually (right-click the app in XCode and click **Add files to <App Name>...**).

### 3.3 [iOS only] Integrate the SDK manually for React Native lower than 0.60 without react-native link or CocoaPods

Do this integration, if you don't want to use **CocoaPods**.
We **strongly** recommend integrating the SDK via CocoaPods as described above. Nonetheless, it's also possible to integrate the iOS native SDK manually.

> [!NOTE]
> The latest App Center React Native SDK doesn't necessarily depend on the latest App Center iOS SDK, because the iOS SDK is updated and released before the React Native one.
>
> The consequence is that you have to know which version of the iOS SDK the React Native SDK depends on.

1. Download the [App Center SDK for React Native](https://github.com/Microsoft/appcenter-sdk-react-native/releases/latest) frameworks provided as a zip file and unzip it.

2. You will see a folder named **AppCenterReactNativeShared** which contains a single framework for the required React Native iOS bridge.

3. Download the corresponding [App Center SDK for iOS](https://github.com/Microsoft/AppCenter-SDK-Apple/releases) frameworks provided as a zip file and unzip it.

4. You will see a folder called **AppCenter-SDK-Apple/iOS** that contains different frameworks for each App Center service. The framework called `AppCenter` is required in the project as it contains code that is shared between the different modules.

5. [Optional] Create a subdirectory for 3rd-party libraries.
   * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a **Vendor** subdirectory now (under the **ios** directory of your project).
   * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.

6. Open Finder and copy the previously unzipped **AppCenter-SDK-Apple/iOS** and **AppCenterReactNativeShared** folders into your project's folder at the location where you want it to reside.

7. Add the SDK frameworks to the project in Xcode:

   * Make sure the Project Navigator is visible (⌘+1).
   * Drag and drop the **AppCenter.framework**, **AppCenterAnalytics.framework**, **AppCenterCrashes.framework** and **AppCenterReactNativeShared.framework** files from the Finder (in the location from the previous step) into Xcode's Project Navigator. Note that the **AppCenter.framework** and **AppCenterReactNativeShared.framework** files are required to start the SDK, make sure they are added to your project, otherwise the other modules won't work and your app won't compile.
   * A dialog will appear, make sure your app target is checked, then click **Finish**.

8. Link AppCenter React Native plugins projects to your app's project:

   * Make sure the Project Navigator is visible (⌘+1).
   * For each AppCenter React Native plugin navigate to the folder containing source code. Paths respectively will be
     * `/node_modules/appcenter/ios`
     * `/node_modules/appcenter-analytics/ios`
     * `/node_modules/appcenter-crashes/ios`
     * `/node_modules/appcenter-push/ios`

   * Drag and drop `.xcodeproj` files from the Finder into Xcode's Project Navigator. Typically under **Libraries** group.

9. Link libraries for AppCenter React Native plugins.
   Open your project settings and under **General** tab in the **Linked Frameworks and Libraries** section add new items referencing target libraries added on the previous step: 
   * `libAppCenterReactNative.a`
   * `libAppCenterReactNativeAnalytics.a`
   * `libAppCenterReactNativeCrashes.a`
   * `libAppCenterReactNativePush.a`

10. Modify **Header Search Paths** to find headers from the AppCenter React Native plugins projects. 
   Open your project settings and under **Build Settings** tab in the **Header Search Paths** section add new locations for header files:
   
   * `$(SRCROOT)/../node_modules/appcenter/ios/AppCenterReactNative`
   * `$(SRCROOT)/../node_modules/appcenter-analytics/ios/AppCenterReactNativeAnalytics`
   * `$(SRCROOT)/../node_modules/appcenter-crashes/ios/AppCenterReactNativeCrashes`
   * `$(SRCROOT)/../node_modules/appcenter-push/ios/AppCenterReactNativePush`

11. Modify the app's AppDelegate.m file to include code for starting SDK:
    * Add these lines to import section

    ```objc
    #import <AppCenterReactNative/AppCenterReactNative.h>
    #import <AppCenterReactNativeAnalytics/AppCenterReactNativeAnalytics.h>
    #import <AppCenterReactNativeCrashes/AppCenterReactNativeCrashes.h>
    #import <AppCenterReactNativePush/AppCenterReactNativePush.h>
    ```

    * Add these lines to the `didFinishLaunchingWithOptions` method

    ```objc
    [AppCenterReactNative register];
    [AppCenterReactNativeAnalytics registerWithInitiallyEnabled:true];
    [AppCenterReactNativeCrashes registerWithAutomaticProcessing];
    [AppCenterReactNativePush register];
    ```

12. Create new file with the name `AppCenter-Config.plist` with the following content and replace `{APP_SECRET_VALUE}` with your app secret value. Don't forget to add this file to the XCode project (right-click the app in XCode and click **Add files to <App Name>...**).

    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
        <dict>
        <key>AppSecret</key>
        <string>{APP_SECRET_VALUE}</string>
        </dict>
    </plist>
    ```

## 4. Start the SDK

Now you can build and launch your application either from command line or Xcode/Android Studio.

### 4.1 Build and run your application from command line

You may build and launch your iOS application by the following command:

```shell
react-native run-ios
```

> [!TIP]
> You can launch it on an **iOS simulator** or **iOS device** by specifying the iOS device name in `react-native run-ios --device "myDeviceName"`.

You may build and launch your Android application by the following command:

```shell
react-native run-android
```

> [!TIP]
> You can launch it on an android emulator or android device by specifying the device id in `react-native run-android --deviceId "myDeviceId"` (`deviceId` from `adb devices` command).

### 4.2 Build and run your application from Xcode or Android Studio

For iOS, open your project's `ios/{appname}.xcworkspace` or `ios/{appname}.xcodeproj` file in Xcode and build from there.

> [!NOTE]
> If you linked App Center automatically via `react-native link` (as in step 3.1), you should open the project's `ios/{appname}.xcworkspace` file in Xcode. Because App Center CocoaPods dependencies only works with `xcworkspace` not `xcodeproj`, and the `ios/{appname}.xcodeproj` file won't have App Center CocoaPods dependencies linked.

For Android, import your **android** project in Android Studio and build from there.

You are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. There is no additional setup required. Look at [Analytics](~/sdk/analytics/react-native.md) and [Crashes](~/sdk/crashes/react-native.md) section for APIs guides and walkthroughs to learn what App Center can do.
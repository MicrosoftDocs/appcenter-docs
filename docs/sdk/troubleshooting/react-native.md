---
title: React Native SDK Troubleshooting
description: Troubleshooting the App Center SDK for React Native
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 03/22/2019
ms.topic: troubleshooting-article
ms.assetid: e1ef1165-dbc6-4e16-8438-c12060d529db
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: react-native
---

# React Native SDK Troubleshooting

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [React Native](react-native.md)
> * [Cordova](cordova.md)

## 'React/RCTDefines.h' file not found

This error appears when RN core libraries are not referenced correctly, which can be caused by a variety of integrating/linking issues. 
It often happens when you have your dependencies linked using relative path in a podfile, rather than statically in a project.
Our linking script supports only the standard way of linking pods, so in order to resolve this, do the following:

1. Replace the dependencies in your `Podfile` with relative linking paths:

    Before:

    ```ruby
    pod 'AppCenter/Analytics', '~> 1.14.0'
    pod 'AppCenter/Crashes', '~> 1.14.0'
    pod 'AppCenter/Push', '~> 1.14.0'
    pod 'AppCenterReactNativeShared', '~> 1.13.0'
    ```

    After:

    ```ruby
    pod 'appcenter', path: '../node_modules/appcenter/ios'
    pod 'appcenter-analytics', path: '../node_modules/appcenter-analytics/ios'
    pod 'appcenter-crashes', path: '../node_modules/appcenter-crashes/ios'
    pod 'appcenter-push', path: '../node_modules/appcenter-push/ios'
    ```

1. Run `pod install` from `iOS` folder.

1. Inside **AppDelegate.m**, replace imports:

    Before:

    ```objective-c
    #import <AppCenterReactNative/AppCenterReactNative.h>
    #import <AppCenterReactNativeAnalytics/AppCenterReactNativeAnalytics.h>
    #import <AppCenterReactNativeCrashes/AppCenterReactNativeCrashes.h>
    #import <AppCenterReactNativePush/AppCenterReactNativePush.h>
    ```

    After:

    ```objective-c
    #import "AppCenterReactNative.h"
    #import "AppCenterReactNativeAnalytics.h"
    #import "AppCenterReactNativeCrashes.h"
    #import "AppCenterReactNativePush.h"
    ```

1. Remove AppCenter dependencies from the project (right-click the dependency > Remove dependency).
    Select {YOUR_APP}->Libraries and remove the next files:
    - AppCenterReactNative.xcodeproj
    - AppCenterReactNativeAnalytics.xcodeproj
    - AppCenterReactNativeCrashes.xcodeproj

## React Native link command unrecognized

If you have `yarn` installed on your machine, `react-native init {myapp}` will initialize your app and install dependencies using `yarn` rather than `npm`. If you see the following error message when running `react-native link`, chances are App Center dependencies are installed from `npm install {package}` instead of `yarn add {package}` so that `npm` and `yarn` are mixed during installation.

```Text
Command `link` unrecognized. Make sure that you have run `npm install` and that you are inside a react-native project.
```

In this case, run `npm install` and try `react-native link` again.

## Build error such as 'AppCenterCrashes/MSErrorReport.h' file not found

One possible cause is when running `react-native link` without **CocoaPods** installed.

To confirm the cause, execute `react-native link`, and in the logs, check for the following line:

```Text
Could not configure AppCenter for iOS. Error Reason - spawn pod ENOENT
```

This line is located in the following section of the logs:

```Text
Added code to initialize iOS AppCenter SDK in ios/TestApp/AppDelegate.m
Installing Cocoapods dependencies...
Could not configure AppCenter for iOS. Error Reason - spawn pod ENOENT
rnpm-install info Platform 'ios' module appcenter-analytics is already linked 
rnpm-install info Platform 'android' module appcenter-analytics is already linked 
```

If you see that error, make sure the `pod` command from **CocoaPods** is available in your system's **PATH** environment variable.

After you fix your **CocoaPods** installation, run `pod install` in the **ios** folder to fix your project.

## CocoaPods unable to find a specification for AppCenterReactNativeShared during react-native link

If you see the following CocoaPods error message during `react-native link`, chances are your local clone (`~/.cocoapods/repos` on your machine) of the [CocoaPods spec repo](https://github.com/CocoaPods/Specs) is not up-to-date.

```Text
Analyzing dependencies [!] Unable to find a specification for AppCenterReactNativeShared (~> {version})
```

You should run `pod repo update` to update the spec repo, and try `react-native link` again. For more information of CocoaPods commands, please see [CocoaPods command line reference](https://guides.cocoapods.org/terminal/commands.html#pod_repo_update).

## How to update React Native SDK to the latest version

If you have already integrated our SDK into your application and want to upgrade to a newer version of the SDK, please follow the following steps to upgrade:

1. `npm uninstall --save appcenter appcenter-analytics appcenter-crashes appcenter-push` to uninstall old App Center packages.

2. `npm install --save-exact appcenter appcenter-analytics appcenter-crashes appcenter-push` to install latest App Center packages.

3. `pod repo update` to make sure your CocoaPods spec repo is up-to-date.

4. `react-native link`.

> [!TIP]
> If you see error message similar to the following CocoaPods error message during `react-native link`, just delete the auto-generated **Podfile.lock** in your **ios** folder and run `react-native link` again.

> ```Text
> [!] Unable to satisfy the following requirements:
> 
> - `AppCenter/Core (= 1.0.0)` required by `Podfile.lock`
> - `AppCenter/Core (= 1.0.0)` required by `AppCenter/Push (1.0.0)`
> - `AppCenter/Core (= 1.0.0)` required by `AppCenter/Crashes (1.0.0)`
> - `AppCenter/Core (= 1.0.0)` required by `AppCenter/Analytics (1.0.0)`
> - `AppCenter/Core (= 1.0.1)` required by `AppCenterReactNativeShared (1.0.1)`
> ```

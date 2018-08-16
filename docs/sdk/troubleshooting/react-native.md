---
title: React Native SDK Troubleshooting
description: Troubleshooting the App Center SDK for React Native
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 05/17/2018
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

## React Native link command unrecognized

If you have `yarn` installed on your machine, `react-native init {myapp}` will initialize your app and install dependencies using `yarn` rather than `npm`. If you see the following error message when running `react-native link`, chances are appcenter dependencies are installed from `npm install {package}` instead of `yarn add {package}` so that `npm` and `yarn` are mixed during installation.

```
Command `link` unrecognized. Make sure that you have run `npm install` and that you are inside a react-native project.
```

In this case, run `npm install` and try `react-native link` again.

## CocoaPods unable to find a specification for AppCenterReactNativeShared during react-native link

If you see the following CocoaPods error message during `react-native link`, chances are your local clone (`~/.cocoapods/repos` on your machine) of the [CocoaPods spec repo](https://github.com/CocoaPods/Specs) is not up-to-date.

```
Analyzing dependencies [!] Unable to find a specification for AppCenterReactNativeShared (~> {version})
```

You should run `pod repo update` to update the spec repo, and try `react-native link` again. For more information of CocoaPods commands, please see [CocoaPods command line reference](https://guides.cocoapods.org/terminal/commands.html#pod_repo_update).

## How to update React Native SDK to the latest version

If you have already integrated our SDK into your application and want to upgrade to a newer version of the sdk, plesae follow the following steps to upgrade:

1. `npm uninstall --save appcenter appcenter-analytics appcenter-crashes appcenter-push` to uninstall old appcenter packages.

2. `npm install --save appcenter appcenter-analytics appcenter-crashes appcenter-push` to install latest appcenter packages.

3. `pod repo update` to make sure your CocoaPods spec repo is up-to-date.

4. `react-native link`.

> [!TIP]
> If you see error message similar to the following CocoaPods error message during `react-native link`, just delete the auto-generated **Podfile.lock** in your **ios** folder and run `react-native link` again.
> ```
> [!] Unable to satisfy the following requirements:
> 
> - `AppCenter/Core (= 1.0.0)` required by `Podfile.lock`
> - `AppCenter/Core (= 1.0.0)` required by `AppCenter/Push (1.0.0)`
> - `AppCenter/Core (= 1.0.0)` required by `AppCenter/Crashes (1.0.0)`
> - `AppCenter/Core (= 1.0.0)` required by `AppCenter/Analytics (1.0.0)`
> - `AppCenter/Core (= 1.0.1)` required by `AppCenterReactNativeShared (1.0.1)`
> ```
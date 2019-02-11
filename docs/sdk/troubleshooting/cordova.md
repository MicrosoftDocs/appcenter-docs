---
title: Cordova SDK Troubleshooting
description: Troubleshooting the App Center SDK for Cordova
keywords: sdk
author: elamalani
ms.author: elamalani
ms.date: 01/29/2019
ms.topic: troubleshooting-article
ms.assetid: e1ef1165-dbc6-4e16-8438-c12060d529db
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: cordova
---

# Cordova SDK Troubleshooting

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [UWP](uwp.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [React Native](react-native.md)
> * [Cordova](cordova.md)

## How to enable Verbose logging in Cordova

For debugging and troubleshooting purposes, you may need to enable *verbose* logging; this is not implemented in Cordova yet, so you must follow these steps:

1. Go to `platforms -> ios -> <AppName> -> Plugins -> cordova-plugin-appcenter-shared -> AppCenterShared.m`.

1. Find `configureWithSettings` method.

1. At the bottom of the method, paste `[MSAppCenter setLogLevel:MSLogLevelVerbose];`.

## Failed to install plugin - pod command failed with exit code 1

After updating to the latest plugin version, chances are you will see the following error message during `cordova plugin add cordova-plugin-appcenter-<module>`:

```Text
Installing "cordova-plugin-appcenter-shared" for ios
Failed to install 'cordova-plugin-appcenter-shared': Error: pod: Command failed with exit code 1
```

To resolve this, go to `platforms` > `ios`, open `Podfile` and change `platform :ios, '8.0'` to `platform :ios, '9.0'`.

Then run `pod install`.

In `0.3.0` we dropped iOS 8 support. The issue with this is that the latest version of `cordova-ios` by default targets ios `9.0`, but addresses ios `8.0` in the podfile. This has been fixed in their repo but not released yet.

## Failed to install 'cordova-plugin-appcenter-shared': undefined

One possible cause of this error is when running `cordova plugin add cordova-plugin-appcenter-<module>` without **CocoaPods** installed.

In this case, the error usually includes this line:

```Text
Error: CocoaPods was not found. Please install version 1.0.1 or greater from https://cocoapods.org/
```

If you see this line, simply run:

```shell
sudo gem install cocoapods
pod setup
```

## CocoaPods could not find compatible versions for pod "AppCenter"

If you see the following error message during `cordova plugin add cordova-plugin-appcenter-<module>`, chances are your local clone (`~/.cocoapods/repos` on your system) of the [CocoaPods spec repo](https://github.com/CocoaPods/Specs) is not up-to-date.

```Text
CocoaPods could not find compatible versions for pod "AppCenter":
 In Podfile:
   AppCenter (~> 1.12.0)
```

You should run `pod repo update` to update the spec repo, and try adding the plugin again. For more information on CocoaPods commands, please see the [CocoaPods command line reference](https://guides.cocoapods.org/terminal/commands.html#pod_repo_update).

## Module 'AppCenter' not found iOS build error

If you see the following error message during `cordova build ios`, it means that something went wrong with **CocoaPods** installation:

```Text
.../cordova-plugin-appcenter-shared/AppCenterShared.h:3:9: fatal error: module 'AppCenter' not found
@import AppCenter;
~~~~~~~^~~~~~~~~
1 error generated.
```

One possible cause is that your local clone (`~/.cocoapods/repos` on your machine) of the [CocoaPods spec repo](https://github.com/CocoaPods/Specs) is not up-to-date.

Run `pod repo update` to update the spec repo, and try adding plugin again. For more information on CocoaPods commands, please see the [CocoaPods command line reference](https://guides.cocoapods.org/terminal/commands.html#pod_repo_update).

## Archive not found at path iOS build error

If you see the following error message during `cordova build ios`, you must switch to the legacy build system.

```Text
error: archive not found at path '.../platforms/ios/MyApp.xcarchive'
** EXPORT FAILED **
```

To resolve this issue, specify `--buildFlag="-UseModernBuildSystem=0"` when running build. The solution is also described in [this StackOverflow thread](https://stackoverflow.com/a/52400072/7453375).

## Could not find method google() for arguments [] on repository container Android build error

If you see the following error message during `cordova build android`, chances are your `cordova-android` version is too low.

```Text
FAILURE: Build failed with an exception.

* Where:
Script '.../cordova/platforms/android/cordova-plugin-appcenter-push/testpush-AppCenterPush.gradle' line: 3

* What went wrong:
A problem occurred evaluating script.
> Could not find method google() for arguments [] on repository container.
```

You should update `cordova-android` to at least `6.4.0`. You can run `cordova platform update android` to update the platform to the latest version or `cordova platform add android@6.4.0` to use the exact version.

## Analytics not showing up in the portal

Make sure you've added this line to your configuration file:

`<preference name="APPCENTER_ANALYTICS_ENABLE_IN_JS" value="true" />`

By default this value is `false`.
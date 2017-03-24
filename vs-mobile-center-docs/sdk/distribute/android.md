---
title: Android Distribute
description: Using in-app updates in Mobile Center
keywords: sdk, distribute
author: elamalani
ms.author: emalani
ms.date: 03/24/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Android Distribute

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)
> * [React Native](react-native.md)

You can easily let your users get the latest version of your app by integrating Distribute service of Mobile Center SDK. All you need to do is pass the service name as a parameter in the start() API call. Once the activity is created, the SDK checks for new updates in the background. If it finds a new update, users will see a dialog with three options - `Download`, `Postpone` and `Ignore`. If the user presses Download, it will trigger the new version to be installed. Postpone will delay the download until the app is opened again. Ignore will not prompt the user again for that particular app version.

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at the string files [here](https://github.com/Microsoft/mobile-center-sdk-android/blob/master/sdk/mobile-center-distribute/src/main/res/values/strings.xml). Use the same string name and specify the localized value to be reflected in the dialog in your own app resource files.


* **Enable or disable Distribute:**  You can change the enabled state by calling the `Distribute.setEnabled()` method. If you disable it, the SDK will not prompt your users when a new version is available for install. To re-enable it, pass true as a parameter in the same method.

        Distribute.setEnabled(false);

You can also check if the service is enabled or not using the `isEnabled()` method. Note that it will only disable SDK features for Distribute service which is in-app updates for your application and has nothing to do with disabling `Distribute` service from Mobile Center.

        Distribute.isEnabled();


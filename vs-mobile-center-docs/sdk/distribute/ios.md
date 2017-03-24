---
title: iOS Distribute
description: Using in-app updates in Mobile Center
keywords: sdk, distribute
author: elamalani
ms.author: emalani
ms.date: 03/24/2017
ms.topic: article
ms.assetid: f91fcd0b-d5e6-4c74-89a8-f71c2ee57556
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: ios
---

# iOS Distribute

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)

You can easily let your users get the latest version of your app by integrating the Distribute service of the Mobile Center SDK.

Once that is done, the SDK checks for new updates once per the app's lifetime. If the app is currently in the foreground or suspended in the background, you might need to kill the app to get the latest update. If it finds a new update, users will see a dialog with three options - `Download`, `Postpone` and `Ignore`. If the user presses Download, the SDK will trigger the new version to be installed. Postpone will delay the download until the app is opened again. Ignore will not prompt the user again for that particular app version.

* **Localization of the update UI:** You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog.  [here](https://github.com/Microsoft/mobile-center-sdk-ios/blob/develop/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings). Use the same string name and specify the localized value to be reflected in the dialog in your own app resource files.

* **Enable or disable Distribute:** You can change the enabled state by calling the setEnabled API. If you disable it, the SDK will not prompt your users when a new version is available for install. To re-enable it, pass YES or true as a parameter in the same method.

    **Objective-C**

        [MSDistribute setEnabled:NO];

    **Swift**

        MSDistribute.setEnabled(false)

You can also check if the service is enabled or not using the isEnabled method:

    **Objective-C**

        BOOL enabled = [MSDistribute isEnabled];
    
    **Swift**

    var enabled = MSDistribute.isEnabled()
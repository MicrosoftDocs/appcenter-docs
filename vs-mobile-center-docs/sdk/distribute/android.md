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

## Introduction
You can easily let your users get the latest version of your app by integrating the Distribute service of Mobile Center SDK. All you need to do is pass the service name as a parameter in the **start()** API call. Once the activity is created, the SDK checks for new updates in the background. If an update is available, users will see a dialog with three options - **Download**, **Postpone** and **Ignore**. If the user presses **Download**, the new version will be installed. **Postpone** will delay the download until the app is opened again. **Ignore** will not prompt the user again for that particular app version.

## Text customization and localization

You can provide your own resource strings if you'd like to modify or localize the text displayed in the dialogs and notifications that the SDK displays.

### Customization

If you want to change some texts for the default English language, download
[this resource file](https://raw.githubusercontent.com/Microsoft/mobile-center-sdk-android/master/sdk/mobile-center-distribute/src/main/res/values/strings.xml), rename it to `mobile_center_distribute.xml` and move it to your application's `res/values` folder.

### Localization

If you want to localize texts for language `{xx}`, download
[this resource file](https://raw.githubusercontent.com/Microsoft/mobile-center-sdk-android/master/sdk/mobile-center-distribute/src/main/res/values/strings.xml), rename it to `mobile_center_distribute.xml` and move it to your application's `res/values-{xx}` folder (create the folder `values-{xx}` if missing).

[//]: # (The following is extracted from https://developer.android.com/guide/topics/resources/providing-resources.html#AlternativeResources)

The language is defined by a two-letter [ISO 639-1](http://www.loc.gov/standards/iso639-2/php/code_list.php) language code, optionally followed by a two letter [ISO 3166-1-alpha-2](http://www.iso.org/iso/en/prods-services/iso3166ma/02iso-3166-code-lists/list-en1.html) region code (preceded by lowercase "`r`").

The codes are *not* case-sensitive; the `r` prefix is used to distinguish the region portion. You cannot specify a region alone.

Examples of folder names:

* `values-fr`
* `values-en-rUS`

## Enable or disable Distribute

You can change the enabled state by calling the `Distribute.setEnabled()` method. If you disable it, the SDK will not prompt your users when a new version is available for install. To re-enable it, pass true as a parameter in the same method.

        ```java
        Distribute.setEnabled(false);
        ```

You can also check if the service is enabled or not using the `isEnabled()` method. Note that it will only disable SDK features for Distribute service which is in-app updates for your application and has nothing to do with disabling `Distribute` service from Mobile Center.

        ```java
        Distribute.isEnabled();
        ```


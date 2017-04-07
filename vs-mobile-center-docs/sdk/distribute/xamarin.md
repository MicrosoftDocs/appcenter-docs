---
title: Xamarin Distribute
description: Using in-app updates in Mobile Center
keywords: sdk, distribute
author: troublemakerben
ms.author: bereimol
ms.date: 03/24/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Xamarin Distribute

> [!div class="op_single_selector"]
> * [iOS](ios.md)
> * [Android](android.md)
> * [Xamarin](xamarin.md)

## Introduction

You can easily let your users get the latest version of your app by integrating Mobile Center Distribute. All you need to do is pass the service name as a parameter in the `start()` API call. Once the app launches, the SDK checks for new updates in the background. If it finds a new update, users will see a dialog with three options - **Download**, **Postpone**, and **Ignore**. If the user taps **Download**, Mobile Center Distribute will trigger the new version to be installed. **Postpone** will delay the download until the app is opened again. **Ignore** will not prompt the user again for that particular app version. In case of a required update, the user will only have the option to tap **Download**.

Please follow the paragraph in the [getting started](~/sdk/getting-started/xamarin.md) to setup Mobile Center Distribute.

### Localization of the update UI

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at the string files for iOS [in this resource file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/develop/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings) and those for Android [in this resource file](https://github.com/Microsoft/mobile-center-sdk-android/blob/distribute/sdk/mobile-center-distribute/src/main/res/values/strings.xml).

Use the same string name and specify the localized value to be reflected in the dialog in your own app resource files.  

### Enable or disable Distribute

You can change the enabled state by calling the `setEnabled` API. If you disable it, the SDK will not prompt your users when a new version is available for install. To re-enable it, pass `YES` or `true` as a parameter in the same method.

Note that it will only disable SDK features for the Distribute service (in-app updates for your application) and the SDK API has nothing to do with disabling the **Distribute** service on the Mobile Center portal.

```csharp
Distribute.Enabled = false;
```

You can also check if the service is enabled in the SDK or not at runtime. 
  
```csharp
bool enabled = Distribute.Enabled;
```

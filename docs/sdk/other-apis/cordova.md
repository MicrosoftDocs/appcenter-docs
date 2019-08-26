---
title: Other Apache Cordova APIs
description: Other APIs in the App Center SDK for Apache Cordova
keywords: sdk
author: Zakeelm 
ms.author: zakeelm
ms.date: 07/22/2019
ms.topic: article
ms.assetid: 26F97578-1E05-46C4-8740-8639F1DB37F2
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: cordova
---

# Other Apache Cordova APIs

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

## Adjust the log level

You can control the amount of log messages that show up from App Center in the console. 
To do this, open the project's **config.xml** file; for each of your Apache Cordova project's target `platform` elements (only Android and iOS today), add a child `preference` element in the following format:

```xml
<preference name="LOG_LEVEL" value="2" />
```

Set the value to one of the constants, described well in the [official Android documentation](https://developer.android.com/reference/kotlin/android/util/Log#constants_2). Same contants can be used for iOS.

To have as many log messages as possible, use **VERBOSE (2)** level.

## Change state of service in runtime

You can enable or disable desired service at the runtime with following code:

```javascript
await AppCenter.Analytics.setEnabled(false);
```

## Check if App Center is enabled

You can also check if App Center is enabled or not.

```javascript
const enabled = await AppCenter.isEnabled();
```

## Identify installations

The App Center SDK creates a UUID for each device once the app is installed. This identifier remains the same for a device when the app is updated and a new one is generated only when the app is re-installed or the user manually deletes all app data. The following API is useful for debugging purposes.

```javascript
var success = function(installId) {
    console.log("Install ID: " + installId);
}

var error = function(error) {
    console.error(error);
}
AppCenter.getInstallId(success, error);
```

## Identify users

The App Center SDK supports setting a **user ID** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK as described in the [App Center SDK Getting started guide](~/sdk/getting-started/cordova.md).
2. Set a `userID` in the SDK using the following code:

```javascript
AppCenter.setUserId("your-user-id");
```
After setting a user ID, you can use App Center's search feature to search for specific crash reports associated with the ID. Learn more in App Center's [search documentation](~/diagnostics/search.md). 

> [!NOTE]
> Note that the value for the user id is limited to 256 characters.

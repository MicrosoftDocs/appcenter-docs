---
title: Other Apache Cordova APIs
description: Other APIs in the App Center SDK for Apache Cordova
keywords: sdk
author: Zakeelm 
ms.author: zakeelm
ms.date: 01/23/2019
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
> * [UWP](uwp.md)
> * [Unity](unity.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Cordova](cordova.md)

## Disable all services at runtime

If you want to disable all App Center services at once, use the `setEnabled()` API. When disabled, the SDK will not forward any information to App Center.

```javascript
await AppCenter.setEnabled(false);
```

To enable all services at once again, use the same API but pass `true` as a parameter.

```javascript
await AppCenter.setEnabled(true);
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

The App Center SDK supports setting a **user id** that is used to augment crash reports. To use this capability:

1. Configure the App Center SDK as described in the [App Center SDK Getting started guide](~/sdk/getting-started/cordova.md).
2. Set a `userID` in the SDK using the following code:

```javascript
AppCenter.setUserId("your-user-id");
```

> [!NOTE]
> Note that the value for the user id is limited to 256 characters.

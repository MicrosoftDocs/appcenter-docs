---
title: How to add Firebase SDK dependencies (Android Cordova)
description: How to add Firebase SDK dependencies for App Center Push (Android Cordova)
keywords: sdk, push
author: king-of-spades
ms.author: kegr
ms.date: 07/06/2018
ms.topic: article
ms.assetid: 15f48cc1-6e0b-472a-a007-03a941471884
ms.tgt_pltfrm: android
---

# How to add Firebase SDK dependencies (Android Cordova)

[!INCLUDE [introduction to android](includes/introduction-android.md)]

## 1. Integrate Firebase in application

- In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**.
- Download the **google-services.json** file to the root of your project.

## 2. Edit config.xml

Open the Apache Cordova project's **config.xml** file, and add **google-services.json** as a `resource-file` inside platform android:

```xml
<platform name="android">
    <!-- Add this line -->
    <resource-file src="google-services.json" target="app/google-services.json" />
</platform>
```

Remove the following line that isn't needed anymore:

```xml
<preference name="FIREBASE_SENDER_ID" value="'your-sender-id'" />
```

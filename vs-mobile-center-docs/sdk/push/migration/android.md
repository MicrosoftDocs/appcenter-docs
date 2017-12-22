---
title: How to remove Firebase SDK
description: How to remove Firebase SDK
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 12/22/2017
ms.topic: article
ms.assetid: cdd0a651-29b6-4fb2-8fc5-4a25b54eb2ca
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

[!include[](introduction-android.md)]

## 1. Gradle dependencies

If you are not using Firebase, you can remove the following lines from **app/build.gradle**:

```groovy
    compile "com.google.firebase:firebase-core:${version}"
    compile "com.google.firebase:firebase-messaging:${version}"
```

## 2. google-services.json

If you are not using Firebase, you can also remove the **google-services.json** file by using the following steps.

### 2.1. Get your Sender ID

In the [Firebase Console](https://console.firebase.google.com),
go to **Project Settings**.
Navigate to the **Cloud Messaging** tab. Copy the **Sender ID** value.

### 2.2. Set Sender ID

Call the following method before `AppCenter.start`:

```java
Push.setSenderId("{Your Sender ID}");
AppCenter.start(getApplication(), "{Your App Secret}", Push.class);
```

### 2.3. Remove Google Services plugin dependencies

In your root project **build.gradle** file, remove the following line:

```groovy
    classpath 'com.google.gms:google-services:${version}'
```

In the **app/build.gradle** file, remove the following line:

```groovy
apply plugin: 'com.google.gms.google-services'
```

You can now remove **google-services.json** file and you are now all set.

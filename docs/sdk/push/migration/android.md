---
title: How to add Firebase SDK
description: How to add Firebase SDK
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 07/12/2018
ms.topic: article
ms.assetid: cdd0a651-29b6-4fb2-8fc5-4a25b54eb2ca
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

[!include[](introduction-android.md)]

## 1. Integrate Firebase in application

- In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**.
- Download the **google-services.json** file to your Android project app module.
- Modify the **project root** level **build.gradle** file:

    ```groovy
    buildscript {
        repositories {
            // Add google line if missing before jcenter
            google()
            jcenter()
        }

        dependencies {
            // Add this line
            classpath 'com.google.gms:google-services:4.0.1'
        }
    }

    allprojects {
        repositories {
            // Add google line if missing before jcenter
            google()
            jcenter()
        }
    }
    ```

- Modify the **app** level **build.gradle** file:

    ```groovy
    // Add this line at the bottom
    apply plugin: 'com.google.gms.google-services'
    ```

- Make sure to trigger a Gradle sync in Android Studio.

## 2. Remove Sender ID

Remove the `Push.setSenderId("{Your Sender ID}")` method call before `AppCenter.start`.

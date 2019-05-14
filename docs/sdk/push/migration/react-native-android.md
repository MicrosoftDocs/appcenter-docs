---
title: How to add Firebase SDK
description: Contains instructions for how to configure your project to use Firebase Cloud Messaging
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 08/28/2018
ms.topic: article
ms.assetid: 7fe521e7-66fc-42ac-b804-a779525ad39e
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

[!include[](introduction-android.md)]

## 1. Integrate Firebase in application

- In the [Firebase Console](https://console.firebase.google.com), go to **Project Settings**.
- Download the **google-services.json** file to your Android project's app module (for most projects, it will be the project's `android/app` folder).
- Modify the **android/build.gradle** file:

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

    > [!NOTE]
    > Google introduced the `google()` repository with Gradle v4. If your Gradle version is lower than v4, then you need to use `maven { url 'https://maven.google.com' }` instead of `google()`.

- Modify the project's **android/app/build.gradle** file:

    ```groovy
    // Add this line at the bottom
    apply plugin: 'com.google.gms.google-services'
    ```

## 2. Remove Sender ID

Remove the `Push.setSenderId("{Your Sender ID}")` method call from `MainApplication.java`.

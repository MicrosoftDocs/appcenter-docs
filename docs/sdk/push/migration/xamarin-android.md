---
title: How to add Firebase SDK
description: Contains instructions for how to configure your project to use Firebase Cloud Messaging
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 07/05/2018
ms.topic: article
ms.assetid: f8a120ed-d217-4e01-9811-685a1c64c498
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

[!include[](introduction-android.md)]

## 1. Mono version

If your Android project does not target Mono framework version 8.1 or higher, you will not be able to update the Push package.

You can safely bump this version in **Options > General > Target framework** as this has no impact on minimum API level or target API level fields.

If you are using App Center Build, you must make sure Mono version is 5.8 or higher (in **Build Config > Build app > More options**).

## 2. AndroidManifest.xml

Edit the project's **AndroidManifest.xml** file, then insert the following lines **inside** the <application> section:

```xml
<application ...>
    
    <!-- Add these lines -->
    <receiver
        android:name="com.google.firebase.iid.FirebaseInstanceIdInternalReceiver"
        android:exported="false" />
    <receiver
        android:name="com.google.firebase.iid.FirebaseInstanceIdReceiver"
        android:exported="true"
        android:permission="com.google.android.c2dm.permission.SEND">
        <intent-filter>
            <action android:name="com.google.android.c2dm.intent.RECEIVE" />
            <action android:name="com.google.android.c2dm.intent.REGISTRATION" />
            <category android:name="${applicationId}" />
        </intent-filter>
    </receiver>
    <!-- end of section to add -->

</application>
```

Remove the following lines from the project's **AndroidManifest.xml** file:

```xml
<uses-permission android:name="${applicationId}.permission.C2D_MESSAGE" />
<permission android:name="${applicationId}.permission.C2D_MESSAGE" android:protectionLevel="signature" />
```

## 3. google-services.json

* Go to the [Firebase console](https://console.firebase.google.com/).
* Click on the project corresponding to your application.
* Go to **Project settings** (using the cog icon).
* Find your application in the list.
* Download the **google-services.json** file.
* Copy **google-services.json** file into the root of your Android specific project using Visual Studio so that the file is visible in the solution.
* Close and reopen your solution. 
* The next step depends if you are on Mac or Windows:
    * On Visual Studio for Mac, open the context menu on the **google-services.json** file then select **GoogleServicesJson** in **Build Action**.
    * On Visual Studio for Windows, select the **google-services.json** file in the Solution explorer. In **Properties > Advanced > Build Action**, select **GoogleServicesJson**.

## 4. ProGuard

If you are using ProGuard, you must update the rules in the **proguard.cfg** file.

Remove the following line:

```
-dontwarn com.microsoft.appcenter.push.**
```

And add the following lines:

```
-dontwarn com.google.android.gms.**
-keep class com.google.firebase.provider.FirebaseInitProvider
-keep class com.google.firebase.iid.FirebaseInstanceIdReceiver
-keep class com.microsoft.appcenter.push.TokenService
-keep class com.microsoft.appcenter.push.PushMessagingService
```

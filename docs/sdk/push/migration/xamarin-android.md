---
title: How to add Firebase SDK (Xamarin.Android)
description: Contains instructions for how to configure your project to use Firebase Cloud Messaging (Xamarin.Android)
keywords: sdk, push
author: lucen-ms
ms.author: lucen
ms.date: 09/24/2019
ms.topic: article
ms.assetid: f8a120ed-d217-4e01-9811-685a1c64c498
ms.tgt_pltfrm: android
---

# How to add Firebase SDK dependencies (Xamarin.Android)
[!INCLUDE [introduction to android](includes/introduction-android.md)]

## 1. Target framework
If your Xamarin.Android project doesn't target version 9.0 or higher, you can't update the Push package.
You can safely bump this version in **Options > General > Target framework** as this has no impact on minimum API level or target API level fields.

## 2. AndroidManifest.xml
Edit the project's **AndroidManifest.xml** file and **remove** the following lines **inside** the file's `<application>` section, if present:

```xml
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
```

Also, remove the following lines from the file:

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
* Copy the **google-services.json** file into the root of your Android specific project using Visual Studio so that the file is visible in the solution.
* Close and reopen your solution.
* The next step depends if you're on Mac or Windows:
    * On Visual Studio for Mac, open the context menu on the **google-services.json** file then select **GoogleServicesJson** in **Build Action**.
    * On Visual Studio for Windows, select the project's **google-services.json** file in the Solution explorer. In **Properties > Advanced > Build Action**, select **GoogleServicesJson**.

## 4. ProGuard

If you're using ProGuard, you must update the rules in the **proguard.cfg** file.

Remove the following line:

```text
-dontwarn com.microsoft.appcenter.push.**
```

And add the following lines:

```text
-dontwarn com.google.android.gms.**
-keep class com.google.firebase.provider.FirebaseInitProvider
-keep class com.google.firebase.iid.FirebaseInstanceIdReceiver
-keep class com.microsoft.appcenter.push.TokenService
-keep class com.microsoft.appcenter.push.PushMessagingService
```

## 5. Remove Sender ID

Remove the `Push.SetSenderId("{Your Sender ID}")` method call before `AppCenter.start`.

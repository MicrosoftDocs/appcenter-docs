---
title: How to remove Firebase SDK
description: How to remove Firebase SDK
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 12/22/2017
ms.topic: article
ms.assetid: f8a120ed-d217-4e01-9811-685a1c64c498
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: android
---

[!include[](introduction-android.md)]

## 1. NuGet dependencies

If you are not using Firebase, you can uninstall the following packages:

* Xamarin.Firebase.Analytics
* Xamarin.Firebase.Analytics.Impl
* Xamarin.Firebase.Common
* Xamarin.Firebase.Core
* Xamarin.Firebase.Iid
* Xamarin.Firebase.Messaging
* Xamarin.GooglePlayServices.Basement
* Xamarin.GooglePlayServices.Tasks

## 2. AndroidManifest.xml

If you have removed the **Xamarin.Firebase** packages, you need to modify your
**AndroidManifest.xml** file.

Remove the following lines:

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

Then add the following lines **before** the `<application>` section:

```xml
<uses-permission android:name="${applicationId}.permission.C2D_MESSAGE" />
<permission android:name="${applicationId}.permission.C2D_MESSAGE" android:protectionLevel="signature" />
```

## 3. google-services.json

If you are not using Firebase, you can also remove the **google-services.json**
file by using the following steps.

### 3.1. Get your Sender ID

In the [Firebase Console](https://console.firebase.google.com),
go to **Project Settings**.
Navigate to the **Cloud Messaging** tab. Copy the **Sender ID** value.

### 3.2. Set Sender ID

If you are using **Xamarin.Android**, you need to set the **Sender ID**
in the code before the **AppCenter.Start** call as follows:

```csharp
Push.SetSenderId("{SenderId}");
AppCenter.Start("{appSecret}", typeof(Push));
```

If you are using **Xamarin.Forms**, you need to set the **Sender ID** in your
**MainActivity.cs** file, in the `OnCreate` method, before the `LoadApplication` call:

```csharp
Push.SetSenderId("{SenderId}");
LoadApplication(new App());
```

### 3.3. Remove google-services.json

You can now remove **google-services.json** file.

## 4. Proguard

If you are using Proguard, you need to update the rules in the **proguard.cfg** file.

Remove the following lines:

```
-dontwarn com.google.android.gms.**
-keep class com.google.firebase.provider.FirebaseInitProvider
-keep class com.google.firebase.iid.FirebaseInstanceIdReceiver
-keep class com.microsoft.appcenter.push.TokenService
-keep class com.microsoft.appcenter.push.PushMessagingService
```

And just add this line instead:

```
-dontwarn com.microsoft.appcenter.push.**
```

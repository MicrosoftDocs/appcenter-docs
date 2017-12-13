---
# required metadata

title: App Center Push for Xamarin.Android Apps
description: Integrating App Center Push into Xamarin.Android applications
keywords: sdk, push
author: elamalani
ms.author: emalani
ms.date: 12/13/2017
ms.topic: article
ms.assetid: 3f3e83cd-0f05-455e-8e67-6b6d5042949d
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: xamarin.android
---
[!include[](introduction-android.md)]

### 3. Customize Proguard configuration

To ensure that the Proguard optimizer doesn't remove certain classes, you must customize its configuration.

#### 3.1. Create a Proguard configuration file

>[!NOTE]
>If you already have a Proguard configuration file in your project, you may skip to step 1.3.2.

Add an empty file to your Xamarin.Android project named *proguard.cfg*. Set the build action to "ProguardConfiguration."

![proguard-configuration-build-action](images/proguard-configuration-build-action.png)

#### 3.2. Add customization to Proguard configuration file
In your Xamarin.Android project, please add the following line to your `proguard.cfg` file:

```
-dontwarn com.microsoft.appcenter.push.**
```

## Add App Center Push to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application yet.

### 1. Add the App Center Push module

[!include[](add-nuget.md)]

### 3. Modify AndroidManifest.xml

Edit **AndroidManifest.xml** and insert the following permission **before** the `<application>` section:

```xml
    <uses-permission android:name="${applicationId}.permission.C2D_MESSAGE" />
    <permission android:name="${applicationId}.permission.C2D_MESSAGE" android:protectionLevel="signature" />
```

### 4. Start App Center Push

[!include[](start-push.md)]

Additionally, you need to set the **Sender ID** in your Xamarin.Android project (even if you are using Xamarin.Forms). This can be achieved with the following line of code:

```csharp
Push.SetSenderId("{Your Sender ID}");
```

Make sure that you replace `{Your Sender ID}` with the **Sender ID** you obtained in the "Prerequisites" step. The method should be called **before** `AppCenter.Start` is called. This means that in a Xamarin.Forms project, it must go before the call to `LoadApplication(new App());` in your Xamarin.Android project's `OnCreate()` method for the main `Activity` class.

>[!NOTE]
>If your Xamarin.Android project is part of a [Xamarin.Forms](xamarin-forms.md) application, it is not necessary to add the call to `AppCenter.Start()` in the Xamarin.Android portion of the project. The method call can instead be made from the PCL or shared project portion of your Xamarin.Forms application.

## Intercept push notifications

### Additional setup

If (**and only if**) your launcher activity uses a `launchMode` of `singleTop`, `singleInstance` or `singleTask`, you need to add this in the activity `onNewIntent` method:

```csharp
        protected override void OnNewIntent(Android.Content.Intent intent)
        {
            base.OnNewIntent(intent);
            Push.CheckLaunchedFromNotification(this, intent);
        }
```

### Subscribe to the push event

[!include[](dotnet-push-event-intro.md)]

> [!NOTE]
> A notification is not generated when your application receives a push in the foreground.

> [!NOTE]
> If the push is received in background, the event is **NOT** triggered at receive time.
> The event is triggered when you click on the notification.

> [!NOTE]
> The background notification click callback does **NOT** expose **title** and **message**.
> **Title** and **message** are only available in **foreground** pushes.

[!include[](dotnet-push-event-example.md)]

## Existing Firebase Analytics users

App Center Push SDK automatically disables Firebase Analytics. If you are a Firebase customer and want to keep reporting analytics data to Firebase, you need to call `Push.EnableFirebaseAnalytics()` before `AppCenter.Start()` like so:

```csharp
Push.EnableFirebaseAnalytics();
AppCenter.Start("{Your App Secret}", typeof(Analytics), typeof(Crashes), typeof(Push));
```

## Enable or disable Push at runtime

[!include[](enable-or-disable.md)]

---
title: Mobile Center Distribute
description: Using in-app updates in Mobile Center Distribute
keywords: sdk, distribute
author: troublemakerben
ms.author: bereimol
ms.date: 04/17/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

1. [Add in-app updates to your app](#1-add-in-app=updates-to-your-app)
2. [Customize or localize the in-app update dialog](#2-customize-or-localize-the-in-app-update-dialog)
3. [Enable or disable Mobile Center Distribute at runtime](#3-enable-or-disavle-mobile-center-distribute-at-runtime)
4. [Check if Mobile Center Distribute is enabled](#4-check-if-mobile-center-distribute-is-enabled)
5. [Don't initialise Mobile Center Distribute during development](#5-dont-initialise-mobile-center-distribute-during-development)

# Mobile Center Distribute

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

Mobile Center Distribute will let your users install a new version of the app when you distribute it via the Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. This feature will NOT work if your app is deployed to the app store.

In addition, please have a look at the information on how to [utilize Mobile Center Distribute](~/distribution/index.md) if you haven't integrated it, yet.
While it is possible to use Mobile Center Distribute to distribute a new version of your app without adding any code, adding Mobile Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.

## 1. Add in-app updates to your app

Please follow the [Get started](~/sdk/get-started/xamarin.md) section if you haven't setup and started the SDK in your application, yet.

### 1.1 Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

#### 1.1.1 Xamarin Studio

##### Xamarin.iOS and Xamarin.Android

* Navigate to the **Project -> Add NuGet Packages...**
* Search for **Mobile Center**, and select **Mobile Center Distribute**, then, click **Add Packages**.

##### Xamarin.Forms

Multiplatform Xamarin.Forms apps have three projects in one solution - the portable class library or shared library, the Android project `project.Droid` and the iOS project `project.iOS`. You need to add the NuGet packages to each of these projects.

* Navigate to the **Project -> Add NuGet Packages...**
* Search for **Mobile Center**, and select **Mobile Center Distribute**, then, click **Add Packages**.

#### 1.1.2 Xamarin for Visual Studio

* Navigate to the **Project -> Manage NuGet Packages...**
* Search for **Mobile Center**, and select **Mobile Center Distribute**, then, click **Add Packages**.

##### 1.1.3 Package Manager Console ##

* Make sure the Package Manager Console is opened in either Xamarin Studio or Visual Studio. You will have to install an add-in for Xamarin Studio.
* Type the following command:

   `PM> Install-Package Microsoft.Azure.Mobile.Distribute`

### 1.2 Start Mobile Center Distribute

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

##### 1.2.1 Add the using statement for Mobile Center Distribute

Add the appropriate namespaces before you get started with using our APIs.

* **Xamarin.iOS** - Open your `AppDelegate.cs` and add the lines below the existing using statements
* **Xamarin.Android** - Open your `MainActivity.cs` and add the lines below the existing using statements
* **Xamarin.Forms** - Open your `App.xaml.cs` in your shared project and add the following using statements
	
```csharp
using Microsoft.Azure.Mobile;
using Microsoft.Azure.Mobile.Distribute;
```

#### 1.2.2 Add the `start()`-method

Add `Distribute` to your `start()`-method to start Mobile Center Distribute together with the other services that you want to use in your app.

##### Xamarin.iOS

Open your `AppDelegate.cs` and add the `start()`-call inside the `FinishedLaunching()` method

```csharp
Distribute.DontCheckForUpdatesInDebug();
MobileCenter.Start("{Your Xamarin iOS App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
```

##### Xamarin.Android

Open `MainActivity.cs` and add the `start()`-call inside the `OnCreate()` method

```csharp
MobileCenter.Start("{Your Xamarin iOS App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));```

##### Xamarin.Forms

For creating a Xamarin.Forms application targeting both iOS and Android platforms, you need to create two applications in the Mobile Center portal - one for each platform. Creating two apps will give you two App secrets - one for iOS and another one for Android. Open your `App.xaml.cs` (or your class that inherits from `Xamarin.Forms.Application`) in your shared or portable project and add the method below in the `OnStart()` override method.

```csharp
MobileCenter.Start("ios={Your Xamarin iOS App Secret};android={Your Xamarin Android App secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute);
```

For your iOS application, open the `AppDelegate.cs` and add the following line before the call to `LoadApplicaton`:

```csharp
Distribute.DontCheckForUpdatesInDebug();
```

#### 1.2.2 [For iOS only] Add the `openUrl`-method

Implement the `openURL`-callback in your `AppDelegate.cs` to enable in-app-updates.

```csharp
public override bool OpenUrl(UIApplication application, NSUrl url, string sourceApplication, NSObject annotation)
{
	Distribute.OpenUrl(url);

	return true;
}
```

## 2. Customize or localize the in-app update dialog

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at the string files for iOS [in this resource file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/master/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings) and those for Android [in this resource file](https://github.com/Microsoft/mobile-center-sdk-android/blob/master/sdk/mobile-center-distribute/src/main/res/values/strings.xml). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app resource files.  

## 3. Enable or disable Mobile Center Distribute at runtime

You can enable and disable Mobile Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality.

```csharp
Distribute.Enabled = false;
```

To enable Mobile Center Distribute again, use the same API but pass `YES`/`true` as a parameter.

```csharp
Distribute.Enabled = true;
```

> [!NOTE]
> Note that this will only enable/disable Mobile Center Distribute within the SDK and not the features for the Distribute service (in-app updates for your application). The SDK API has nothing to do with disabling the Distribute service on the Mobile Center portal.

## 4. Check if Mobile Center Distribute is enabled

You can also check if Mobile Center Distribute is enabled or not:
  
```csharp
bool enabled = Distribute.Enabled;
```

---
title: Mobile Center Distribute for Xamarin
description: Using in-app updates in Mobile Center Distribute
keywords: sdk, distribute
author: troublemakerben
ms.author: bereimol
ms.date: 05/31/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# Mobile Center Distribute – In-app updates

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

Mobile Center Distribute will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. This feature will NOT work if your app is deployed to the app store.

### How do in-app updates work?
The in-app updates feature works as follows:
1. This feature will ONLY work with **RELEASE** builds that are distributed using **Mobile Center Distribute** service.
2. Once you integrate the SDK, build release version of your app and upload to Mobile Center, users in that distribution group will be notified for the new release via an email. 
3. When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install - we do not support side-loading.
4. Once the app is installed and opened for the first time after the Mobile Center Distribute SDK has been added, a browser will open to enable in-app updates. This is a ONE TIME step that will not occur for subsequent releases of your app.
5. Once the above step is successful, they should navigate back to the app.
6. A new release of the app shows the in-app update dialog asking users to update your application if it has
    * iOS: 
        * a higher version name (`CFBundleShortVersionString`) or
        * an equal version name but a higher version (`CFBundleVersion`)
    * Android:
        * a higher version (`versionCode`)

> [!TIP]
> If you upload the same apk/ipa a second time, the dialog will **NOT** appear as the binaries are identical. On iOS if you upload a **new** build with the same version, it will show the update dialog. The reason for this is that it is a **different** binary. On Android the `versionCode` has to be higher (if it does not change, the `versionName` has to change).

## 1. Add in-app updates to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application, yet.

### 1.1 Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

#### 1.1.1 Xamarin Studio

##### Xamarin.iOS and Xamarin.Android

* Navigate to the **Project > Add NuGet Packages...**
* Search for **Mobile Center**, and select **Mobile Center Distribute**, then, click **Add Packages**.

##### Xamarin.Forms

Multiplatform Xamarin.Forms apps have three projects in one solution - the portable class library or shared library, the Android project `project.Droid` and the iOS project `project.iOS`. You need to add the NuGet packages to each of these projects.

* Navigate to the **Project > Add NuGet Packages...**
* Search for **Mobile Center**, and select **Mobile Center Distribute**, then, click **Add Packages**.

#### 1.1.2 Xamarin for Visual Studio

* Navigate to the **Project > Manage NuGet Packages...**
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

#### 1.2.2 Add the `Start()` method

Add `Distribute` to your `Start()` method to start Mobile Center Distribute together with the other services that you want to use in your app.

##### Xamarin.iOS

Open your `AppDelegate.cs` and add the `Start()` call inside the `FinishedLaunching()` method

```csharp
Distribute.DontCheckForUpdatesInDebug();
MobileCenter.Start("{Your Xamarin iOS App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
```

##### Xamarin.Android

Open `MainActivity.cs` and add the `Start()` call inside the `OnCreate()` method

```csharp
MobileCenter.Start("{Your Xamarin iOS App Secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute));
```

##### Xamarin.Forms

For creating a Xamarin.Forms application targeting both iOS and Android platforms, you need to create two applications in the Mobile Center portal - one for each platform. Creating two apps will give you two App secrets - one for iOS and another one for Android. Open your `App.xaml.cs` (or your class that inherits from `Xamarin.Forms.Application`) in your shared or portable project and add the method below in the `OnStart()` override method.

```csharp
MobileCenter.Start("ios={Your Xamarin iOS App Secret};android={Your Xamarin Android App secret}", typeof(Analytics), typeof(Crashes), typeof(Distribute);
```

For your iOS application, open the `AppDelegate.cs` and add the following line before the call to `LoadApplicaton`:

```csharp
Distribute.DontCheckForUpdatesInDebug();
```

This step is not necessary on Android where the debug configuration is detected automatically at runtime.

#### 1.2.2 [For iOS only] Modify your `info.plist`

1. Open your `Info.plist`.
2. Add a new key for `URL types` or `CFBundleURLTypes` (in case Xcode displays your `info.plist` as source code).
3. Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
4. Enter `mobilecenter-${APP_SECRET}` as the URL scheme and replace `${APP_SECRET}` with the App Secret of your app.

> [!TIP]
> If you want to verify that you modified the **Info.plist** correctly, open it as source code. It should contain the following entry with your App Secret instead of `${APP_SECRET}`:
> ```
> <key>CFBundleURLTypes</key>
>	<array>
>		<dict>
>			<key>CFBundleURLSchemes</key>
>			<array>
>				<string>mobilecenter-${APP_SECRET}</string>
>			</array>
>		</dict>
>	</array>
>	```

## 2. Customize or localize the in-app update dialog

### 2.1. Customize or localize text

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at the string files for iOS [in this resource file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/master/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings) and those for Android [in this resource file](https://github.com/Microsoft/mobile-center-sdk-android/blob/master/sdk/mobile-center-distribute/src/main/res/values/strings.xml). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app resource files.

### 2.2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the `ReleaseAvailable` callback. You need to register the callback before calling `MobileCenter.Start` as shown in the following example:

```csharp
// In this example OnReleaseAvailable is a method name in same class
Distribute.ReleaseAvailable = OnReleaseAvailable;
MobileCenter.Start(...);
```

Here is an example on **Xamarin.Forms** of the callback implementation that replaces the SDK dialog with a custom one:

```csharp
bool OnReleaseAvailable(ReleaseDetails releaseDetails)
{
	// Look at releaseDetails public properties to get version information, release notes text or release notes URL
	string versionName = releaseDetails.ShortVersion;
	string versionCodeOrBuildNumber = releaseDetails.Version;
	string releaseNotes = releaseDetails.ReleaseNotes;
	Uri releaseNotesUrl = releaseDetails.ReleaseNotesUrl;

	// custom dialog
	var title = "Version " + versionName + " available!";
	Task answer;

	// On mandatory update, user cannot postpone
	if (releaseDetails.MandatoryUpdate)
	{
		answer = Current.MainPage.DisplayAlert(title, releaseNotes, "Download and Install");
	}
	else
	{
		answer = Current.MainPage.DisplayAlert(title, releaseNotes, "Download and Install", "Maybe tomorrow...");
	}
	answer.ContinueWith((task) =>
	{
		// If mandatory or if answer was positive
		if (releaseDetails.MandatoryUpdate || (task as Task<bool>).Result)
		{
			// Notify SDK that user selected update
			Distribute.NotifyUpdateAction(UpdateAction.Update);
		}
		else
		{
			// Notify SDK that user selected postpone (for 1 day)
			// Note that this method call is ignored by the SDK if the update is mandatory
			Distribute.NotifyUpdateAction(UpdateAction.Postpone);
		}
	});

	// Return true if you are using your own dialog, false otherwise
	return true;
}
```

Implementation notes for **Xamarin.Android**:

As shown in the example, you have to either call `Distribute.NotifyUpdateAction(UpdateAction.UPDATE);` or `Distribute.NotifyUpdateAction(UpdateAction.POSTPONE);` if your callback returns `true`.

If you don't call `NotifyUpdateAction`, the callback will repeat on every activity change.

The callback can be called again with the same release if the activity changes before the user action is notified to the SDK.

This behavior is needed to cover the following scenarios:

* Your application is sent to the background (like pressing **HOME**) then resumed in a different activity.
* Your activity is covered by another one without leaving the application (like clicking on some notifications).
* Other similar scenarios.

In that case, the activity hosting the dialog might be replaced without user interaction. So the SDK calls the listener again so that you can restore the custom dialog.

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

## 5. How do I test in-app updates?

This is what we recommend to do. There is no way to set this up locally on your machine in a non-trivial way, so you will need to use the Mobile Center Portal for this.

> [!TIP]
> To test in-app updates, you need to add **Mobile Center Distribute** to your application and distribute that using Mobile Center Distribute.

1. Create your app in the Mobile Center Portal if you haven't done that already.
2. Create a new distribution group and name it so you can recognize that this is just meant for testing the in-app update feature.
3. Add yourself (or all people who you want to include on your test of the in-app update feature). Use a new or throw-away email address for this, that was not used for that app on Mobile Center. This ensures that you have an experience that's close to the experience of your real testers.
4. Create a new build of your app that includes **Mobile Center Distribute** and contains the setup logic as described below.
5. Click on the **Distribute new release** button in the portal and upload your build of the app.
6. Once the upload has finished, click **Next** and select the **Distribution group** that you just created as the **Destination** of that app distribution.
7. Review the Distribution and distribute the build to your in-app testing group.
8. People in that group will receive an invite to be testers of the app. Once they need to accept the invite, they can download the app from the Mobile Center Portal from their mobile device. Once they have in-app updates installed, you're ready to test in-app updates.
9. Bump the version of your app (`CFBundleShortVersionString ` or `CFBundleVersion ` for iOS, `versionCode` for Android)
10. Build the release version of your app and upload a new build of your app just like you did in the previous step and distribute this to the **Distribution Group** you created earlier. Members of the Distribution Group will be prompted for a new version the next time the app enters the foreground.

> [!TIP]
> Please have a look at the information on how to [utilize Mobile Center Distribute](~/distribution/index.md) for more detailed information about **Distribution Groups** etc.
While it is possible to use Mobile Center Distribute to distribute a new version of your app without adding any code, adding Mobile Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.


## 6. Method Swizzling [For iOS only] Add the `OpenUrl` method

Mobile Center uses method swizzling by automatically forwarding your application delegate's methods to Mobile Center services. If you want to disable swizzling in your application code, please follow the steps below:

1. Open your **Info.plist file**.
2. Add `MobileCenterAppDelegateForwarderEnabled` key and set the value to `0`. This will disable application delegate forwarding for all Mobile Center services.
3. Add `OpenUrl` callback in your `AppDelegate.cs` file.

```csharp
public override bool OpenUrl(UIApplication application, NSUrl url, string sourceApplication, NSObject annotation)
{
	Distribute.OpenUrl(url);
	return true;
}
```
---
title: App Center Distribute for Xamarin
description: Using in-app updates in App Center Distribute
keywords: sdk, distribute
author: elamalani
ms.author: emalani
ms.date: 02/22/2020
ms.topic: article
ms.assetid: 1cdf6bf0-2ab8-4b23-81ec-709482559129
ms.tgt_pltfrm: xamarin
---

# App Center Distribute – In-app updates

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Unity](unity.md)
> * [Xamarin](xamarin.md)

App Center Distribute will let your users install a new version of the app when you distribute it via App Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. 

This feature will NOT work if your app is deployed to the app store.

> [!NOTE]
> There are a few things to consider when using in-app updates:
> 1. If you have released your app in the App Store or Google Play, in-app updates will be disabled.
> 2. If you are running automated UI tests, enabled in-app updates will block your automated UI tests as they will try to authenticate against the App Center backend. We recommend to not enable App Center Distribute for your UI tests. 

## Add in-app updates to your app

Please follow the [Get started](~/sdk/getting-started/xamarin.md) section if you haven't set up and started the SDK in your application, yet.

### 1. Add the App Center Distribute module

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

#### Visual Studio for Mac

* Open Visual Studio for Mac.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right click the **Packages** section, and choose **Add NuGet packages...**.
* Search for **App Center**, and install **App Center Distribute**.
* Click **Add Packages**.

#### Visual Studio for Windows

* Open Visual Studio for Windows.
* Click **File** > **Open** and choose your solution.
* In the solution navigator, right-click **References** and choose **Manage NuGet Packages**.
* Search for **App Center**, and install **Microsoft.AppCenter.Distribute**.

#### Package Manager Console

* Open the console in [Visual Studio](https://visualstudio.microsoft.com/vs/). To do this, choose **Tools** > **NuGet Package Manager** > **Package Manager Console**.
* If you're working in **Visual Studio for Mac**, make sure you have the **NuGet Package Management Extensions** installed. For this, choose **Visual Studio** > **Extensions**, search for **NuGet** and install, if necessary.
* Type the following command in the console:

```shell
Install-Package Microsoft.AppCenter.Distribute
```

> [!NOTE]
> If you use the App Center SDK in a portable project (such as **Xamarin.Forms**), you must install the packages in each of the projects: the portable, Android, and iOS ones. To do that, you should open each sub-project and follow the corresponding steps described in [Visual Studio for Mac](#visual-studio-for-mac) or [Visual Studio for Windows](#visual-studio-for-windows) sections.

### 2. Start App Center Distribute

To use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.

#### 2.1 Add App Center Distribute imports

Add the App Center Distribute imports before you get started with using Distribute module:

* **Xamarin.iOS** - Open the project's `AppDelegate.cs` file and add the following lines below the existing `using` statements
* **Xamarin.Android** - Open the project's `MainActivity.cs` file and add the following lines below the existing `using` statements
* **Xamarin.Forms** - Open the project's `App.xaml.cs` file and add the following lines below the existing `using` statements

```csharp
using Microsoft.AppCenter;
using Microsoft.AppCenter.Distribute;
```

#### 2.2 Add the `Start()` method

Add `Distribute` to your `Start()` method to start App Center Distribute service.

##### Xamarin.iOS

Open the project's `AppDelegate.cs` file and add the `Start()` call inside the `FinishedLaunching()` method

```csharp
Distribute.DontCheckForUpdatesInDebug();
AppCenter.Start("{Your Xamarin iOS App Secret}", typeof(Distribute));
```

##### Xamarin.Android

Open the project's **MainActivity.cs** file and add the `Start()` method call inside the `OnCreate()` method:

```csharp
AppCenter.Start("{Your Xamarin Android App Secret}", typeof(Distribute));
```

To enable in-app updates for debug builds on Android, call the following method before `AppCenter.Start`:

```csharp
Distribute.SetEnabledForDebuggableBuild(true);
```

##### Xamarin.Forms

To create a Xamarin.Forms app targeting both Android and iOS platforms, you must create two apps in the App Center portal - one for each platform. Creating two apps will give you two App secrets - one for Android and another one for iOS. Open the project's `App.xaml.cs` (or your class that inherits from `Xamarin.Forms.Application`) in the shared or portable project and add the `Start()` call inside the `OnStart()` override method.

```csharp
AppCenter.Start("ios={Your Xamarin iOS App Secret};android={Your Xamarin Android App secret}", typeof(Distribute));
```

For your iOS application, open the `AppDelegate.cs` and add the following line **before** the call to `LoadApplication`:

```csharp
Distribute.DontCheckForUpdatesInDebug();
```

This step is not necessary on Android where the debug configuration is detected automatically at runtime.

To enable in-app updates for debug builds on Android, call the following method in the project's **MainActivity.cs** file, in the `OnCreate` method and before `LoadApplication`.

```csharp
Distribute.SetEnabledForDebuggableBuild(true);
```

> [!NOTE]
> This method only affects debug builds, and has no impact on release builds.

#### 2.3 [For iOS only] Modify the project's **Info.plist**

1. Add a new key for `URL types` or `CFBundleURLTypes` in your Info.plist file (in case Xcode displays your Info.plist as source code).
2. Change the key of the first child item to `URL Schemes` or `CFBundleURLSchemes`.
3. Enter `appcenter-${APP_SECRET}` as the URL scheme and replace `${APP_SECRET}` with the App Secret of your app.

> [!TIP]
> If you want to verify that you modified the Info.plist correctly, open it as source code. It should contain the following entry with your App Secret instead of `${APP_SECRET}`:
> ```
> <key>CFBundleURLTypes</key>
>   <array>
>       <dict>
>           <key>CFBundleURLSchemes</key>
>           <array>
>               <string>appcenter-${APP_SECRET}</string>
>           </array>
>       </dict>
>   </array>
>   ```

## Use private distribution group

By default, Distribute uses a public distribution group. If you want to use a private distribution group, you will need to explicitly set it via `UpdateTrack` property.

```csharp
Distribute.UpdateTrack = UpdateTrack.Private;
```

> [!NOTE]
> The default value is `UpdateTrack.Public`. This property can only be updated before the `AppCenter.Start` method call. Changes to the update track are not persisted when the application process restarts, and so if the property is not always updated before the `AppCenter.Start` call, it will be public, by default.

After this call, a browser window will open up to authenticate the user. All the subsequent update checks will get the latest release on the private track. The update track is not persisted in the SDK across app launches.  

If a user is on the **private track**, it means that after the successful authentication, they will get the latest release from any private distribution groups they are a member of.
If a user is on the **public track**, it means that they will get the latest release from any public distribution group.

## Disable Automatic Check for Update

By default, the SDK automatically checks for new releases:
 * When the application starts.
 * When the application goes into background then in foreground again (iOS only).
 * When enabling the Distribute module if previously disabled.

If you want to check for new releases manually, you can disable automatic check for update.
To do this, call the following method before the SDK start:

```csharp
Distribute.DisableAutomaticCheckForUpdate();
```

> [!NOTE]
> This method must be called before the `AppCenter.Start` method call.

Then you can use the `CheckForUpdate` API which is described in the following section.

## Manually Check for Update

```csharp
Distribute.CheckForUpdate();
```

> [!NOTE]
> A manual check for update call works even when automatic updates are enabled. A manual check for update is ignored if another check is already being performed. The manual check for update will not be processed if the user has postponed updates (unless the latest version is a mandatory update).

## Customize or localize the in-app update dialog

### 1. Customize or localize text

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at the string files for iOS [in this resource file](https://github.com/Microsoft/AppCenter-SDK-Apple/blob/master/AppCenterDistribute/AppCenterDistribute/Resources/en.lproj/AppCenterDistribute.strings) and those for Android [in this resource file](https://github.com/Microsoft/AppCenter-SDK-Android/blob/master/sdk/appcenter-distribute/src/main/res/values/appcenter_distribute.xml). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app resource files.

### 2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the `ReleaseAvailable` callback. You need to register the callback before calling `AppCenter.Start` as shown in the following example:

```csharp
// In this example OnReleaseAvailable is a method name in same class
Distribute.ReleaseAvailable = OnReleaseAvailable;
AppCenter.Start(...);
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

## Enable or disable App Center Distribute at runtime

You can enable and disable App Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality but you can still use Distribute service in App Center portal.

```csharp
Distribute.SetEnabledAsync(false);
```

To enable App Center Distribute again, use the same API but pass `true` as a parameter.

```csharp
Distribute.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The state is persisted in the device's storage across application launches.

> [!NOTE]
> This method must only be used after `Distribute` has been started.

## Check if App Center Distribute is enabled

You can also check if App Center Distribute is enabled or not:

```csharp
bool enabled = await Distribute.IsEnabledAsync();
```

> [!NOTE]
> This method must only be used after `Distribute` has been started, it will always return `false` before start.

## How do in-app updates work?

> [!NOTE]
> For in-app updates to work, an app build should be downloaded from the link. It won't work if installed from an IDE or manually.

The in-app updates feature works as follows:

1. This feature only works with **RELEASE** builds (by default) that are distributed using **App Center Distribute** service. It won't work if the iOS Guided Access feature is turned on.
2. Once you integrate the SDK, build release version of your app and upload to App Center, users in that distribution group will be notified for the new release via an email. 
3. When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install - we do not support side-loading. When an application is downloaded from the link, the SDK saves important information from cookies to check for updates later, otherwise the SDK doesn’t have that key information.
4. If the application sets the track to private, a browser will open to authenticate the user and enable in-app updates. The browser will not open again as long as the authentication information remains valid even when switching back to the public track and back to private again later. If the browser authentication is successful, the user is redirected back to the application automatically. If the track is public (which is the default), the next step happens directly.

   * On iOS 9 and 10, an instance of `SFSafariViewController` will open within the app to authenticate the user. It will close itself automatically after the authentication succeeded.
   * On iOS 11, the user experience is similar to iOS 10 but iOS 11 will ask the user for their permission to access login information. This is a system level dialog and it cannot be customized. If the user cancels the dialog, they can continue to use the version they are testing, but they won't get in-app-updates. They will be asked to access login information again when they launch the app the next time.

5. A new release of the app shows the in-app update dialog asking users to update your application if it has:
   * iOS: 
     * a higher value of `CFBundleShortVersionString` or
     * an equal value of `CFBundleShortVersionString` but a higher value of `CFBundleVersion`.
     * the versions are the same but the build unique identifier is different.

   * Android:
     * a higher value of `versionCode` or
     * an equal value of `versionCode` but a different value of `versionName`.

> [!TIP]
> If you upload the same apk/ipa a second time, the dialog will **NOT** appear as the binaries are identical. On iOS, if you upload a **new** build with the same version properties, it will show the update dialog. The reason for this is that it is a **different** binary. On Android, binaries are considered the same if both version properties are the same.

## How do I test in-app updates?

You need to upload release builds (that use the Distribute module of the App Center SDK) to the App Center Portal to test in-app updates, increasing version numbers every time.

1. Create your app in the App Center Portal if you haven't done that already.
1. Create a new distribution group and name it so you can recognize that this is just meant for testing the in-app update feature.
1. Add yourself (or all people who you want to include on your test of the in-app update feature). Use a new or throw-away email address for this, that was not used for that app on App Center. This ensures that you have an experience that's close to the experience of your real testers.
1. Create a new build of your app that includes **App Center Distribute** and contains the setup logic as described below. If the group is private, don't forget to set the private in-app update track before start using the [UpdateTrack property](#use-private-distribution-group).
1. Click on the **Distribute new release** button in the portal and upload your build of the app.
1. Once the upload has finished, click **Next** and select the **Distribution group** that you just created as the **Destination** of that app distribution.
1. Review the Distribution and distribute the build to your in-app testing group.
1. People in that group will receive an invite to be testers of the app. Once they accept the invite, they can download the app from the App Center Portal from their mobile device. Once they have in-app updates installed, you're ready to test in-app updates.
1. Bump the version of your app (`CFBundleShortVersionString ` or `CFBundleVersion ` for iOS, `versionCode` for Android)
1. Build the release version of your app and upload a new build of your app just like you did in the previous step and distribute this to the **Distribution Group** you created earlier. Members of the Distribution Group will be prompted for a new version the next time the app starts.

> [!TIP]
> Please have a look at the information on how to [utilize App Center Distribute](~/distribution/index.md) for more detailed information about **Distribution Groups** etc.
> While it is possible to use App Center Distribute to distribute a new version of your app without adding any code, adding App Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.


## Disable automatic forwarding of application delegate's methods to App Center services

App Center uses swizzling to automatically forward your application delegate's methods to App Center services to improve SDK integration. There is a possibility of conflicts with other third party libraries or the application delegate itself. In this case, you might want to disable the App Center application delegate forwarding for all App Center services by following the steps below:

1. Open the project's **Info.plist** file.
2. Add `AppCenterAppDelegateForwarderEnabled` key and set the value to `0`. This will disable application delegate forwarding for all App Center services.
3. Add `OpenUrl` callback in your `AppDelegate.cs` file.

```csharp
public override bool OpenUrl(UIApplication application, NSUrl url, string sourceApplication, NSObject annotation)
{
    Distribute.OpenUrl(url);
    return true;
}
```

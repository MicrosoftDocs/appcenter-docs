---
title: App Center Distribute for Android
description: Using in-app updates in App Center Distribute (Android)
keywords: sdk, distribute
author: king-of-spades
ms.author: kegr
ms.date: 11/12/2020
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.custom: sdk
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

# App Center Distribute – Android In-app updates

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Unity](unity.md)
> * [Xamarin](xamarin.md)

App Center Distribute will let your users install a new version of the app when you distribute it via App Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application.

> [!WARNING]
> Google Play considers the in-app update code as malicious behavior even if it isn’t used at runtime. Use a variant of the Distribute SDK as directed in [this section](#remove-in-app-updates-for-google-play-builds) before submitting your app to Google Play. Failure to not remove the in-app update code can lead to noncompliance and removal of the app from Google Play.

> [!NOTE]
> If you are running automated UI tests, enabled in-app updates will block your automated UI tests as they will try to authenticate against the App Center backend. We recommend to not enable App Center Distribute for your UI tests.

## Add in-app updates to your app
Follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

### 1. Add the App Center Distribute module

The App Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open the project's app level **build.gradle** file (`app/build.gradle`) and add the following lines after `apply plugin`.

    ```groovy
    dependencies {
       def appCenterSdkVersion = '4.0.0'
       implementation "com.microsoft.appcenter:appcenter-distribute:${appCenterSdkVersion}"
    }
    ```

    > [!NOTE]
    > If the version of your Android Gradle plugin is lower than 3.0.0, you need to replace the **implementation** with **compile**.

2. Save your **build.gradle** file and make sure to trigger a Gradle sync in Android Studio.
3. [DownloadManager](https://developer.android.com/reference/android/app/DownloadManager) is used to download updates. The App Center SDK enforces TLS 1.2 to improve security.

### 2. Start App Center Distribute

To use App Center, you must opt in to the module(s) that you want to use. By default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add the Distribute class to your `AppCenter.start()` method to start App Center Distribute service.

```java
AppCenter.start(getApplication(), "{Your App Secret}", Distribute.class);
```
```kotlin
AppCenter.start(application, "{Your App Secret}", Distribute::class.java)
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Android Studio automatically suggests the required import statement once you add a reference to the `Distribute` class to the `start()` method, but if you see an error that the class names aren't recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.appcenter.AppCenter;
import com.microsoft.appcenter.distribute.Distribute;
```
```kotlin
import com.microsoft.appcenter.AppCenter
import com.microsoft.appcenter.distribute.Distribute
```

## Remove in-app updates for Google Play builds

Google Play considers the in-app update code as malicious behavior even if it isn’t used at runtime. Failure to not remove the in-app update code can lead to noncompliance and removal of the app from Google Play. In order to make it easier, we provide the version of App Center Distribute SDK with stubbed APIs, so the only change for you is just a dependency swap.

1. Open the project's app level **build.gradle** file (`app/build.gradle`).
2. Configure build variants by adding product flavors:

    ```groovy
    android {
        flavorDimensions "distribute"
        productFlavors {
            appCenter {
                dimension "distribute"
            }
            googlePlay {
                dimension "distribute"
            }
        }
    }
    ```

3. Modify dependencies block to consume different dependencies based on the product flavor:

    ```groovy
    dependencies {
        def appCenterSdkVersion = "3.3.0"
        appCenterImplementation "com.microsoft.appcenter:appcenter-distribute:${appCenterSdkVersion}"
        googlePlayImplementation "com.microsoft.appcenter:appcenter-distribute-play:${appCenterSdkVersion}"
    }
    ```

4. Save your **build.gradle** file and make sure to trigger a Gradle sync in Android Studio.
5. You can change the build variant in **Build > Select Build Variant** drop down menu or **Build Variants** in the tool window bar.

You can read more about configuring build variants in the [Android documentation](https://developer.android.com/studio/build/build-variants).

## Use private distribution group

By default, Distribute uses a public distribution group. If you want to use a private distribution group, you will need to explicitly set it via `setUpdateTrack` API.

```java
Distribute.setUpdateTrack(UpdateTrack.PRIVATE);
```
```kotlin
Distribute.setUpdateTrack(UpdateTrack.PRIVATE)
```

> [!NOTE]
> The default value is `UpdateTrack.PUBLIC`. This method can only be called before the `AppCenter.start` method call. Changes to the update track aren't persisted when the application process restarts, and so if the method is not always called before the `AppCenter.start` call, it will be public, by default.

When the app is in foreground (after `Distribute.setUpdateTrack(UpdateTrack.PRIVATE);` and `AppCenter.start`), a browser window opens to authenticate the user. All the subsequent update checks will get the latest release on the private track.

If a user is on the **private track**, it means that after the successful authentication, they will get the latest release from any private distribution groups they are a member of.
If a user is on the **public track**, it means that they will get the latest release from any public distribution group.

## Disable Automatic Check for Update

By default, the SDK automatically checks for new releases:
 * When the application starts.
 * When the application goes into foreground after going to background.
 * When enabling the Distribute module if previously disabled.

If you want to check for new releases manually, you can disable automatic check for update.
To do this, call the following method before the SDK start:

```java
Distribute.disableAutomaticCheckForUpdate();
```
```kotlin
Distribute.disableAutomaticCheckForUpdate()
```

> [!NOTE]
> This method must be called before the `AppCenter.start` method call.

Then you can use the `checkForUpdate` API, which is described in the following section.

## Manually Check for Update

```java
Distribute.checkForUpdate();
```
```kotlin
Distribute.checkForUpdate()
```

This will send a request to App Center and display an update dialog in case there is a new release available.

> [!NOTE]
> A manual check for update call works even when automatic updates are enabled. A manual check for update is ignored if another check is already being performed. The manual check for update will not be processed if the user has postponed updates (unless the latest version is a mandatory update).

## Customize or localize the in-app update dialog

### 1. Customize or localize text

You can easily provide your own resource strings if you'd like to change or localize the text displayed in the update dialog. Look at the string files in [this resource file](https://github.com/Microsoft/AppCenter-SDK-Android/blob/master/sdk/appcenter-distribute/src/main/res/values/appcenter_distribute.xml). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app resource files.

### 2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the `DistributeListener` interface. You need to register the listener before calling `AppCenter.start` as shown in the following example:

```java
Distribute.setListener(new MyDistributeListener());
AppCenter.start(...);
```
```kotlin
Distribute.setListener(MyDistributeListener())
AppCenter.start(...)
```

Here is an example of the listener implementation that replaces the SDK dialog with a custom one:

```java
import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.net.Uri;

import com.microsoft.appcenter.distribute.Distribute;
import com.microsoft.appcenter.distribute.DistributeListener;
import com.microsoft.appcenter.distribute.ReleaseDetails;
import com.microsoft.appcenter.distribute.UpdateAction;

public class MyDistributeListener implements DistributeListener {

    @Override
    public boolean onReleaseAvailable(Activity activity, ReleaseDetails releaseDetails) {

        // Look at releaseDetails public methods to get version information, release notes text or release notes URL
        String versionName = releaseDetails.getShortVersion();
        int versionCode = releaseDetails.getVersion();
        String releaseNotes = releaseDetails.getReleaseNotes();
        Uri releaseNotesUrl = releaseDetails.getReleaseNotesUrl();

        // Build our own dialog title and message
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(activity);
        dialogBuilder.setTitle("Version " + versionName + " available!"); // you should use a string resource instead of course, this is just to simplify example
        dialogBuilder.setMessage(releaseNotes);

        // Mimic default SDK buttons
        dialogBuilder.setPositiveButton(com.microsoft.appcenter.distribute.R.string.appcenter_distribute_update_dialog_download, new DialogInterface.OnClickListener() {

            @Override
            public void onClick(DialogInterface dialog, int which) {

                // This method is used to tell the SDK what button was clicked
                Distribute.notifyUpdateAction(UpdateAction.UPDATE);
            }
        });

        // We can postpone the release only if the update is not mandatory
        if (!releaseDetails.isMandatoryUpdate()) {
            dialogBuilder.setNegativeButton(com.microsoft.appcenter.distribute.R.string.appcenter_distribute_update_dialog_postpone, new DialogInterface.OnClickListener() {

                @Override
                public void onClick(DialogInterface dialog, int which) {

                    // This method is used to tell the SDK what button was clicked
                    Distribute.notifyUpdateAction(UpdateAction.POSTPONE);
                }
            });
        }
        dialogBuilder.setCancelable(false); // if it's cancelable you should map cancel to postpone, but only for optional updates
        dialogBuilder.create().show();

        // Return true if you are using your own dialog, false otherwise
        return true;
    }
}
```
```kotlin
import android.app.Activity
import android.app.AlertDialog
import com.microsoft.appcenter.distribute.Distribute
import com.microsoft.appcenter.distribute.DistributeListener
import com.microsoft.appcenter.distribute.ReleaseDetails
import com.microsoft.appcenter.distribute.UpdateAction

class MyDistributeListener : DistributeListener {

    override fun onReleaseAvailable(activity: Activity, releaseDetails: ReleaseDetails): Boolean {

        // Look at releaseDetails public methods to get version information, release notes text or release notes URL
        val versionName = releaseDetails.shortVersion
        val versionCode = releaseDetails.version
        val releaseNotes = releaseDetails.releaseNotes
        val releaseNotesUrl = releaseDetails.releaseNotesUrl

        // Build our own dialog title and message
        val dialogBuilder = AlertDialog.Builder(activity)
        dialogBuilder.setTitle("Version $versionName available!") // you should use a string resource instead of course, this is just to simplify example
        dialogBuilder.setMessage(releaseNotes)

        // Mimic default SDK buttons
        dialogBuilder.setPositiveButton(
            com.microsoft.appcenter.distribute.R.string.appcenter_distribute_update_dialog_download
        ) { dialog, which ->
            // This method is used to tell the SDK what button was clicked
            Distribute.notifyUpdateAction(UpdateAction.UPDATE)
        }

        // We can postpone the release only if the update is not mandatory
        if (!releaseDetails.isMandatoryUpdate) {
            dialogBuilder.setNegativeButton(
                com.microsoft.appcenter.distribute.R.string.appcenter_distribute_update_dialog_postpone
            ) { dialog, which ->
                // This method is used to tell the SDK what button was clicked
                Distribute.notifyUpdateAction(UpdateAction.POSTPONE)
            }
        }
        dialogBuilder.setCancelable(false) // if it's cancelable you should map cancel to postpone, but only for optional updates
        dialogBuilder.create().show()

        // Return true if you are using your own dialog, false otherwise
        return true
    }
}
```

As shown in the example, you have to either call `Distribute.notifyUpdateAction(UpdateAction.UPDATE);` or `Distribute.notifyUpdateAction(UpdateAction.POSTPONE);` if your listener returns `true`.

If you don't call `notifyUpdateAction`, the callback will repeat on every activity change.

The listener can be called again with the same release if the activity changes before the user action is notified to the SDK.

This behavior is needed to cover the following scenarios:
* Your application is sent to the background (like pressing **HOME**) then resumed in a different activity.
* Your activity is covered by another one without leaving the application (like clicking on some notifications).
* Other similar scenarios.

In that case, the activity hosting the dialog might be replaced without user interaction. So the SDK calls the listener again so that you can restore the custom dialog.

## Enable or disable App Center Distribute at runtime

You can enable and disable App Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality but you can still use Distribute service in App Center portal.

```java
Distribute.setEnabled(false);
```
```kotlin
Distribute.setEnabled(false)
```

To enable App Center Distribute again, use the same API but pass `true` as a parameter.

```java
Distribute.setEnabled(true);
```
```kotlin
Distribute.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Distribute` has been started.

## Check if App Center Distribute is enabled

You can also check if App Center Distribute is enabled or not:

```java
Distribute.isEnabled();
```
```kotlin
Distribute.isEnabled()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Distribute` has been started, it will always return `false` before start.

## Enable in-app updates for debug builds

By default App Center enables in-app updates only for release builds.

To enable in-app updates in debug builds, call the following method before `AppCenter.start`:

```java
Distribute.setEnabledForDebuggableBuild(true);
```
```kotlin
Distribute.setEnabledForDebuggableBuild(true)
```

> [!NOTE]
> This method only affects debug builds, and has no impact on release builds.
> Debug build means that the `android:debuggable` flag is set to `true` (which is usually automatically set by gradle predefined debug build variants). Otherwise, this is a release build.

## How do in-app updates work?

> [!NOTE]
> For in-app updates to work, an app build should be downloaded from the link. It won't work if installed from an IDE or manually.

The in-app updates feature works as follows:

1. This feature only works with **RELEASE** builds (by default) that are distributed using **App Center Distribute** service.
2. Once you integrate the SDK, build release version of your app and upload to App Center, users in that distribution group will be notified for the new release via an email.
3. When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install - we don't support side-loading. When an application is downloaded from the link, the SDK saves important information from cookies to check for updates later, otherwise the SDK doesn’t have that key information.
4. If the application sets the track to private, a browser will open to authenticate the user and enable in-app updates. The browser will not open again as long as the authentication information remains valid even when switching back to the public track and back to private again later. If the browser authentication is successful, the user is redirected back to the application automatically. If the track is public (which is the default), the next step happens directly.
5. A new release of the app shows the in-app update dialog asking users to update your application if it has:

   * a higher value of `versionCode` or
   * an equal value of `versionCode` but a different value of `versionName`.

> [!TIP]
> If you upload the same APK a second time, the dialog will **NOT** appear as the versions are identical.

## How do I test in-app updates?

You need to upload release builds (that use the Distribute module of the App Center SDK) to the App Center Portal to test in-app updates, increasing version numbers every time.

1. Create your app in the App Center Portal if you haven't done that already.
1. Create a new distribution group and name it so you can recognize that this is just meant for testing the in-app update feature.
1. Add yourself (or all people who you want to include on your test of the in-app update feature). Use a new or throw-away email address for this, that was not used for that app on App Center. This ensures that you have an experience that's close to the experience of your real testers.
1. Create a new build of your app that includes **App Center Distribute** and contains the setup logic as described above. If the group is private, don't forget to set the private in-app update track before start using the [setUpdateTrack API](#use-private-distribution-group).
1. Click on the **Distribute new release** button in the portal and upload your build of the app.
1. Once the upload has finished, click **Next** and select the **Distribution group** that you just created as the **Destination** of that app distribution.
1. Review the Distribution and distribute the build to your in-app testing group.
1. People in that group will receive an invite to be testers of the app. Once they accept the invite, they can download the app from the App Center Portal from their mobile device. Once they have in-app updates installed, you're ready to test in-app updates.
1. Bump the `versionCode` of your app.
1. Build the release version of your app and upload a new build of your app just like you did in the previous step and distribute this to the **Distribution Group** you created earlier. Members of the Distribution Group will be prompted for a new version the next time the app starts.

> [!TIP]
> Have a look at the information on how to [utilize App Center Distribute](~/distribution/index.md) for more detailed information about **Distribution Groups** etc.
> While it is possible to use App Center Distribute to distribute a new version of your app without adding any code, adding App Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.

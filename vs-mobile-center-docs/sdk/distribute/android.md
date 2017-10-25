---
title: Mobile Center Distribute for Android
description: Using in-app updates in Mobile Center Distribute
keywords: sdk, distribute
author: elamalani
ms.author: emalani
ms.date: 10/23/2017
ms.topic: article
ms.assetid: 62f0364a-e396-4b22-98f3-8b2d92b5babb
ms.service: mobile-center
ms.custom: sdk
ms.tgt_pltfrm: android
---

# Mobile Center Distribute – In-app updates

> [!div class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)

Mobile Center Distribute will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. 

> [!NOTE]
> There are a few things to consider when using in-app updates:
> 
> 1. If you have released your app in the Play Store, in-app updates will be disabled.
> 2. If you are running automated UI tests, enabled in-app updates will block your automated UI tests as they will try to authenticate against the Mobile Center backend. We recommend to not enable Mobile Center Distribute for your UI tests.

## Add in-app updates to your app

Please follow the [Get started](~/sdk/getting-started/android.md) section if you haven't set up and started the SDK in your application, yet.

### 1. Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – a developer only needs to integrate the modules of the services that they're interested in.

1. Open your app level `build.gradle` file (`app/build.gradle`) and add the following lines after `apply plugin`.

    ```groovy
    dependencies {
       def mobileCenterSdkVersion = '0.13.0'
       compile "com.microsoft.azure.mobile:mobile-center-distribute:${mobileCenterSdkVersion}"
    }
    ```

2. Save your `build.gradle` file and make sure to trigger a Gradle sync in Android Studio.

### 2. Start Mobile Center Distribute

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

Add `Distribute.class` to your `MobileCenter.start()` method to start Mobile Center Distribute service.

```java
MobileCenter.start(getApplication(), "{Your App Secret}", Distribute.class);
```

Make sure you have replaced `{Your App Secret}` in the code sample above with your App Secret. Android Studio will automatically suggest the required import statement once you add `Distribute.class` to the `start()` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:

```java
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.distribute.Distribute;
```

## Customize or localize the in-app update dialog

### 1. Customize or localize text

You can easily provide your own resource strings if you'd like to change or localize the text displayed in the update dialog. Look at the string files in [this resource file](https://github.com/Microsoft/mobile-center-sdk-android/blob/develop/sdk/mobile-center-distribute/src/main/res/values/mobile_center_distribute.xml). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app resource files.

### 2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the `DistributeListener` interface. You need to register the listener before calling `MobileCenter.start` as shown in the following example:

```java
Distribute.setListener(new MyDistributeListener());
MobileCenter.start(...);
```

Here is an example of the listener implementation that replaces the SDK dialog with a custom one:

```java
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
        dialogBuilder.setPositiveButton(com.microsoft.azure.mobile.distribute.R.string.mobile_center_distribute_update_dialog_download, new DialogInterface.OnClickListener() {

            @Override
            public void onClick(DialogInterface dialog, int which) {

                // This method is used to tell the SDK what button was clicked
                Distribute.notifyUpdateAction(UpdateAction.UPDATE);
            }
        });

        // We can postpone the release only if the update is not mandatory
        if (!releaseDetails.isMandatoryUpdate()) {
            dialogBuilder.setNegativeButton(com.microsoft.azure.mobile.distribute.R.string.mobile_center_distribute_update_dialog_postpone, new DialogInterface.OnClickListener() {

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

As shown in the example, you have to either call `Distribute.notifyUpdateAction(UpdateAction.UPDATE);` or `Distribute.notifyUpdateAction(UpdateAction.POSTPONE);` if your listener returns `true`.

If you don't call `notifyUpdateAction`, the callback will repeat on every activity change.

The listener can be called again with the same release if the activity changes before the user action is notified to the SDK.

This behavior is needed to cover the following scenarios:
* Your application is sent to the background (like pressing **HOME**) then resumed in a different activity.
* Your activity is covered by another one without leaving the application (like clicking on some notifications).
* Other similar scenarios.

In that case, the activity hosting the dialog might be replaced without user interaction. So the SDK calls the listener again so that you can restore the custom dialog.

## Enable or disable Mobile Center Distribute at runtime

You can enable and disable Mobile Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality but you can still use Distribute service in Mobile Center portal.

```java
Distribute.setEnabled(false);
```
To enable Mobile Center Distribute again, use the same API but pass `true` as a parameter.

```java
Distribute.setEnabled(true);
```

[!include[](../android-see-async.md)]

## Check if Mobile Center Distribute is enabled

You can also check if Mobile Center Distribute is enabled or not:

```java
Distribute.isEnabled();
```

[!include[](../android-see-async.md)]

## How do in-app updates work?

The in-app updates feature works as follows:

1. This feature will ONLY work with **RELEASE** builds that are distributed using **Mobile Center Distribute** service.
2. Once you integrate the SDK, build release version of your app and upload to Mobile Center, users in that distribution group will be notified for the new release via an email. 
3. When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install - we do not support side-loading.
4. Once the app is installed and opened for the first time after the Mobile Center Distribute SDK has been added, a browser will open to enable in-app updates. This is a ONE TIME step that will not occur for subsequent releases of your app.
5. Once the above step is successful, they should navigate back to the app.
6. A new release of the app shows the in-app update dialog asking users to update your application if it has

    * a higher value of `versionCode` or
    * an equal value of `versionCode` but a higher value of `versionName`.

> [!TIP]
> If you upload the same APK a second time, the dialog will **NOT** appear as the versions are identical.

## How do I test in-app updates?

You need to upload release builds (that use the Distribute module of the Mobile Center SDK) to the Mobile Center Portal to test in-app updates, increasing version numbers every time.

1. Create your app in the Mobile Center Portal if you haven't done that already.
2. Create a new distribution group and name it so you can recognize that this is just meant for testing the in-app update feature.
3. Add yourself (or all people who you want to include on your test of the in-app update feature). Use a new or throw-away email address for this, that was not used for that app on Mobile Center. This ensures that you have an experience that's close to the experience of your real testers.
4. Create a new build of your app that includes **Mobile Center Distribute** and contains the setup logic as described below.
5. Click on the **Distribute new release** button in the portal and upload your build of the app.
6. Once the upload has finished, click **Next** and select the **Distribution group** that you just created as the **Destination** of that app distribution.
7. Review the Distribution and distribute the build to your in-app testing group.
8. People in that group will receive an invite to be testers of the app. Once they need to accept the invite, they can download the app from the Mobile Center Portal from their mobile device. Once they have in-app updates installed, you're ready to test in-app updates.
9. Bump the `versionCode` of your app.
10. Build the release version of your app and upload a new build of your app just like you did in the previous step and distribute this to the **Distribution Group** you created earlier. Members of the Distribution Group will be prompted for a new version the next time the app enters the foreground.

> [!TIP]
> Please have a look at the information on how to [utilize Mobile Center Distribute](~/distribution/index.md) for more detailed information about **Distribution Groups** etc.
While it is possible to use Mobile Center Distribute to distribute a new version of your app without adding any code, adding Mobile Center Distribute to your app's code will result in a more seamless experience for your testers and users as they get the in-app update experience.
---
title: Enable In-app Updates
description: Easily stay up to date on the latest build with in-app update notifications.
keywords: distribution
author: king-of-spades
ms.author: kegr
ms.date: 07/16/2020
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
ms.assetid: b5c07e60-985b-4941-a139-a203ea912d5a
---

# In-App Updates

Enable your testers to easily stay up to date with the latest releases. Integrate the App Center SDK (and the Distribution Module) for [iOS][ios-sdk], [Android][android-sdk], or [Xamarin][xamarin-sdk] to automatically enable in-app notification for new releases. Once completed, all [future releases][uploading] through App Center will trigger an in-app notification for each tester allowing a quick upgrade to the latest version.

> [!IMPORTANT]
> At this time, there are some limitations to In-App Updates:
> 1) Android devices won't be prompted for an update if there's no change in `versionCode` or `versionName`.
> 2) For iOS public in-app updates, if you use the private track, Apple has a default dialog that must be dismissed. Login isn't required for the public flow.
> 3) In-App Updates don't work on windows/UWP applications.

## Public In-App Updates

To enable public in-app updates, create a [public distribution group][public-dg] and distribute a release with the App Center SDK. Once your testers install the app, they'll be alerted when new releases are publicly available.

## Compatibility With Application Stores

### Android

If the application is installed from Google Play or other stores instead of App Center, checking for new versions will be disabled.

Google can consider in-app update code as malicious behavior even if it isn't used at runtime. We recommend you to strip this code from your application before submitting it to Google Play. In order to make it easier, we provide the version of App Center Distribute SDK with stubbed APIs, so the only change for you is just a dependency swap. You can find the detailed instructions on [Android](~/sdk/distribute/android.md#remove-in-app-updates-for-google-play-builds), [Xamarin](~/sdk/distribute/xamarin.md#remove-in-app-updates-for-google-play-builds), or [Unity](~/sdk/distribute/unity.md#remove-in-app-updates-for-google-play-builds) pages.

### iOS

If the application is installed from the App Store or TestFlight, in-app updates aren't available, and checking for new versions will be disabled.

## FAQ

 1. Why are testers asked to authenticate repeatedly?
  - App Center SDK uses a device's default browser to store cookies. In the following cases, SDK will ask for reauthentication:
    - Tester cleared cookies from device's default browser.
    - Tester disabled cookies for the device's default browser.
    - Tester closed the first authentication window after opening the app.
    - App Secret used to initialize the SDK isn't the same as the one listed on the App Center web portal.

 2. Why do testers not see an in-app update message when a new version of the app is released?
- Multiple scenarios can cause testers to not get in-app update notifications:
    - App Center SDK distribute feature is disabled. App Center SDK distribute feature must be enabled and initialized at app launch. If testers installed a version with the distribute feature disabled, they would need to install the latest version manually.
    - Automatic check for update is disabled. If automatic check for update is disabled, the app won't check for new releases at startup. The check happens when **checkForUpdate** is called.
    - Release version of your app is incorrect for a new release
      - For Android: increment version code.
      - For iOS: increment `CFBundleShortVersionString` and conform to semantic versioning standards

 3. Why do testers see "In-app Update disabled" message?
- Multiple scenarios can make the App Center SDK to display this message:
  - The app wasn't installed from App Center.
  - The version a tester installed wasn't released via App Center or the release was deleted on App Center.
  - App secret used in the SDK is incorrect. To get your app secret, go to your app's settings page, click on the triple vertical dots at the top right-hand corner, and copy app secret.
     - If you've migrated your App from HockeyApp, refer to the following articles: 
        - iOS: [Migrating from HockeyApp][ios-sdk-migration]
        - Android: [Migrating from HockeyApp][android-sdk-migration]

[ios-sdk]: ~/sdk/distribute/ios.md
[android-sdk]: ~/sdk/distribute/android.md
[xamarin-sdk]: ~/sdk/distribute/xamarin.md
[uploading]: uploading.md
[public-dg]: groups.md#creating-a-distribution-group
[ios-sdk-migration]: ~/transition/ios-sdk-migration.md#21-convert-the-application-identifier
[android-sdk-migration]: ~/transition/android-sdk-migration.md#21-convert-the-application-identifier

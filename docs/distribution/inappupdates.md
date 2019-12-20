---
title: Enable In-app Updates
description: Easily stay up to date on the latest build with in-app update notifications.
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 12/05/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
ms.assetid: b5c07e60-985b-4941-a139-a203ea912d5a
---

# In-App Updates

Enable your testers to easily stay up to date with the latest releases. Integrate the App Center SDK (and the Distribution Module) for [iOS][ios-sdk], [Android][android-sdk], or [Xamarin][xamarin-sdk] to automatically enable in-app notification for new releases. Once completed, all [future releases][uploading] through App Center will trigger an in-app notification for each tester allowing a quick upgrade to the latest version.

> [!IMPORTANT]
> At this time, there are some limitations to In-App Updates:
> 1) Android devices will not be prompted for an update if there is no change in the version or build version.
> 2) In-app updates only work for public distribution groups if testers have downloaded the app from their default browser with cookies enabled.

## Public In-App Updates 

To enable public in-app updates, create a [public distribution group][public-dg] and distribute a release with the App Center SDK. Once your testers install the app, they will be alerted when new releases are publicly available. Because publicly available releases are available to anyone with the app, testers that downloaded the app through a private distribution group will also be alerted for publicly available releases. 

## FAQ

 1. Why are testers asked to authenticate for a public release?
  - We are actively working on making changes in the SDK to address this issue.

 2. Why are testers asked to authenticate repeatedly?
  - AppCenter SDK uses a device's default browser to store cookies. In the following cases, SDK will ask for reauthentication: 
    - Tester cleared cookies from device's default browser.
    - Tester disabled cookies for the device's default browser.
    - Tester closed the first authentication window after opening the app.
    - App Secret used to initialize the SDK is not the same as the one listed on the AppCenter web portal.   

 3. Why do testers not see an in-app update message when a new version of the app is released?
- Multiple scenarios can cause testers to not get in-app update notifications:
    - App Center SDK distribute feature is disabled. App Center SDK distribute feature must be enabled and initialized at app launch. If testers installed a version with the distribute feature disabled, they would need to install the latest version manually.
    - Release version of your app is incorrect for a new release 
      - For Android: increment version code.
      - For iOS: increment CFBundleShortVersionString and conform to semantic versioning standards

 4. Why do testers see "In-app Update disabled" message?  
- Multiple scenarios can make the App Center SDK to display this message:
  - The app was not installed from App Center. 
  - The version a tester installed was not released via App Center or the release was deleted on App Center.
  - App secret used in the SDK is incorrect. To get your app secret, go to your app's settings page, click on the triple vertical dots at the top right-hand corner, and copy app secret.
     - If you have migrated your App from HockeyApp, refer to the following articles: 
        - iOS: [Migrating from HockeyApp][~/transition/ios-sdk-migration?tabs=objc#21-convert-the-application-identifier]
        - Android: [Migrating from HockeyApp][~/transition/android-sdk-migration#21-convert-the-application-identifier]

[ios-sdk]: ~/sdk/distribute/ios.md
[android-sdk]: ~/sdk/distribute/android.md
[xamarin-sdk]: ~/sdk/distribute/xamarin.md
[uploading]: uploading.md
[public-dg]: groups.md##creating-a-distribution-group

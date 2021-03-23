---
title: HockeySDK Retirement
description: Transition from the HockeySDK to the App Center SDK
author: lucen-ms
ms.author: lucen
ms.date: 06/24/2020
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# Extended HockeySDK support is being retired
HockeySDK is now deprecated and will continue to work until November 13, 2020. After this date, HockeySDK will stop sending data for your app. To continue receiving analytics/crash data from your apps and to keep using in-app updates, make sure to upgrade your apps to the App Center SDK versions before November 13, 2020. We recommend updating to the App Center SDK as soon as possible to ensure data continuity as your end users adopt new versions of your app. 

## Migrate from the HockeySDK to the App Center SDK
Follow this documentation to update your apps to use the App Center SDK instead of the HockeySDK. The guides for each platform are listed below.

* [HockeySDK Android](android-sdk-migration.md)
* [HockeySDK iOS](ios-sdk-migration.md)
* [HockeySDK UWP](uwp-sdk-migration.md)
* [HockeySDK macOS](macos-sdk-migration.md)
* [HockeySDK tvOS](tvos-sdk-migration.md)
* [HockeySDK Xamarin](xamarin-sdk-migration.md)
* [HockeySDK Unity](unity-sdk-migration.md)
* [HockeySDK Cordova](cordova-sdk-migration.md)
* [HockeySDK WPF/Winforms](wpf-winforms-sdk-migration.md)

## Download Links
Requests to the link of the format `https://rink.hockeyapp.net/api/2/apps/0873e2b98ad046a92c170a243a8515f6?format=apk` are forwarded to App Center. Make sure the file format is appropriate to the binary uploaded. The latest version that's released to the "All users of AppName" distribution group or to any other public distribution group will be returned.

> [!Note]
> The HockeyApp app id used in the link above is equivalent to the app secret of your app in App Center but without dashes.

## HockeyApp Feedback Feature
App Center doesn't support the HockeyApp Feedback functionality. For potential alternatives, see the [feedback guide](feedback.md).

## FAQS
### Why are we retiring HockeySDK?
In 2018, we announced the transition from HockeyApp to Visual Studio App Center. App Center is a single solution for continuously building, testing, releasing, and monitoring your apps. HockeyApp transitions are now complete, but we extended the retirement of the HockeySDK to November 13, 2020, to give you more time to move to App Center SDK. 

### What'll happen after November 13, 2020?
All apps that still include the HockeySDK after November 13, 2020 will stop sending data to the App Center Portal. You'll no longer receive Analytics and Diagnostics data for these versions, and users will no longer receive in-app updates. 

### What services will be affected?
All App Center services for which you're using HockeySDK will be affected, including Diagnostics, Analytics, and Distribute in-app updates. 

### How can I know if my apps are using HockeySDK?
To know if your app is using HockeySDK, you can either look into your codebase, or check for dependencies in Gradle, Podfile, NuGet, and so on.

### Can I get an extension on the deadline?
The November 13, 2020 extended retirement date is final and we can't grant extensions. 

### How can I migrate to the App Center SDK?
We've created detailed App Center SDK migration guides for each of our supported platforms. Links to each of these guides are listed at the top of this page. 

### I've already migrated my app to the App Center SDK. Why'd I still get the retirement announcement?
If you've already migrated to App Center SDK, it's likely some of your customers are still using the old versions of the app with HockeySDK. You'll stop receiving data from these customers after November 13, 2020 unless these customers upgrade to the app version with App Center SDK. 

### The App Center SDK is missing a feature that the HockeySDK provided. Will these features be added to App Center SDK before the retirement?
The App Center team has closed most feature parity gaps with the HockeySDK. While a small number of gaps still exist, we don't intend on investing further in closing them.

### How can I get more help with this announcement?
To get help, click the help menu (?) in the upper right corner of the App Center portal, then select Contact support. Once you fill out the form, our team will be in contact with you via email. Responsiveness might vary based on the support load at a given moment.

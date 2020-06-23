---
title: "HockeyApp Retirement"
description: Transition from HockeyApp to App Center
author: ahbilal
ms.author: Ahmed Bilal
ms.date: 06/20/2020
ms.topic: article
ms.assetid: A5AB2B92-0616-4F41-A0E7-43FD3C778059
ms.service: vs-appcenter
---

# HockeySDK is retiring

HockeySDK is now deprecated and will continue to work until November 13, 2020. After this date, HockeySDK will stop sending data for your app. To continue getting analytics/crash data from your apps and keep using in-app updates, make sure to upgrade your apps to the App Center SDK versions before November 13, 2020.

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

## FAQS

#### Why are we retiring HockeySDK?

In 2018, we announced the transition from HockeyApp to Visual Studio App Center, a single solution for continuously building, testing, releasing, and monitoring your apps. HockeyApp transitions are now complete, but we extended the retirement of the HockeySDK to November 16, 2020, to give you more time to move to App Center SDK. 

#### What will happen after November 13th, 2020?

All Apps that have HockeySDK in it will stop sending data to the App Center Portal. 

#### What services will be impacted?

All App Center services for which you are using HockeySDK will be impacted. This includes Crashes, Analytics, and In-app update. 

#### How can I know if my apps are using HockeySDK?

#### Can I get an extension on the deadline?

The shutdown date is final and unfortunately we will not be able to grant an extension. 

#### How can I migrate to App Center SDK?

Follow the guides for each platform to update your apps to use the App Center SDK instead of the HockeySDK.

#### I have already migrated my app to the App Center SDK? Why did I still get the retirement announcement?

If you have already migrated to App Center SDK, it is likely that few of your customers are still using the old versions of the app with HockeySDK. You will stop receiving data from these customers after November 13th, 2020 unless these customers upgrade to the app version with App Center SDK. 

#### App Center SDK is missing a feature that HockeySDK provided. Will these features be added to App Center SDK before the shutdown?

The App Center team has closed major feature gaps with HockeySDK. Despite this, there still exists few features that are missing in the App Center SDK. Unfortunately, these gaps and features don't align with the general App Center product direction and we will not be able to close them any time soon. 

#### How can I get more help with this announcement?

To get help, click the help menu (?) in the upper right corner of the App Center portal, then select Contact support. Once you fill out the form, our team will be in contact with you via email. Responsiveness might vary based on the support load at a given moment. Read more about App Center support and help and feedback.

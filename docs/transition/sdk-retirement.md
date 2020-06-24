---
title: "HockeySDK Retirement"
description: Transition from the HockeySDK to the App Center SDK
author: ahbilal
ms.author: Ahmed Bilal
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

## FAQS

#### Why are we retiring HockeySDK?

In 2018, we announced the transition from HockeyApp to Visual Studio App Center, a single solution for continuously building, testing, releasing, and monitoring your apps. HockeyApp transitions are now complete, but we extended the retirement of the HockeySDK to November 16, 2020, to give you more time to move to the App Center SDK. 

#### What will happen after November 13th, 2020?

All apps that still include the HockeySDK after November 13, 2020 will stop sending data to the App Center Portal. You will no longer receive Analytics and Diagnostics data for these versions, and users will no longer receive in-app updates. 

#### What services will be impacted?

All App Center services for which you are using HockeySDK will be impacted. This includes Diagnostics, Analytics, and Distribute in-app updates. 

#### How can I know if my apps are using HockeySDK?



#### Can I get an extension on the deadline?

The November 13, 2020 extended retirement date is final and we will not be able to grant any extensions. 

#### How can I migrate to the App Center SDK?

We have created detailed App Center SDK migration guides for each of our supported platforms. Links to each of these guides are listed at the top of this page. 

#### I have already migrated my app to the App Center SDK? Why did I still get the retirement announcement?

If you have already migrated to App Center SDK, it is likely that few of your customers are still using the old versions of the app with HockeySDK. You will stop receiving data from these customers after November 13th, 2020 unless these customers upgrade to the app version with App Center SDK. 

#### The App Center SDK is missing a feature that the HockeySDK provided. Will these features be added to App Center SDK before the retirement?

The App Center team has spent the last couple of years closing the majority of feature parity gaps with the HockeySDK. While a small number of feature parity gaps still exist, we do not itend on investing further in closing these gaps.

#### How can I get more help with this announcement?

To get help, click the help menu (?) in the upper right corner of the App Center portal, then select Contact support. Once you fill out the form, our team will be in contact with you via email. Responsiveness might vary based on the support load at a given moment.

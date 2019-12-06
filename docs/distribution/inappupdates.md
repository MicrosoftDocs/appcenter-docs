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

Enable your tester to easily stay up to date with the latest releases. Integrate the App Center SDK (and the Distribution Module) for [iOS][ios-sdk], [Android][android-sdk], or [Xamarin][xamarin-sdk] to automatically enable in-app notification of new releases. Once completed all [future releases][uploading] through App Center will trigger an in-app notification for each user allowing a quick upgrade to the latest version.

> [!IMPORTANT]
> At this time, there are some limitations to In-App Updates:
> 1) Android devices will not be prompted for an update if there is no change in the version or build version.
> 2) In-app updates only work for public distribution groups if testers have downloaded the app from their default browser with cookies enabled.

## Public In-App Updates 

To enable public in-app updates, create a [public distribution group][public-dg] and distribute a release with the App Center SDK. Once your testers install the app, they will be be alerted when new releases are publicly available. Because publicly available releases are available to anyone with the app, users that downloaded the app through a private distribution group will also get alerted for publicly available releases. 

[ios-sdk]: ~/sdk/distribute/ios.md
[android-sdk]: ~/sdk/distribute/android.md
[xamarin-sdk]: ~/sdk/distribute/xamarin.md
[uploading]: uploading.md
[public-dg]: groups.md##creating-a-distribution-group

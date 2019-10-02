---
title: Enable In-app Updates
description: Easily stay up to date on the latest build with in-app update notifications.
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 10/02/2019
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
> 2) For iOS public in-app updates, Apple has a default dialog that will have to be dismissed. Login is not required for the public flow.

[ios-sdk]: ~/sdk/distribute/ios.md
[android-sdk]: ~/sdk/distribute/android.md
[xamarin-sdk]: ~/sdk/distribute/xamarin.md
[uploading]: uploading.md

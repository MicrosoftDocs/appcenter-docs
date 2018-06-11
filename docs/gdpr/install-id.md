---
title: Application Install ID 
description: How to find an install ID 
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 76BF8E6E-DC82-4541-95B9-5CCCF0FDB9DF
ms.service: vs-appcenter
---

# Application Install ID

## What is an install ID?

App Center does not directly collect the personal information or user generated content of your end users. We provide services accessed by the developer using our SDK or web site. The data transmitted to these services depends largely on the type of application you have built, and which of our services your app uses.

For each App Center SDK installed inside your app, we automatically create a unique installation identifier (or install ID for short). This install ID makes it possible for our services to display and return meaningful information for a specific device. We do not map your end-user's identities to install IDs, but this doesn't mean that you can't for the purposes of GDPR compliance.

## Map install IDs to user IDs

The easiest way to associate install IDs with users is via a login mechanism. In this pattern, the developer associates a login identity with an install ID on authentication. Since a new installation of the app SDK will result in an entirely new install ID, a robust design will include the possibility of many install IDs mapping to a single identity. At the moment you will have to roll an implementation on your own while the App Center team goes over our own designs and gauges customer interest in such a feature.

Here is how to retrieve an install ID for....

* [UWP](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/uwp#identify-installations)
* [Xamarin](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/xamarin#identify-installations)
* [Android](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/android#identify-installations)
* [iOS](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/ios#identify-installations)
* [MacOS](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/macos#identify-installations)
* [React Native](https://docs.microsoft.com/en-us/appcenter/sdk/other-apis/react-native#identify-installations)

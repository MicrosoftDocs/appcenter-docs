---
title: Mobile Center Push
description: Help using the Push on Mobile Center
keywords: mobile center, push
author: blparr
ms.author: blparr
ms.date: 05/11/2017
ms.topic: article
ms.assetid: B2CF9BFA-4C31-484C-83F7-9DD0E10AA8BD
ms.service: mobile-center
ms.custom: push
---


## Audiences

Audiences let you segment your user base based on a set of properties and send them targeted notifications.
These properties can be of two types:

- **Device Properties:**
    - App Version
    - Country
    - Mobile Carrier
    - Language
    - Device Model
    - OEM (Original Equipment Manufacturer)
    - API Level
    - Screen Size

- **Custom Properties:**
These properties are custom key-value pairs defined by the developer. This will allow you to segment your user based on properties of your app specific. An example of "key/value" pair is "type/premium".
You can set these custom properties by using our SDK methods for each platform:

    - [Android](~/sdk/other-apis/android.md)
    - [iOS](~/sdk/other-apis/ios.md)
    - [UWP](~/sdk/other-apis/uwp.md)
    - [Xamarin](~/sdk/other-apis/xamarin.md)

## Create Audiences
From the audiences tab, select the necessary conditions to create your segment (both custom and device properties), and save your segment. You can later on use this segment when sending a notification.
Another way to create an audience, is when selecting the Audience as a target in the send notification flow.

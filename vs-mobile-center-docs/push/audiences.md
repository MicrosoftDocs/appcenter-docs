---
title: App Center Push Audiences
description: Help using the Push Audiences on App Center
keywords: app center, push, audiences
author: blparr
ms.author: blparr
ms.date: 06/20/2017
ms.topic: article
ms.assetid: 240ECA63-3C91-4ABD-AC7A-F51E2FE81891
ms.service: vs-appcenter
ms.custom: audiences
---


# Audiences

Audiences let you segment your user base based on a set of properties and send them targeted notifications.

An example of an audience could be "App Version = 1.0.0" and "Country = Spain".

These properties can be of two types:

**Device Properties:**

    - App Version
    - Country
    - Mobile Carrier
    - Language
    - Device Model
    - OEM (Original Equipment Manufacturer)
    - API Level
    - Screen Size

**Custom Properties:**

These properties are custom key-value pairs defined by the developer. This will allow you to segment your user based on properties of your app specific.
Examples of custom properties are:

| Key            | Value   |
| -------------- | ------- |
| Type           | Premium |
| Favorite Sport | Premium |


You can set these custom properties by using our SDK methods for each platform:

   - [Android](~/sdk/other-apis/android.md#use-custom-properties) 
   - [iOS](~/sdk/other-apis/ios.md#use-custom-properties)
   - [UWP](~/sdk/other-apis/uwp.md#use-custom-properties)
   - [Xamarin](~/sdk/other-apis/xamarin.md#use-custom-properties)
   - [React Native](~/sdk/other-apis/react-native.md#use-custom-properties)
   - [macOS](~/sdk/other-apis/macos.md#use-custom-properties)

## Create Audiences

From the audiences tab, select the necessary conditions to create your segment (both custom and device properties), and save your segment. You can later on use this segment when sending a notification.
Another way to create an audience, is when selecting the Audience as a target in the send notification flow.


## Limits

- The maximum number of audiences that can be created per app is 5. If you would like to create more than 5 audiences (up to 200), select the "Advanced" option in your billing plan settings.
- There is a maximum of 60 properties that you can define per app.
- Limit of 1000 devices per audience

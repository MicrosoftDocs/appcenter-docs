---
title: App Center Push Audiences
description: Help using the Push Audiences on App Center
keywords: app center, push, audiences
author: blparr
ms.author: blparr
ms.date: 05/03/2018
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


App Center allows you to define custom properties as key value pairs in your app using the App Center SDK. You can then choose this property when you're creating an audience.

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

> [!NOTE]
> Only devices that have Push successfully registered are matched in audiences.

## Limitations

- The maximum number of Audiences for any App Center app project is 200.
- The default setting for new App Center accounts and accounts with **Basic campaigns** enabled in their billing plan allows for a maximum of 5 audiences per application project. To create more than 5 audiences (up to the maximum of 200), select the "Advanced" option in your billing plan's Push settings. Refer to [App Center Billing](~/general/billing.md) for information on how to change your App Center billing plan.
- App Center limits Audiences to a maximum of 1,000 devices regardless of your billing plan. If you create an audience targeting more than 1,000 devices, App Center Push sends notifications to the first 1,000 devices that match the audience criteria, and skip all remaining devices (failing silently).
- You can define a maximum of 60 custom properties per app project.
- Audiences match only devices that have a valid push registrations. For that reason, testing Audiences on an iOS simulator will fail.

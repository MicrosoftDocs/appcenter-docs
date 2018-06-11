---
title: Crash Consent 
description: How to handle user consent with crashes
keywords: GDPR, DSR, privacy, EU
author: blparr
ms.author: blparr
ms.date: 05/31/2018 
ms.topic: article 
ms.assetid: 26C66069-05D6-4EC2-84DD-AB86AF59EB97
ms.service: vs-appcenter
---

# Handling User Consent

## Ask for the Users' Consent To Send a Crash Log

If you want to get your users' confirmation before sending a crash report to App Center, the App Center SDK exposes a callback that instructs App Center Crashes to await confirmation from each user before sending any crash data to App Center.

You can read more about how to ask for the users' consent to send a crash log per platform:

- [Android](~/sdk/crashes/android#ask-for-the-users-consent-to-send-a-crash-log)
- [iOS](~/sdk/crashes/ios#ask-for-the-users-consent-to-send-a-crash-log)
- [macOS](~/sdk/crashes/macos#ask-for-the-users-consent-to-send-a-crash-log)
- [UWP](~/sdk/crashes/uwp#user-consent-to-send-a-crash-log)
- [React Native](~/sdk/crashes/react-native#ask-for-the-users-consent-to-send-a-crash-log)
- [Xamarin](~/sdk/crashes/xamarin#ask-for-the-users-consent-to-send-a-crash-log)

<!--
## Disable App Center Errors from Your App

If your customer has not opted in to sending a crash log, for example, either the app has not crashed for them or the user has disagreed to sending a crash log, you can use the following APIs to opt out of either the crash service or any of the App Center services that collects data from your users.

 You can disable all services at once. When disabled, the App Center SDK will not forward any information to App Center.
 - [Android](~/sdk/other-apis/Android#disable-all-services-at-runtime)
 - [iOS](~/sdk/other-apis/ios#disable-all-services-at-runtime)
 - [macOS](~/sdk/other-apis/macos#disable-all-services-at-runtime)
 - [UWP](~/sdk/other-apis/uwp#disable-all-services-at-runtime)
 - [React Native](~/sdk/other-apis/react-native#disable-all-services-at-runtime)
 - [Xamarin](~/sdk/other-apis/xamarin#disable-all-services-at-runtime)
 - [Cordova](~/sdk/other-apis/cordova#disable-all-services-at-runtime)
 
 You can disable only the Crashes service by using the App Center SDK. 
 - [Android](~/sdk/other-apis/Android#enable-or-disable-app-center-crashes-at-runtime)
 - [iOS](~/sdk/other-apis/ios#enable-or-disable-app-center-crashes-at-runtime)
 - [macOS](~/sdk/other-apis/macos#enable-or-disable-app-center-crashes-at-runtime)
 - [React Native](~/sdk/other-apis/react-native##enable-or-disable-app-center-crashes-at-runtime)
 - [Xamarin](~/sdk/other-apis/xamarin##enable-or-disable-app-center-crashes-at-runtime)
 - [Cordova](~/sdk/other-apis/cordova#disable-all-services-at-runtime#enable-or-disable-app-center-crashes-at-runtime)
-->
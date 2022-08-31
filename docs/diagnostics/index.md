---
title: App Center Diagnostics
description: Help using the Diagnostic service on App Center
keywords: app center, crashes, errors, diagnostics
author: lucen-ms
ms.author: lucen
ms.date: 12/16/2019
ms.topic: article
ms.assetid: f3cc2bc9-29a5-4b39-84fa-a82d6902ea6f
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Diagnostics

## Overview

App Center Diagnostics is a cloud service that helps developers monitor the health of an application, delivering the data needed to understand what happens when an app fails during testing or in the wild. The App Center Diagnostics SDK collects information about crashes and errors in your apps and uploads them to the App Center portal for analysis by the development team - eliminating the guesswork about what really happened in the app when it failed.

## Crashes

Crashes are what happens when a runtime exception occurs from an unexpected event that terminates the app. These are errors not handled by a try/catch block.  When a crash occurs, App Center Crashes records the state of the app and device and automatically generates a crash log. These logs contain valuable information to help you fix the crash.

## Errors

Experienced developers know where code can fail and wrap potentially risky code with error checking or try/catch blocks to handle problems as they occur. For [Android](../sdk/crashes/android.md), [Xamarin](../sdk/crashes/xamarin.md), [Unity](../sdk/crashes/unity.md), [UWP](../sdk/crashes/uwp.md), [WPF and WinForms](../sdk/crashes/wpf-winforms.md) apps, App Center Errors allow you to handle the errors in your app and avoid potential issues in your app. Learn more about best practices about when and how to use errors in the [official documentation for exceptions](/dotnet/csharp/programming-guide/exceptions/using-exceptions).

> [!NOTE]
> App Center Errors is only supported for Android, Xamarin, Unity, UWP, WPF and WinForms apps.

### Limits

- The maximum number of error properties per error is 20. When more than 20 properties are sent, the first 20 properties are processed, and the rest are automatically dropped by the SDK.
- The SDK truncates each property key and value to the first 125 characters.

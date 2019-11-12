---
title: App Center Diagnostics
description: Help using the Diagnostic service on App Center
keywords: app center, crashes, errors, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 11/12/2019
ms.topic: article
ms.assetid: b39854a6-c523-4a66-bef6-9b5da03ba256
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Diagnostics

## Overview

App Center Diagnostics is a cloud service that helps developers monitor the health of an application, delivering the data needed to understand what happens when an app fails during testing or in the wild. The App Center Diagnostics SDK collects information about crashes and errors in your apps and uploads them to the App Center portal for analysis by the development team - eliminating the guesswork about what really happened in the app when it failed.

## Crashes

Crashes are what happens when a runtime exception occurs from an unexpected event that terminates the app. These are errors not handled by a try/catch block.  When a crash occurs, App Center Crashes records the state of the app and device and automatically generates a crash log. These logs contain valuable information to help you fix the crash.

## Errors

Experienced developers know where code can fail and wrap potentially risky code with error checking or try/catch blocks to handle problems as they occur. For Android, Xamarin, Unity, UWP, WPF and WinForms apps. App Center Errors allow you to handle the errors in your app and avoid potential issues in your app. Learn more about best practices about when and how to use errors in the [official documentation for exceptions](https://docs.microsoft.com/dotnet/csharp/programming-guide/exceptions/using-exceptions).

> [!NOTE]
> App Center Errors is only supported for Android, Xamarin, Unity, UWP, WPF and WinForms apps.

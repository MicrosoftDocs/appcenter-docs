---
title: Limitations
description: Limitations with the Diagnostic Service in App Center
keywords: diagnostic, crashes
author: winnieli1208
ms.author: yuli1
ms.date: 11/08/2019
ms.topic: article
ms.assetid: e720dade-8d0c-44c6-8746-8b6a61da0f6f
ms.service: vs-appcenter
ms.custom: analytics
---

# Limitations

## Crashes

- You can only add one binary and one text attachment to a crash report.
- Android React Native source maps are not supported.

## Handled Errors

- Errors are only available for Android, Xamarin, Unity, UWP, WPF and WinForms platforms.
- Attachments are only available for Android, Xamarin, Unity, UWP, WPF and WinForms platforms.
- You can define a maximum of 20 properties per error, anything beyond that limit will be rejected.
- The maximum number of characters per error property key and error property value is 125 characters.

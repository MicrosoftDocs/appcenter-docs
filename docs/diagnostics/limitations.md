---
title: Limitations
description: Limitations with the Diagnostic Service in App Center
keywords: diagnostic, crashes
author: lucen-ms
ms.author: lucen
ms.date: 09/02/2026
ms.topic: concept-article
ms.assetid: e720dade-8d0c-44c6-8746-8b6a61da0f6f
ms.service: vs-appcenter
ms.custom: analytics
---

# Limitations

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

## Crashes

- Android React Native source maps aren't supported.
- App Center only accepts up to 60 crashes per minute per unique app. We won't ingest or process any crashes that exceed this limit.
- App Center only stores uploaded symbols for 180 days 

### Analytics-dependent data

The Analytics module isn't required to collect crash and error reports. The following Diagnostics data depends on Analytics:

- Affected-user percentages require session data collected by Analytics. Without that data, crashes and errors might appear to affect 100% of users.
- Events before a crash require custom events collected by Analytics.


## Handled Errors

- Errors are available for iOS, Android, Xamarin, Unity, UWP, WPF and WinForms platforms.
- Attachments are available for iOS, Android, Xamarin, Unity, UWP, WPF and WinForms platforms.
- You can define a maximum of 20 properties per error, anything beyond that limit will be rejected.
- The maximum number of characters per error property key and error property value is 125 characters.
- App Center only accepts up to 60 handled errors per minute per unique app. We won't ingest or process any errors that exceed this limit. 


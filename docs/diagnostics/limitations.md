---
title: Limitations
description: Limitations with the Diagnostic Service in App Center
keywords: diagnostic, crashes
author: lucen-ms
ms.author: lucen
ms.date: 12/19/2019
ms.topic: article
ms.assetid: e720dade-8d0c-44c6-8746-8b6a61da0f6f
ms.service: vs-appcenter
ms.custom: analytics
---

# Limitations

## Crashes

- Android React Native source maps aren't supported.
- App Center only accepts up to 60 crashes per minute per unique app. We won't ingest or process any crashes that exceed this limit.
- App Center only stores uploaded symbols for 180 days 


## Handled Errors

- Errors are only available for Android, Xamarin, Unity, UWP, WPF and WinForms platforms.
- Attachments are only available for Android, Xamarin, Unity, UWP, WPF and WinForms platforms.
- You can define a maximum of 20 properties per error, anything beyond that limit will be rejected.
- The maximum number of characters per error property key and error property value is 125 characters.
- App Center only accepts up to 60 handled errors per minute per unique app. We won't ingest or process any errors that exceed this limit. 



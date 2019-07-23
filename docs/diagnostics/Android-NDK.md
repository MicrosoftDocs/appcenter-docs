---
title: Android NDK
description: Learn how to symbolicate your Android NDK crash reports
keywords: crashes, Android, NDK, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 07/15/2019
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57
ms.service: vs-appcenter
ms.custom: analytics 
---

# Android NDK

Android NDK allows you to implement parts of your Android apps using C and C++. You can use the Google Breakpad client library for your Android apps to receive valid stack traces in native code. The stack traces may only contain memory addresses and don’t show class names, methods, file names, and line numbers needed to read and understand the crashes.

To get the memory addresses translated for your Android NDK app, you must upload symbols for each build using [Google's Breakpad tool](https://github.com/google/breakpad/blob/master/docs/getting_started_with_breakpad.md)

To learn how to report NDK crashes, refer to the [Android SDK documentation](~/sdk/crashes/android.md#reporting-ndk-crashes) or [Unity SDK documentation](~/sdk/crashes/unity.md#reporting-ndk-crashes) for reporting crashes on Unity android.

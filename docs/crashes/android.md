---
title: App Center Crash Reporting for Android
description: Reporting crashes from Android apps in App Center
keywords: crash reporting
author: anlinde
ms.author: anlinde
ms.date: 08/21/2017
ms.topic: article
ms.assetid: 38624f1c-15fe-4c9f-8b64-e22348e2dcbc
ms.service: vs-appcenter
ms.custom: crashes
ms.tgt_pltfrm: android
---

# Android Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [macOS](macos.md)

## Getting Started

1. Integrate the SDK as described in the [Getting Started with Android](~/sdk/getting-started/android.md) documentation.
2. Add a test crash to the apps code by calling the `Crashes.generateTestCrash()` method of the crash reporting module as an action to a button.
3. Run the app without the debugger connected, crash it, and then restart it.
4. After a few minutes the crash report should be visible in the App Center portal.

## Troubleshooting

1. *Why are crash reports not visible after a few minutes?*

    Make sure the app doesn't crash on startup, as the SDK wouldn't have time to send the crash report. This is a limitation for any 3rd party crash reporting service which is not possible to overcome.

2. *How can I see de-obfuscated stack traces?*

    This is currently not supported but on our roadmap.

3. *Do you have an Android NDK?*

    This is currently not available but on our roadmap.

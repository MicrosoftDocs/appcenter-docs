---
title: App Center Crash Reporting for iOS
description: Reporting crashes from iOS apps in App Center
keywords: crash reporting
author: anlinde
ms.author: anlinde
ms.date: 08/21/2017
ms.topic: article
ms.assetid: 76a80967-b68e-4ca7-ad89-65a557682108
ms.service: vs-appcenter
ms.custom: crashes
ms.tgt_pltfrm: ios
---

# iOS Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [macOS](macos.md)

## Getting Started

1. Integrate the SDK as described in the [Getting Started with iOS](~/sdk/getting-started/ios.md) documentation.
2. Go to [App Center](https://appcenter.ms/apps) and select your app.
3. Navigate to the **Diagnostics** section from the left menu, then navigate to **Symbols** under this section.
4. Click **Upload symbols** in the top right corner and upload the symbols.
5. Add a test crash to the app's code by calling the `Crashes.generateTestCrash()` method of the crash reporting module as an action to a button.
6. Run the app without the debugger connected, crash it, and then restart it.
7. After a few minutes the crash report should be visible in the App Center portal.

## Uploading symbols

1. Create a ZIP file for the dSYM package on your Mac.
2. Go to [App Center](https://appcenter.ms/apps) and select your app.
3. Navigate to the **Diagnostics** section from the left menu, then navigate to **Symbols** under this section.
4. Click **Upload symbols** in the top right corner and upload the zip file.
5. After the zip file is indexed by App Center new incoming crashes will be symbolicated.

## Troubleshooting

1. *Why are crash reports not visible after a few minutes?*

    Right now crash reports are only visible if they can be symbolicated. For that to happen the proper symbols (dSYM) need to be uploaded. There will be a UI available later that shows which symbols are missing and how to find them.

2. *What could be another reason for the crash report to not appear?*

    Make sure the app doesn't crash on startup, as the SDK wouldn't have time to send the crash report. This is a limitation for any 3rd party crash reporting service.

3. *The symbols are uploaded but the previous crash reports are not appearing.*

    As of now only new incoming crashes will be symbolicated. Processing pending crashes is on our roadmap.

---
title: App Center Crash Reporting
description: Reporting crashes in App Center
keywords: crash reporting
author: anlinde
ms.author: anlinde
ms.date: 04/30/2018
ms.topic: article
ms.assetid: 9006c330-eafc-4a8e-a27e-c57437ef9e81
ms.service: vs-appcenter
ms.custom: crashes
---

# Crashes

App Center Crash Reporting lets developers collect crashes in their apps whether they occur in testing or in production.

## Key Features

Crashes are grouped together by similarities like the reason for the crash and where the occur in the app. It is possible to inspect each individual crash report for the last 3 months, after that a stub of 25 crashes will be kept.

## Getting Started

To leverage this feature it is required to integrate the App Center SDK and its crash reporting module into the app. As the SDK runs in the same process as the app, the crash report will be sent the next time the app starts.

[Get Started on Android](~/crashes/android.md)

[Get Started on iOS](~/crashes/ios.md)

[Get Started with React Native](~/crashes/react-native.md)

[Get Started on macOS](~/crashes/macos.md)

---
title: Troubleshooting
description: Help troubleshooting Diagnostics in App Center
keywords: crashes, errors, troubleshooting, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 11/11/2019
ms.topic: article
ms.assetid: 601a597e-37e5-4714-bdf5-fff29373cae5
ms.service: vs-appcenter
ms.custom: analytics
---

# Troubleshooting

**Why are crash reports not visible after a few minutes?**

If your app crashes on startup, the SDK won't be able to send any crash reports. This limitation applies to any 3rd party crash reporting service.

For Breakpad, iOS, MacOS, and UWP apps, crash reports are only visible if they are symbolicated (or if you mark the required symbols as ignored). For that to happen, the proper symbols must be uploaded to App Center. Learn more about symbolication and how to find and upload your symbols in the [Breakpad documentation](~/diagnostics/Android-NDK.md), [iOS and macOS symbolication documentation](~/diagnostics/iOS-symbolication.md), or [UWP documentation](~/diagnostics/windows-support.md#symbolication).

**How can I see deobfuscated stack traces?**

To see deobfuscated stack traces for ProGuard enabled Android apps, follow the instructions in [App Center's ProGuard documentation](~/diagnostics/Android-ProGuard.md) to upload mapping files for your app.

**How does App Center parse your .zip file?**

App Center first looks for `dsym` directories at any level, then it looks for a source map by the title of `index.ios.map`. If `index.ios.map` file does not exist, it uses the first `.map` it finds.

**I know I updated my symbols for the right executable of my app in the store, but the crash reports are still unreadable.**

This is probably due to the fact that App Center Crash Reporting doesn't support **bitcode** yet. Look at the doc on [how to disable bitcode](~/diagnostics/iOS-symbolication.md#bitcode) to learn more and fix that issue.

**Why are all of my errors/crashes showing as affecting 100% of my users?**

This is usually caused by enabling the App Center crashes module without also enabling the analytics module. The analytics module keeps track of user sessions and without that data App Center can't determine how many overall users there are for the application.

**What are the time period limitations to send a log to App Center?**

The App Center backend will only accept logs that are no more than 25 days in the past or 3 days in the future.

**Why are my crash counts different on App Center compared to HockeyApp?**

HockeyApp lists crashes as they are ingested, whereas App Center uses the device timestamp. This means that HockeyApp might show your app as receiving 10 crashes today, but App Center might list those 10 crashes as happening on different days based on the device timestamp.

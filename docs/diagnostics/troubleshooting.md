---
title: Troubleshooting
description: Help troubleshooting Diagnostics in App Center
keywords: crashes, errors, troubleshooting, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 10/12/2018
ms.topic: article
ms.assetid: 601a597e-37e5-4714-bdf5-fff29373cae5
ms.service: vs-appcenter
ms.custom: analytics 
---

# Troubleshooting

**Why are crash reports not visible after a few minutes?**

If your app crashes on startup, the SDK won't be able to send any crash reports. This limitation applies to any 3rd party crash reporting service.

For iOS and MacOS apps, crash reports are only visible if they are symbolicated. For that to happen the proper symbols (dSYM file) must be uploaded to App Center. Learn more about symbolication and how to find and upload your .dSYM file in the [symbolication documentation](~/diagnostics/iOS-symbolication.md). Currently, only new incoming crashes are symbolicated.  

**How can I see deobfuscated stack traces?**

To see deobfuscated stack traces for ProGuard enabled Android apps, follow the instructions in [App Center's ProGuard documentation](~/diagnostics/Android-ProGuard.md) to upload mapping files for your app. 

**How does App Center parse your .zip file?**

App Center first looks for `dsym` directories at any level, then it looks for a source map by the title of `index.ios.map`. If `index.ios.map` file does not exist, it uses the first `.map` it finds.

**I know I updated my symbols for the right executable of my app in the store, but the crash reports are still garbage.**

This is probably due to the fact that App Center Crash Reporting doesn't support **bitcode** yet. Look at the doc on [how to disable bitcode](~/diagnostics/iOS-symbolication.md#bitcode) to learn more and fix that issue.

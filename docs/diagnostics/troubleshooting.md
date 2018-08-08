---
title: Troubleshooting
description: Help troubleshooting Diagnostics in App Center
keywords: crashes, errors, troubleshooting, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 08/08/2018
ms.topic: article
ms.assetid: 601a597e-37e5-4714-bdf5-fff29373cae5
ms.service: vs-appcenter
ms.custom: analytics 
---

# Troubleshooting

*Why are crash reports not visible after a few minutes?*

If your app crashes on startup, the SDK won't be able to send any crash reports. This limitation applies to any 3rd party crash reporting service.

For iOS and MacOS apps, crash reports are only visible if they are symbolicated. For that to happen the proper symbols (dSYM file) must be uploaded to App Center. Learn more about symbolication and how to find and upload your .dSYM file in the [symbolication documentation](~/diagnostics/symbolication.md). Currently, only new incoming crashes are symbolicated.  

*How can I see de-obfuscated stack traces?*

We have some known issues with mappings upload. If you run into issues, please contact [App Center support](https://intercom.help/appcenter/getting-started/getting-help-with-app-center) by clicking the blue chat button in the lower-right corner of any App Center page.

*Is there support for Android NDK?*

We have some known issues with Android NDK. If you run into issues, please contact [App Center support](https://intercom.help/appcenter/getting-started/getting-help-with-app-center) by clicking the blue chat button in the lower-right corner of any App Center page.

*How does App Center parse your .zip file?*

App Center first looks for `dsym` directories at any level, then it looks for a source map by the title of `index.ios.map`. If `index.ios.map` file does not exist, it uses the first `.map` it finds.

*I know I updated my symbols for the right executable of my app in the store, but the crash reports are still garbage.*

This is probably due to the fact that App Center Crash Reporting doesn't support **bitcode** yet. Look at the doc on [how to disable bitcode](~/diagnostics/symbolication#bitcode) to learn more and fix that issue.

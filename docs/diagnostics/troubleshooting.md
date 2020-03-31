---
title: Troubleshooting
description: Help troubleshooting Diagnostics in App Center
keywords: crashes, errors, troubleshooting, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 03/31/2020
ms.topic: article
ms.assetid: 601a597e-37e5-4714-bdf5-fff29373cae5
ms.service: vs-appcenter
ms.custom: analytics
---

# Troubleshooting

### Why aren't crash reports visible after a few minutes?
If your app crashes on startup, the SDK can't send any crash reports. This limitation applies to any third-party crash reporting service.

For Breakpad, iOS, macOS, and UWP apps; crash reports are only visible if they're symbolicated or if you mark the required symbols as ignored. For that to happen, the proper symbols must be uploaded to App Center. Learn more about symbolication and how to find and upload your symbols in the following guides:

- [Breakpad documentation](~/diagnostics/Android-NDK.md)
- [iOS and macOS symbolication documentation](~/diagnostics/iOS-symbolication.md)
- [UWP documentation](~/diagnostics/windows-support.md#symbolication).

### How can I see deobfuscated stack traces?
To see deobfuscated stack traces for ProGuard enabled Android apps, follow the instructions in [App Center's ProGuard documentation](~/diagnostics/Android-ProGuard.md) to upload mapping files for your app.

### How does App Center parse your .zip file?
App Center first looks for `dsym` directories at any level, then it looks for a source map by the title of `index.ios.map`. If `index.ios.map` file does't exist, App Center uses the first `.map` it finds.

### I updated my symbols for the correct executable of my app in the store, but the crash reports are still unreadable.
App Center Crash Reporting doesn't support **bitcode** yet. See the guide on [how to disable bitcode](~/diagnostics/iOS-symbolication.md#bitcode) to learn more and fix that issue.

### Why are all of my errors/crashes shown as affecting 100% of my users?
This is usually caused by enabling the App Center crashes module without also enabling the analytics module. The analytics module tracks user sessions and App Center requires that data to determine how many overall users there are for the application.

### What's the time limit to send a log to App Center?
The App Center backend will only accept logs that are no more than 25 days in the past or 3 days in the future.

### The numbers in the `affected users` charts are wrong
The affected users for error groups are calculated as: `Total number of affected users / Total number of devices` over the respective time frame (i.e. last 30 days).
This means that the total value can be higher than any or the average of any daily value. Here's an example:

1. Your app had a total of three active users A, B, C.
2. In the last 30 days, A, B, and C were active every day:
   - On day 1, user A experienced a crash. 
   - On day 2, user B experienced a crash. 
   - On day 3, user C experienced a crash.
3. The local maximums on days 1, 2, 3 are 33.3% respectively; because each day, one out of three users experienced a crash.
4. The total maximum is 100% since in the surveyed time frame, since all of your users experienced a crash at some time.

There are other factors that might contribute, such as different users hitting different issues; thus only being reported in specific crash or error groups.

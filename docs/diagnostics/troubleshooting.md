---
title: Troubleshooting
description: Help troubleshooting Diagnostics in App Center
keywords: crashes, errors, troubleshooting, diagnostics
author: winnieli1208
ms.author: yuli1
ms.date: 02/18/2020
ms.topic: article
ms.assetid: 601a597e-37e5-4714-bdf5-fff29373cae5
ms.service: vs-appcenter
ms.custom: analytics
---

# Troubleshooting

### Why are crash reports not visible after a few minutes?
If your app crashes on startup, the SDK won't be able to send any crash reports. This limitation applies to any third party crash reporting service.

For Breakpad, iOS, macOS, and UWP apps, crash reports are only visible if they are symbolicated (or if you mark the required symbols as ignored). For that to happen, the proper symbols must be uploaded to App Center. Learn more about symbolication and how to find and upload your symbols in the following guides:

- [Breakpad documentation](~/diagnostics/Android-NDK.md)
- [iOS and macOS symbolication documentation](~/diagnostics/iOS-symbolication.md)
- [UWP documentation](~/diagnostics/windows-support.md#symbolication).

### How can I see deobfuscated stack traces?
To see deobfuscated stack traces for ProGuard enabled Android apps, follow the instructions in [App Center's ProGuard documentation](~/diagnostics/Android-ProGuard.md) to upload mapping files for your app.

### How does App Center parse your .zip file?
App Center first looks for `dsym` directories at any level, then it looks for a source map by the title of `index.ios.map`. If `index.ios.map` file does not exist, it uses the first `.map` it finds.

### I know I updated my symbols for the right executable of my app in the store, but the crash reports are still unreadable.
This is because App Center Crash Reporting doesn't support **bitcode** yet. See the guide on [how to disable bitcode](~/diagnostics/iOS-symbolication.md#bitcode) to learn more and fix that issue.

### Why are all of my errors/crashes showing as affecting 100% of my users?
This is usually caused by enabling the App Center crashes module without also enabling the analytics module. The analytics module keeps track of user sessions and without that data App Center can't determine how many overall users there are for the application.

### What are the time period limitations to send a log to App Center?
The App Center backend will only accept logs that are no more than 25 days in the past or 3 days in the future.

### The numbers in the affected users charts look off
The affected users for a error group are calculated as: `Total number of affected users / Total number of devices` over the respective time frame (i.e. last 30 days).
This means that the total value can be higher than any or the average of any daily value. Here's a simple example:

1. Your app had a total of three active users A, B, C.
1. In the last 30 days, A, B, and C were active every day.
1. On day 1 user A experienced a crash. On day 2 user B experienced a crash. On day 3 user C experienced a crash.
1. The local maximums on days 1, 2, 3 are 33.3% respectively (since each day, one out of three users experienced a crash).
1. The total maximum is 100% since in the surveyed time frame, since all of your users experienced a crash at some time.
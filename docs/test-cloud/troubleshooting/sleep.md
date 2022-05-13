---
title: Device sleep during testing
description: Learn about device sleep time limits. See how to overcome these limits so Android and iOS devices can stay active during testing.
keywords: appcenter, test, sleep, device, timeout
author: lucen-ms
ms.author: lucen
ms.date: 05/11/2022
ms.topic: troubleshooting
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
ms.service: vs-appcenter
---

# Device sleep during testing

In App Center Test, devices automatically sleep if they don't receive a user interaction periodically. Long pauses between user interactions can cause test failures when devices go to sleep.

Android devices sleep after no interaction for 10 minutes. iOS devices sleep after no interaction for 5 minutes. App Center Test uses these limits because they're usually the maximum sleep limits available on each platform, without having devices stay on indefinitely. Indefinite operations can cause other problems in the device cloud.

If your testing scenario requires delays that exceed the device sleep time limits, try the following options:

- Add one or more user interaction gestures during the wait to prevent the device from sleeping.
- Mock or simulate the wait, instead of waiting for it to complete normally.

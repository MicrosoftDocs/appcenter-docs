---
title: Device sleep during testing
description: Learn how to overcome sleep time limits so Android and iOS devices can remain active during testing.
keywords: appcenter, test, sleep, device, timeout
author: lucen-ms
ms.author: lucen
ms.date: 04/19/2022
ms.topic: troubleshooting
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
ms.service: vs-appcenter
---

# Device sleep during testing in App Center Test

In App Center Test, devices automatically sleep if they don't receive a user interaction periodically. Long pauses between user interactions can cause test failures when devices sleep.

Android devices sleep after no interaction for 10 minutes. iOS devices sleep after no interaction for five minutes. App Center Test uses these limits because they're usually the maximum sleep limits available on each platform, without having devices on indefinitely. Indefinite operations can cause other problems in the device cloud.

If your testing scenario requires delays that exceed the preceding limits, you can try a couple of options:

- Add one or more user interaction gestures during the wait to prevent the device from sleeping.
- Mock or simulate the wait, rather than waiting for the full execution to complete normally.

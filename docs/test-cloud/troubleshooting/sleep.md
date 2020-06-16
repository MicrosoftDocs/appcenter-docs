---
title: Sleep time during testing for devices in App Center Test
description: Time limits for Android & iOS devices to remain active
keywords: appcenter, test, sleep, device, timeout
author: king-of-spades
ms.date: 06/15/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Sleep time during testing for devices in App Center Test
In App Center Test, devices will automatically sleep if they do not receive a UI interaction every so often. 

This means waiting very long times between UI interactions can sometimes cause test failures. 

The limits are as follows:

- Android - 10 minutes
- iOS - 5 minutes

These limits are used because they are generally the maximum sleep limits available on each platform without leaving devices on indefinitely. 

Indefinite operation this way could cause other problems in our device cloud.

## Alternative Approaches
If your testing scenario requires delays near to or exceeding the above limits, then there are a couple general options to workaround:

You can add one or more UI gestures during the wait time to prevent the device from sleeping. 
You could mock or simulate the wait time in some fashion for your test, rather than waiting for the full execution to complete normally. 
---
title: Stalled devices in test runs
description: Learn about and get help for stalled devices caused by App Center Test infrastructure issues during test runs.
keywords: appcenter, test, stall
author: lucen-ms
ms.author: lucen
ms.date: 04/19/2022
ms.topic: troubleshooting
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
ms.service: vs-appcenter
---

# Stalled devices in test runs

A `Stalled Error` is an error that prevents App Center Test from completing your tests on one or more devices. The error is usually caused by an App Center Test infrastructure problem, not a problem in your app or device.

When App Center Test detects a stalled error, operations staff attempt to make corrections and get the stalled run to complete normally. This manual intervention takes some time, and includes longterm corrections to try to prevent the issue from reoccurring.

Devices that stall don't count against your available device concurrency or testing time. Device stalls don't interfere with any other devices or prevent other test runs from completing.

To get support for device stalls, in the upper right-hand corner of App Center, select the question mark **?**, and then select **Contact support**.

If possible, check for and provide the following information:

- Can you consistently reproduce the stall, or is it unpredictable? 
- Provide a link to the test run that has the stall. If the app sometimes completes tests without stalling, also send a link to a completed test run.
- Confirm that the app you're uploading is compatible for all of the devices and OS versions you're targeting.
- Check if your test framework and build setup have updates for any of the device models or OS versions you're targeting.
- In some cases, you can work around an issue. Let Support know if you find a consistent workaround for the stalling on your own. The Support team can use your feedback to try to improve error handling in tests.

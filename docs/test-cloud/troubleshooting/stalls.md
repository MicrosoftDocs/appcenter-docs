---
title: Stalled device during a test run
description: Learn about stalled device errors caused by App Center Test infrastructure issues, and how to get help for stalled device test runs.
keywords: appcenter, test, stall
author: lucen-ms
ms.author: lucen
ms.date: 04/20/2022
ms.topic: troubleshooting
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
ms.service: vs-appcenter
---

# Stalled device during a test run in App Center Test

A `Stalled Error` is an error that prevents App Center Test from completing tests on one or more devices. Usually, this error is caused by an App Center Test infrastructure problem, not by a problem in your app or device.

When App Center Test detects a stalled error, operations staff attempt to make corrections and get the stalled run to complete normally. This manual intervention takes some time, and includes long term corrections to try to prevent the issue from recurring.

Devices that stall don't count against your available device concurrency or testing time. Device stalls don't interfere with any other devices or prevent other test runs from completing.

To get support for device stalls, in the upper right-hand corner of App Center, select Help (**?**), and then select **Contact support** to file a support request.

If possible, check for and provide the following information in the form:

- Can you consistently reproduce the stall, or is it unpredictable?
- Provide a link to a test run that has the stall. If the app sometimes completes tests without stalling, also send a link to a completed test run.
- Confirm that the app you're uploading is compatible for all the devices and OS versions you're targeting.
- Check whether your test framework and build setup have any updates for the targeted device models or OS versions.
- In some cases, you can work around an issue. Let the Support team know if you find a consistent workaround for the stalling. The team can use your feedback to try to improve error handling in tests.
---
title: Stalled Devices in Test Runs
description: Possible causes and getting assistance
keywords: appcenter, test, stall
author: king-of-spades
ms.author: kegr
ms.date: 07/28/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Stalled Devices in Test Runs
When we display a `Stalled Error`, it means we've detected an error that prevented us from completing your tests on one or more devices, and is usually caused by a problem in our test infrastructure. So, by definition we believe it's a problem on our side, not yours. That process isn't perfect and there are some cases where you can do something to workaround an issue.

When we detect a stalled error, our operations staff will attempt to make corrections and get the stalled run to complete normally. This manual intervention will take some time. As we do this we make long-term corrections to prevent it from occurring again, if possible.

Devices that stall don't count against your available device concurrency or testing time; so they shouldn't impair any other devices or test runs from completing.

## Getting support when your tests stall
In the upper right-hand corner of App Center, select: **? > Contact Support**. 

if possible check for & provide the information detailed below: 

- Can you consistently reproduce the stall, or is it unpredictable? 
- Provide a link to the test run with the stall. Also, if the app sometimes completes tests without stalling, send a link to that test run as well.
- Try to confirm that the app you're uploading is compatible for all of the devices & OS versions you're targeting. 
- Check if your test framework and build setup has any updates related to some of the device models or OS versions you're targeting. 
- If you find a consistent workaround for the stalling on your own, let our support team know. We can use your feedback to try to improve future error handling in tests.
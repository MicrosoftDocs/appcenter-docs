---
title: Stalled Devices in Test Runs
description: Possible causes and getting assistance
keywords: appcenter, test, stall
author: king-of-spades
ms.date: 06/15/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Stalled Devices in Test Runs
When we display a "Stalled Error" it means we have detected an error that prevented us from completing your test run on one or more devices and that we believe is caused by a problem with our test infrastructure. So, by definition we believe it is a problem on our side, not yours. That process is not perfect and there are some grey areas where you can do something to workaround an issue.

When we detect a stalled error our operations staff will attempt to make corrections and get the stalled run to complete normally. This manual intervention will take some time. As we do this we make long term corrections to prevent it from occurring again when we can.

Devices which stall do not count against your available device concurrency or testing time; so they should not impair any other devices or test runs from completing.

# Getting support when you encounter a stall
In the upper right-hand corner of App Center, click **? > Contact Support**. 

if possible check for & provide the information detailed below: 

- Can you consistently reproduce the stall, or is it unpredictable? 
- Provide a link to the test run with the stall. Also, if the app sometimes completes tests without stalling, please send a link to that test run as well.
- Try to confirm that the app you are uploading is compatible for all of the devices & OS versions you are targeting. 
- Check if your test framework and build setup has any updates related to some of the device models or OS versions you're targeting. 
- If you find a consistent workaround for the stalling on your own, let our support team know. We can use your feedback to try and improve future error handling in tests.
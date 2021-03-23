---
title: Handling Concurrent Database Changes During Tests
description: Approaches to executing tests on multiple devices at the same time that are making changes to the same database.
keywords: appcenter, test, database
author: lucen-ms
ms.author: lucen
ms.date: 07/29/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Handling Concurrent Database Changes During Tests
During a test, the test script often needs to change external data and test against those changes. This process generally includes some way of setting the data back to a known or pristine state so the tests are written against a known initial state. It may involve a test database and credentials for a test user. 

This is a common scenario and works great when running a single test on one device at a time. But, when using App Center Test to execute on multiple devices at the same time, the multiple simultaneous tests can cause conflicting changes in the test database. How can you get around this? 

Here are a few approaches that others have used, roughly in order of increasing complexity and power:

1. Only run one test at a time.
2. Don't modify common data or don't rely on data that may be changed in your tests.
3. Mock the data in your tests.
4. Create multiple test users with unique credentials. Then use the device index (see below) to get a unique identifier for that device within that test run. You can use that value to look up user credentials so that concurrent devices within the same test run are logged in as different users. This approach won't work for multiple test runs executing at the same time; it's designed only for multiple devices within a test run.
6. Create a web service external to your tests that they can access at run time to checkout a unique set of credentials. This may be the most complex solution, but it's also the most general.
    
For number 4 above, App Center Test has an [environment variable](~/test-cloud/environment-variables.md) XTC_DEVICE_INDEX that can be accessed by the test script. This is a string in the range of 0 to N-1, where N is the number of devices the test is run on. This variable is useful in situations where the same test is being run in parallel on multiple devices. This environment variable is available only for Calabash, Appium, and Xamarin.UITest and only to the test script. It's not available to the application under test.
---
title: Handling Concurrent Database Changes During Tests
description: Approaches to executing tests on multiple devices at the same time that are making changes to the same database.
keywords: appcenter, test, stall
author: king-of-spades
ms.date: 06/15/2020
ms.topic: article
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Handling Concurrent Database Changes During Tests
During a test, the test script often needs to change external data and test against those changes. This generally includes some way of setting the data back to a known or pristine state so the tests are written against a known initial state. This may involve a test database and credentials for a test user. 

This is a common scenario and works great when running a single test on one device at a time. But, when leveraging the power of App Center Test to execute on multiple devices at the same time, the multiple simultaneous tests can cause conflicting changes in the test database. How can you get around this? 

Here are a few approaches that others have used, roughly in order of increasing complexity and power:

1. Only run one test at a time.
2. Don't modify common data or don't rely on data that may be changed in your tests.
3. Mock the data in your tests.
4. Create multiple test users with unique credentials. Then use the the device index (see below) to get a unique identifier for that device within that test run and use that value to lookup a corresponding set of user credentials so that concurrent devices within the same test run will be logged in as different users.  Note that this approach will not work for multiple test runs executing at the same time; it is designed only for multiple devices within a test run.
5. Create a web service external to your tests that your tests can access at run time to check out a unique set of test credentials. This may be the most complex solution but also the most general.
    
For number 4 above, App Center Test has an [environment variable](~/test-cloud/environment-variables.md) XTC_DEVICE_INDEX that can be accessed by the test script. This is a string in the range of 0 to N-1, where N is the number of devices the test is run on. This variable is useful in situations where the same test is being run in parallel on multiple devices. This environment variable is available only for Calabash, Appium and Xamarin.UITest and only to the test script; not to the application under test.
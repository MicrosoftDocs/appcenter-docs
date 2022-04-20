---
title: Handle Concurrent Database Changes During Tests
description: Execute tests on multiple devices that make changes to the same database at the same time.
keywords: appcenter, test, database
author: lucen-ms
ms.author: lucen
ms.date: 04/19/2022
ms.topic: troubleshooting
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Conflicting database changes during tests

Test scripts often change external data and test against the changes. The process usually includes setting the data back to a known or pristine state, so tests can be written against a known initial state. The process might use a test database with credentials for a test user.

This common scenario works well for a single test on one device at a time. If you test on multiple devices at the same time, the tests can cause conflicting changes in the test database.

To avoid this problem, you can use the following approaches, in roughly increasing order of complexity and power:

1. Only run one test at a time.
1. Don't modify common data, or don't rely on data that your tests might change.
1. Mock the data in your tests.
1. Create multiple test users with unique credentials, so concurrent devices log in as different users. Use a device index to get a unique identifier for each device within a test run, and use the identifier to look up user credentials. This approach works only for multiple devices within the same test run, not across multiple concurrent test runs.

   App Center Test test scripts in Calabash, Appium, and Xamarin.UITest can access the `XTC_DEVICE_INDEX` [environment variable](../test-cloud/environment-variables.md). The variable is a string with range `0` to `N-1`, where `N` is the number of devices the test runs on. Use this variable when running a test in parallel on multiple devices. The variable is available only to the test script, not to the application under test.

1. Create an external web service that tests can access at run time to check out a unique set of credentials. This solution might be the most complex, but is also the most general.


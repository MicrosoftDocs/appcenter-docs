---
title: Concurrent test database changes
description: Avoid problems caused when multiple devices make concurrent changes to the same test database during tests.
keywords: appcenter, test, database
author: lucen-ms
ms.author: lucen
ms.date: 05/11/2022
ms.topic: troubleshooting
ms.assetid: 5d0e7355-117d-40cb-a578-1de1aaf989d4 
---

# Concurrent test database changes
[!INCLUDE [Retirement announcement for App Center](../../includes/retirement.md)]

Test scripts often change external data and test against the changes. The process usually includes setting the data back to the known or initial state that the tests were written against. This process might use a test database with credentials for the test user.

This common scenario works well for a single test on one device at a time. If you test on multiple devices at the same time, the tests can cause conflicting changes in the test database.

To avoid conflicting database changes, you can use the following approaches, in roughly increasing order of complexity and power:

1. Only run one test at a time.
1. Don't modify common data, or don't rely on data that your tests might change.
1. Mock the data in your tests.
1. Create multiple test users with unique credentials, so concurrent devices sign in as different users. Use a device index to get a unique identifier for each device within a test run, and use the identifier to look up user credentials. This approach works only for multiple devices within the same test run, not across multiple concurrent test runs.

   App Center Test test scripts in Calabash, Appium, and Xamarin.UITest can access the `XTC_DEVICE_INDEX` [environment variable](../environment-variables.md). The variable is a string with range `0` to `N-1`, where `N` is the number of devices the test runs on. You can use this variable to look up credentials when you run a test in parallel on multiple devices. The variable is available only to the test script, not to the application under test.

1. Create an external web service that tests can access at run time to get a unique set of credentials. This solution is the most complex, but is also the most general.


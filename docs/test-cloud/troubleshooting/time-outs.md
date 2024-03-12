---
title: Test time limits and timeouts
description: Diagnose the reasons for timeouts in App Center Test individual tests and test suites.
keywords: test cloud, time out, limits
author: lucen-ms
ms.author: lucen
ms.date: 05/11/2022
ms.topic: troubleshooting
ms.assetid: fcbd21e6-fc3c-4de1-8789-62be066d4ae6
ms.service: vs-appcenter
ms.custom: test
---

# Test time limits and timeouts
[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

App Center Test enforces test duration limits per device for individual tests and for test suites. To prevent tests from running indefinitely, App Center Test stops a test or test suite that exceeds the time limit.

App Center Test enforces time limits independently for each device. Exceeding a limit on one device doesn't affect the tests on other devices.

Time limits apply only to the time spent installing the app and running the tests. Time spent queued to run a test or processing completed test results doesn't count against the time limits.

Tests might take more time to run in App Center Test than locally because of network latency and added time for taking screenshots. Emulators and simulators aren't accurate for time comparison, because App Center Test only uses actual devices.

## Individual test time limits

The time limit for an individual test is 30 minutes. When a test reaches that time limit, App Center Test halts the test and writes the following message to the test log for the last executed step:

```text
test exceeded 1800000ms
```

### Troubleshoot timed-out individual tests

App Center Test generates and displays a test report for timed-out individual tests, unless there are other issues. You can use the test report and related log files to help understand why the test exceeded the time limits. For more information, see [Test reports](../test-reports.md).

An individual test might exceed the time limit because of:

- A bug, like a loop that never finishes.
- Issues only on certain devices or in some circumstances. Add defensive test code to handle this case and prevent tests from timing out.
- Too many long-running steps. The solution is to break up the test into multiple smaller and faster tests.

## Test suite time limits

The test suite time limit per device is six hours if you're using a paid App Center Test plan, or one and one-half hours on a free plan. When a test suite reaches the time limit, App Center Test stops the test suite and doesn't produce a test report for the timed-out device.

If all devices exceed the test suite time limit, App Center Test doesn't produce any test report, and displays the following message:

```text
Test execution timed out.
```

### Troubleshoot timed-out test suites

Timed-out test suites could be caused by an issue with test code or because the test suite is too large to complete within the time limit. Because a timed-out test suite doesn't produce a test report, it's hard to determine the timeout cause. Try running fewer tests per test suite, so you can get a test report and log files to see what's happening.

If the test suite sometimes completes successfully, check the test time in the [test report](../test-reports.md) for the completed test suite. If the time is close to the timeout limit, small variations in execution time could cause the suite to time out. Running fewer tests in the test suite can help get consistent test results.

The **Duration** in the test report is the combined duration of all devices in the test, including devices that didn't time out. If you don't know which devices hit the test suite time limit, you can contact App Center Support. Include a link to the test run, and they can look at internal data for the run.

## Get help

You can contact support in the App Center portal. In the upper right corner of the screen, select Help (**?**), and then select **Contact support** to submit a support request.

To get help with a test run, go to the test run, copy the URL from your browser, and paste the URL into the support conversation. A test run URL looks something like `https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747`.

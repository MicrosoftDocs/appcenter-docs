---
title: Time limits
description: Diagnosing timeouts in App Center Test
keywords: test cloud, time out, limits
author: glennwilson
ms.author: v-glenw
ms.date: 02/27/2019
ms.topic: article
ms.assetid: fcbd21e6-fc3c-4de1-8789-62be066d4ae6
ms.service: vs-appcenter
ms.custom: test
---

# Time limits

App Center Test enforces time limits per device on test suites and on individual tests. App Center Test stops a test or test suite that exceeds the limit, to prevent tests from trying to run forever.

> [!NOTE]
> These limits apply to the time spent installing your app and running your tests. Time that a device is queued for running or processing completed test results do not count against these limits.

App Center Test enforces time limits for test suites and individual tests independently for each device. Exceeding a limit on one device does not impact other devices.

## Test suite time limit

The test suite time limit is six hours if you're using a paid App Center Test plan. The limit is one and one-half hours using a free plan. When a test suite reaches the time limit, App Center Test stops the test suite and no test report is produced for that device.

## Individual test time limit

The time limit for an individual test is 30 minutes. When a test reaches the time limit, App Center Test halts the test and a message is written to the test log. App Center Test still generates and displays a test report. That test report and related log files are useful to understand why the test exceeded the time limits.

For a timed-out test, the *Test Log* contains an error for the last executed step:

```text
test exceeded 1800000ms
```

## Troubleshooting

Use the *Test Report* and log files, to help determine why a test or test suite timed-out. For more information, see [Test Reports](~/test-cloud/test-reports.md).

When an individual test exceeds the time limit, App Center Test still produces and displays a test report if there are no other issues.

If a test suite exceeds the time limit, App Center Test does not produce a test report for the timed-out devices. When all devices exceed the test suite time limit, then App Center Test does not produce a test report and instead displays:

```text
Test execution timed out.
```

### Troubleshooting timed-out individual tests

A test might exceed the limit because of a bug, like a loop that never finishes. The time-out might happen only on certain devices or in some circumstances. Adding defensive test code handles this case and prevents tests from timing out.

It could be because the test has too many long-running steps. The solution here is to break up the test into multiple smaller and faster tests.

### Troubleshooting timed-out test suites

This error could be caused by an issue with test code or perhaps your test suite is too large to complete within the time limit. Without a test report, it's hard to determine the cause. Try running fewer tests per test suite. The goal is to get a test report and associated log files so you can see what is happening.

If the test suite completes successfully, sometimes but not always, check the test time using the [Test Reports](~/test-cloud/test-reports.md) for the completed tests. If it's close to the timeout limits, then small variances in execution time could make the difference between completion or timing out. Again, running fewer tests in a test suite can help get test results consistently.

> [!NOTE]
> Tests may need additional time to execute in App Center Test compared to running locally due to network latency or additional time for screenshots. Emulators and simulators are not accurate for time comparison since App Center Test only uses real devices. The **Duration** from the *Test Report* is for the combined duration of all devices in the test, even those which did not time out.

If you don't know which devices hit the test suite time limit, you can contact App Center Support. Include a link to the test run and they can look at internal data for the run.

## Getting help

You can always contact us through [the blue chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). We don't provide 24/7 support, but will reply as soon as we can.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.

---
title: Test report steps are out of sync
description: Understand what causes test step order discrepancies in test reports. See how to reconcile test report step order in App Center Test.
keywords: test cloud, steps, skipped
author: lucen-ms
ms.author: lucen
ms.date: 04/20/2022
ms.topic: troubleshooting
ms.assetid: 0b5ef2ec-0962-47ca-9279-f149f5bca569
ms.service: vs-appcenter
ms.custom: test
---

# Test report steps are out of sync in App Center Test

App Center Test creates test reports that synchronize each test and test step across devices used. To organize the reports, Test relies on the filenames and order of the screenshots it takes.

If your test suite runs on multiple devices, and allows devices to take different paths through the test code, test steps might appear out of order, skipped, or duplicated in the report. The report summary doesn't count tests with these symptoms as failures.

The following pseudocode examples demonstrate this issue and a workaround.

### Pseudocode to reproduce the issue

This example creates discrepancies in the test report if both of the following conditions apply:

- The test is running on multiple devices.
- At least one device takes each code path.

```
if(bool)
{
    // code to run if true
    app.Screenshot("True");
} else 
{
    // code to run if false
    app.Screenshot("False");
};
```

### Pseudocode workaround

In the following pseudocode, since both code paths create the same screenshot names and sequence, the test report can reconcile both paths to the same test step.

```
if(bool)
{
    // code to run if true
    app.Screenshot("Result");
} else 
{
    // code to run if false
    app.Screenshot("Result");
};
```


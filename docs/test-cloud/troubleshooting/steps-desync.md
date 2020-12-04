---
title: Test Report Steps are Out-of-Sync 
description: Understanding discrepancies in test step order
keywords: test cloud, steps, skipped
author: king-of-spades
ms.author: kegr
ms.date: 12/03/2020
ms.topic: article
ms.assetid: 0b5ef2ec-0962-47ca-9279-f149f5bca569
ms.service: vs-appcenter
ms.custom: test
---

# Test Report Steps are Out-of-Sync
App Center Test attempts to generate reports that synchronize each test & test step across devices used. To do this, the system relies on the filename and order for each screenshot taken.

If your test suite runs on multiple devices, and your test suite allows devices to take different paths through your test code, you might see affected tests with steps that appear to be out-of-order, skipped and/or duplicated in the report. 

Skipped tests aren't treated as test failures. 

### Pseudocode to reproduce issue
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

This example will create discrepancies in the test report if both apply:
- Multiple devices are being tested.
- Each path is taken by at least 1 device.

### Pseudocode workaround
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

Since both code paths create the same name & sequence of screenshots, the final test report can reconcile them to the same test step. 
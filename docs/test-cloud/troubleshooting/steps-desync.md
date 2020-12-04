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
App Center Test attempts to generate reports that syncronize each test & test step across devices used. In order to achieve this, the system relies on the filenames and sequence that screenshots are taken in. 

If your test suite runs on multiple devices, and your test suite allows devices to take different paths through your test code, you might see affected tests with steps that appear to be out-of-order, skipped and/or duplicated in the report. 

Skipped tests are not treated as test failures. 

### Psuedocode to reproduce issue
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

This code will create discrepancies in the test report if both apply:
- Multiple devices are being tested.
- At least some devices take each path.

### Psuedocode workaround
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

Since both code paths create the same name & sequence of screenshots, the final test report will be able to reconcile them as belonging to the same test step. 
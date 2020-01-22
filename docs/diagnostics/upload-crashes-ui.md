---
title: Upload crashes via UI
description: Upload a crash report, e.g. if you don't want to use our SDK or develop for a custom platform.
keywords: crashes, diagnostics, errors, upload
author: vaagnavanesyan
ms.author: v-vaavan
ms.date: 01/24/2020
ms.topic: article
ms.assetid: 7f5135ee-c133-4f1f-9376-978af1e3405d
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Upload crashes via UI

If you have native crash report from real Apple device you can upload it via Diagnostics UI. The following sections will explain how to retrieve crash reports from device and upload it to App Center.


## Retrieve crash reports from Apple devices
To retrieve crash reports from an Apple device, follow the instructions in [Apple's developer documentation](https://developer.apple.com/library/archive/technotes/tn2151/_index.html#//apple_ref/doc/uid/DTS40008184-CH1-ACQUIRING_CRASH_AND_LOW_MEMORY_REPORTS)


## Manually upload crash reports via Diagnostics UI
To manually upload Apple crash reports, follow the instructions below:

1. Log into App Center and select your app.
2. In the left menu, navigate to the **Diagnostics** section
3. On the right top corner of page, click the three dots in the upper-right corner.
4. Select **Upload Crash Log**
5. In the Crash Upload Dialog, follow the wizard to upload your crash report:
6. Once your report is successfully uploaded, you will see confirmation message:

Please allow some time for the report to be processed for symbolication. The crash report will appear in the Diagnostics UI after it's processed.

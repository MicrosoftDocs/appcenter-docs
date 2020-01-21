---
title: Upload crashes via UI
description: Upload a crash report, e.g. if you don't want to use our SDK or develop for a custom platform.
keywords: crashes, diagnostics, errors, upload
author: vaagnavanesyan
ms.author: v-vaavan
ms.date: 01/21/2020
ms.topic: article
ms.assetid: 7f5135ee-c133-4f1f-9376-978af1e3405d
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Upload crashes via UI

If you have native crash report from real Apple device you can upload it via Diagnostics UI. The following sections will explain how to retrieve crash reports from device and upload it to App Center.


## Retrieve crash reports from Apple devices
This section describe how to get native crash reports from iOS and MacOS


### Retrieve crash reports from iOS
To retrieve crash reports from iOS device follow these steps:

1. Go to Settings and tap on Privacy item: ![iOS Settings](~/diagnostics/images/ios-settings.png)
2. Tap on Analytics: ![iOS Settings Privacy](~/diagnostics/images/ios-settings-privacy.png)
3. Tap on Analytics Data: ![iOS Settings Privacy Analytics Data](~/diagnostics/images/ios-settings-privacy-analytics.png)


### Retrieve crash reports from MacOS
To retrieve crash reports from MacOS device follow these steps:

1. Go to Applications -> Utilities
2. Launch Console and find your crashes


## Manually upload crash reports via Diagnostics UI
To manually upload Apple crash reports, follow the instructions below:

1. Log into App Center and select your app.
2. In the left menu, navigate to the **Diagnostics** section
3. On the right top corner of page, click the three dots in the upper-right corner.
4. Select **Upload Crash Log**
![Manual Crash Upload Menu](~/diagnostics/images/diagnostics-crash-upload-menu.png)
5. In the Crash Upload Dialog, follow the wizard to upload your crash report:
![Manual Crash Upload Start](~/diagnostics/images/diagnostics-manual-crash-upload-start.png)
6. Once your report is successfully uploaded, you will see confirmation message:
![Manual Crash Upload Finish](~/diagnostics/images/diagnostics-manual-crash-upload-finish.png)

Please allow some time for the report to be processed for symbolication. The crash report will appear in the Diagnostics UI after it's processed.

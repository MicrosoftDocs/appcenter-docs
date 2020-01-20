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
To manually upload Apple crash reports go to the main Diagnostics page:

1. Login to the App Center Portal
2. Select an application
3. In the navigation area on the left, select Diagnostics

On the right top corner of page click on Menu button and select `Upload Crash Log`
![Manual Crash Upload Menu](~/diagnostics/images/diagnostics-crash-upload-menu.png)

Then it opens Crash Upload Dialog. Please follow the wizard to upload your crash report:
![Manual Crash Upload Start](~/diagnostics/images/diagnostics-manual-crash-upload-start.png)

Once your report was uploaded successfully this message will be shown:
![Manual Crash Upload Finish](~/diagnostics/images/diagnostics-manual-crash-upload-finish.png)

Please wait for symbolication for some time and your crash will appear on Diagnostics UI.
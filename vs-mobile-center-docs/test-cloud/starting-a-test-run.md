---
title: Starting a Test Run
description: How to start a test run in Test Cloud
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 01/20/2017
ms.topic: article
ms.assetid: fccaea20-b7ca-45d2-b111-46c23ff1832d
ms.service: vs-appcenter
ms.custom: test
---

# Starting a Test Run

This section provides instructions for initiating a test run with test suites that have been prepared for upload. To learn how to prepare a test suite for upload to Test Cloud, see [preparing tests for upload](~/test-cloud/preparing-for-upload/index.md).

Initiating a test run in Test Cloud requires the [App Center CLI tool](~/cli/index.md).

With the App Center CLI tool installed and upload preparation complete, initiating a test run is very straightforward as the UI will guide you through the necessary steps. Begin by navigating to the Test Cloud section within the desired app. Clicking the **new test run** button will launch a dialog which will lead you through the 3 steps of preparing a test run.

### Device selection
Select the devices against which this test run should execute. This collection of devices can optionally be saved as a set for future use. To save the set, follow the on-screen prompts.

### Test run configuration
Select the test framework, set the device locale, and select a test series. Device locale will determine the system-level device settings, such as language. For more on test series, see [this section](~/test-cloud/core-concepts.md).

### The generated command
Each selection from the previous steps will be used to generate a command which is used with the App Center CLI to initiate a test run. For example, a command generated for an Android app with Espresso tests might look like:

```
mobile-center test run espresso --app "mobile-center-username/app-name" --devices a32b320b --app-path pathToFile.apk  --test-series "master" --locale "en_US" --build-dir pathToEspressoBuildFolder
```

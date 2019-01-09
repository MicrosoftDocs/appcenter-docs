---
title: Starting a test run
description: How to start a test run in App Center Test
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 01/07/2019
ms.topic: article
ms.assetid: fccaea20-b7ca-45d2-b111-46c23ff1832d
ms.service: vs-appcenter
ms.custom: test
---

# Starting a test run

A test run is an execution of a test suite with an application binary. This section describes how to upload and start a test run in App Center Test. Before creating a test run, complete the steps at [Getting started with App Center Test](~/test-cloud/getting-started.md).

Test runs are started by executing a command that invokes the App Center command line interface (CLI). This uploads your application and tests to App Center Test where they execute and generate a test report. Some of the command parameters vary based on your application platform, test framework, the test devices and other test configuration options. To generate the command, use the **New test run** dialog in App Center Test.

## App Center Test

1. Login to the App Center Portal.
2. Select an application.
3. In the navigation area on the left, select **Test** (the circle with a check mark icon).

You’ll see a high-level overview of existing test runs for the selected application and the **New test run** button.

## New test run

Click the **New test run** button to start the dialog that creates the test run command. This dialog advances through three screens.

1. Select devices - select the devices to test against.
2. Configure - select the test series, system language and test framework to use for the test.
3. Submit - provides the command to start a new test run based on the previous selections.

Move between these screens by completing selections or the **Next >** and **< Previous** buttons.

### Select devices

Select the devices or a named device set to test against. A *device set* is a collection of devices and operating systems. If you previously named and saved a device set that you wish to use for this test select it from the list of named device sets.

Otherwise, click **Choose other device configurations** then choose the device or devices to use from the list. To save the selected devices as a named device set, click **Save set** and provide a name. To proceed without saving this selection as a named device set, click **Select N devices** (The value for *N* changes as you make device selections to confirm the number of devices selected).

### Configure

Select the test series, the system language, and the test framework. The system language determines the device locale that affects system-level device settings, such as the decimal separator. For more on test series, see [App Center Test Core concepts](~/test-cloud/core-concepts.md).

### Submit

Based on the previous steps a prototype command is generated to upload and start your test run. For example, a command generated for an Android app with Espresso tests might look like this:

```shell
appcenter test run espresso --app "APP_ID" --devices "DEVICE_SET_ID" --app-path PATH_TO_FILE.apk  --test-series "master" --locale "en_US" --build-dir PATH_TO_ESPRESSO_BUILD_FOLDER
```

The command parameters include:

* **app** - The *id* of the application in App Center.
* **devices** - The *id* for the *device set* to execute against. If you are using a named device set the id is based on the device set name. If you are not using a named device set the id is a *device slug*. A *device slug* is a unique hexadecimal value representing the selected collection of devices and operating systems.
* **app-path** - The path to the application being tested.
* **test-series** - A label used to group a series of related test runs together. By default, the value of the test series is *master*.
* **build-dir** - The path to the directory that contains your test automation.

Edit any paths in the generated command to match your environment then execute it using the command line or terminal window. You may want to save the command to use for future test runs.

## Getting help

You can always contact us through [the blue chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). We do not provide 24/7 support, but will strive to reply as fast as possible.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.

---
title: Starting a test run
description: How to start a test run in App Center Test
keywords: test cloud
author: lucen-ms
ms.author: lucen
ms.date: 04/08/2020
ms.topic: article
ms.assetid: fccaea20-b7ca-45d2-b111-46c23ff1832d
ms.service: vs-appcenter
ms.custom: test
---

# Starting a test run
[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

A test run is an execution of a test suite with an application binary. This section describes how to upload and start a test run in App Center Test. Before creating a test run, complete the steps at [Getting started with App Center Test](~/test-cloud/getting-started.md).

Test runs are started by executing a command that invokes the App Center command-line interface (CLI). The command can be executed from a local system, test computer, as part of a continuous integration, or a continuous deployment system. This uploads your application and tests to App Center Test where they execute and generate a test report. Some of the command parameters vary based on your application platform, test framework, the test devices, and other test configuration options. To generate a prototype command, use the **New test run** dialog in App Center Test.

## App Center Test

1. Log in to the App Center Portal.
2. Select an application.
3. In the navigation area on the left, select **Test** (the circle with a check mark icon).

You’ll see a high-level overview of existing test runs for the selected application and the **New test run** button.

## New test run

Click the **New test run** button to start the dialog that creates the test run prototype command. This dialog advances through three screens.

1. Select devices - select the devices to test against.
2. Configure - select the test series, system language, and test framework to use for the test.
3. Submit - provides the prototype command to start a new test run based on the previous selections.

Move between these screens by completing selections or the **Next >** and **< Previous** buttons.

### Select devices

Select the devices or a named device set to test against. A *device set* is a collection of devices and operating systems. If you've previously created a device set, you can select it from the list of named device sets.

Otherwise, click **Choose other device configurations** than choose the device or devices to use from the list. To save the selected devices as a named device set, click **Save set** and provide a name. To continue without saving this selection as a named device set, click **Select N devices** (The value for *N* changes as you make device selections to confirm the number of devices selected).

### Configure

Select the test series, the system language, and the test framework. The system language determines the device locale that affects system-level device settings, such as the decimal separator. For more on test series, see [App Center Test Core concepts](~/test-cloud/core-concepts.md).

### Submit

Based on the previous steps a prototype command is generated. Some parameters in this prototype command must be edited to match your environment before using it to upload and start your test run. For example, the command prototype generated for a hypothetical user and an Android app with Espresso tests might look like:

```shell
appcenter test run espresso --app "user_org_key/App_key" --devices 36608302 --app-path PATH_TO_FILE.apk  --test-series "main" --locale "en_US" --build-dir PATH_TO_ESPRESSO_BUILD_FOLDER
```

> [!IMPORTANT]
> The command shown here is for illustration purposes only. Don't use *this* command. Instead, use the dialog to generate a command prototype for your application, test framework and test parameters.

The command parameters include:

* **app** - The *ID* of the selected application in App Center. This value shouldn't be modified.
* **devices** - The *ID* for the selected *device set* to execute against. If you selected a named device set, the ID is generated from the device set name. If you aren't using a named device set, the ID is generated as a *device slug*. A *device slug* is a unique hexadecimal value representing the selected collection of devices and operating systems. This value shouldn't be modified.
* **app-path** - The path to the application being tested. This path must be edited to match your environment and can be an absolute or relative path.
* **test-series** - The selected test series. The *test series* is a label used to group test runs together in App Center Test reports.
* **build-dir** - The path to the directory that contains your test automation build output. This path must be edited to match your environment and can be an absolute or relative path.

Edit the *app-path* and *build-dir* in the generated command to match your environment then execute it using the command line or terminal window. You may want to save the command to use for future test runs.

The edited and ready to use version of the command line for this hypothetical example could be:

```shell
appcenter test run espresso --app "user_org_key/App_key" --devices 36608302 --app-path "app/build/outputs/apk/debug/app-debug.apk"  --test-series "main" --locale "en_US" --build-dir "app/build/outputs/apk/androidTest/debug"
```

> [!NOTE]
> Each uploaded file is limited to 400 MB. Make sure the size of your app file or build-dir content doesn't exceed the size limit.

## Getting help
You can contact support in the App Center portal. In the upper right corner of screen, select the Help (?) menu, then choose 'Contact support'. Our dedicated support team will respond to your questions.

If you want help with a test run, navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.

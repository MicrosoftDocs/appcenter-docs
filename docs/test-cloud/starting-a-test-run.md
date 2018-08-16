---
title: Starting a Test Run
description: How to start a test run in App Center Test
keywords: test cloud
author: glennwester
ms.author: glwest
ms.date: 08/08/2018
ms.topic: article
ms.assetid: fccaea20-b7ca-45d2-b111-46c23ff1832d
ms.service: vs-appcenter
ms.custom: test
---

# Starting a Test Run

This section provides instructions for initiating a test run with test suites that have been prepared for upload. To learn how to prepare a test suite for upload to App Center, see [preparing tests for upload](~/test-cloud/preparing-for-upload/index.md).

Initiating a test run in App Center Test requires the [App Center CLI tool](~/cli/index.md).

1. Log in at [https://appcenter.ms](https://appcenter.ms)
2. If you have not created your app, click *Add new* -> **Add new app** and fill out the relevant information. More info at [creating and managing apps](https://docs.microsoft.com/en-us/appcenter/dashboard/creating-and-managing-apps).
3. On the left-hand sidebar select the Test icon, the circle with a checkmark inside of it.
4. Click **New test run** to run the dialog to create a test upload command
5. On the next screen, select the devices against which this test run should execute. This collection of devices can optionally be saved as a set for future use.
6. Select the test framework, set the device locale, and select a test series. Device locale will determine the system-level device settings, such as language. For more on test series, see [this section](~/test-cloud/core-concepts.md)
7. Each selection from the previous steps will be used to generate a command which is used with the App Center CLI to initiate a test run. For example, a command generated for an Android app with Espresso tests might look like:

### Device selection

Select the devices against which this test run should execute. This collection of devices can optionally be saved as a set for future use. 

To get started:

1. Navigate to [https://appcenter.ms/](https://appcenter.ms/).
2. In the left hand column, click **Test** and **Device sets**.
3. In the top right hand corner, click **New device set**.
4. In the **Set name** field, choose a name for your device set.
5. Under **Devices**, on the left hand column of each row, you can **check** the checkboxes to select the devices in your device set. 
6. When you have completed selecting your devices, at the bottom right hand corner, click **New device set**.
7. Congrats! You've created a device set. 

## Test run configuration

Select the test framework, set the device locale, and select a test series. Device locale will determine the system-level device settings, such as language. For more on test series, see [this section](~/test-cloud/core-concepts.md)

## The generated command

Each selection from the previous steps will be used to generate a command which is used with the App Center CLI to initiate a test run. For example, a command generated for an Android app with Espresso tests might look like:

```shell
appcenter test run espresso --app "<app-center-username/app-name>" --devices "app-center-username/named-device-set" --app-path pathToFile.apk  --test-series "master" --locale "en_US" --build-dir pathToEspressoBuildFolder
```

The command parameters include the following pieces of information specific to the newly created test run:

* **APP NAME** - The name of the app in App Center.
* **PATH TO APK / IPA** - The path to the app being tested.
* **DEVICE SET NAME / ID** - Represents the *device set* where the test will execute. A device set is a collection of devices and operating systems.
* **TEST SERIES** - A label used to group a series of related test runs together. By default, the value of the test series is *master*.
* **PATH TO TEST DIRECTORY** - The path to the directory that contains your test automation.
With the App Center CLI tool installed and upload preparation complete, initiating a test run is very straightforward as the UI will guide you through the necessary steps. Begin by navigating to the Test section within the desired app. Clicking the **new test run** button will launch a dialog which will lead you through the 3 steps of preparing a test run.

8. Copy this generated command and execute it using the `appcenter` command line tool. Additionally, you may want to save the command to use in future test runs.

## Getting help

You can always contact us through [the chat icon in the lower-right hand corner](https://intercom.help/appcenter/getting-started/getting-help-with-app-center). Be aware that we do not provide 24/7 support, but will strive to reply as fast as possible.

To help debug your test run, you can navigate to the test run in question and copy the URL from your browser and paste it into the support conversation. A test run URL looks like something like https://appcenter.ms/orgs/OrgName/apps/App-Name/test/runs/77a1c67e-2cfb-4bbd-a75a-eb2b4fd0a747.
---
# required metadata
title: Using Azure DevOps for UI Testing
description: How to get started with UI Testing in Azure DevOps (VSTS)
keywords: test, VSTS, Azure DevOps, espresso, appium, xamarin.uitest, xcuitest
author: Oddj0b
ms.author: vigimm
ms.date: 10/10/2018
ms.topic: article
ms.service: vs-appcenter
ms.assetid: 225497b6-6f5a-460a-b842-0d43756deaa9
---

# Using Azure DevOps (VSTS for UI Testing)

The App Center Test task for Azure DevOps enables you to run your Appium, XCUItest, Espresso and Xamarin.UITest test suite in App Center Test. It is the next generation of Xamarin Test Cloud task which also is available in Azure DevOps. Read more about the frameworks on the [App Center Test Supported frameworks](supported-frameworks.md) page.

Each framework has its own section in this document, where you can read about the basic requirements for setting up a build step definition in Azure DevOps.

![Azure DevOps Task screen for App Center Test](images/vsts-task.png)

## General setup steps

### Before you start

Before you can start testing, the following steps are required.

* You will need the application binary (`.apk` or `.ipa` file)
* Activate your trial for App Center Test - this is done on [App Center](https://appcenter.ms/). First select your app and then select Test in the left-hand menu.

### Azure DevOps General Setup

![The general section of the Azure DevOps task](images/vsts-general.png)

First, locate your project and select **Build and release** on the projects row. At the top of the page, select **Definitions** then hover your mouse over the definitions row and click **...**. On the context menu that appears, select **Edit**. On the page that appears,  click **+** to add a new task, then search for **App center**.  On the left-hand side of the screen, click your test to modify it.
The **App Center** task in the build definition is divided up into sections - in the **General** section, insert the path to your app binary (`.apk` or `.ipa`) in the `Binary Application File Path` field.

### Connecting to App Center Test

You must login into App Center before using the service; there are 2 authentication methods available to you.

The first method uses an API token; to acquire your account's API token:

* Login to App Center and click the user settings icon in the upper-left corner of the App Center portal.
* In the menu that appears, select **Account Settings**.
* In the **Settings** panel, select **API Tokens**.
* Click the **New API token** button in the upper-right corner of the panel.
* Name the new API token - for instance, you can call it **Azure DevOps**. In the future, this will help you identifying which service is using the service. 

    ![Screen showing a generated API token](images/vsts-api-token.png)

* Click **Add new API token** button. A pop-up appears displaying the new API token; this is the **only time** App Center will display this token. Click the clipboard button to copy the API Token to the browser's clipboard. Save the API token somewhere ([Azure Key Vault]()https://azure.microsoft.com/en-us/services/key-vault/, for example) where you can securely reference it again later if needed.

With the API Token on the clipboard:

* Switch to your Azure DevOps window, In the **App Center Connection** field click the **Add** button.
* Populate the form's **Name** field with an appropriate name for the connection (for example: **App Center**).
* Paste the App Center API Token into the **API token** field.
* Finish the setup by clicking close.

Make sure your newly created connection appears in the App Center Connection field.

The second method is uses your App Center account credentials:

* Select **Credentials** from the **Authentication Method** dropdown menu.
* Populate the **App Center Username** and **App Center Password** fields with the credentials from your App Center account.

You can find your App Center username in your [App Center account profile](https://appcenter.ms/settings/profile). There is a limitation while logging in using your Microsoft credentials, where you must set up your account with passsword or else the task cannot login. [You set up a password in App Center](https://appcenter.ms/settings/password).

## Appium

* There are some requirements before starting. See the [Before you start](#before-you-start) section of this document.
* [Read how to prepare your repository for Appium](preparing-for-upload/appium.md).

### Azure DevOps setup

Start by adding the App Center Test task to the build definition - read how to do this in the [Azure DevOps general setup](#vsts-general-setup)

![Prepare test section for the Appium framework](images/vsts-appium-prepare.png)

In the Prepare Tests section, first make sure the **Prepare Tests** checkbox is checked, then for **Test Framework**, select **Appium**. Insert the path to the Appium test-classes, dependency-jars and the `pom.xml` file into the **Build directory** field. These three artifacts are usually located in the `upload` folder.

If everything is done correctly - preparations are done and it is time to configure the test run. All the information needed is found by creating a new test under Test in App Center. Navigate your browser to [App Center](https://appcenter.ms/) and select your app. Go to the Test service and click on **New test run** in the upper right hand side of the page.

Select the devices for the test run. As general rule for device selection, more devices equals longer testing time. Start small with 1-3 devices, and when everything is working, create a new test run with more devices. Finish your selection by clicking **Next**.

On the next page, select an existing test series, or create a new one. A Test Series is a way of managing your test runs. Choose something which makes sense and will make it easy to find the results later, for examples **Azure DevOps** which tells where the test is sent from. It can be changed later so it matches your existing test series. Select **Appium** as the test framework, then click the `Next` button to proceed.

```shell
appcenter test run appium --app "username/appname" --devices 209ed689
 --app-path pathToFile.apk --test-series "master" --locale "en_US"
  --build-dir target/upload
```

Leave the submit page (last page on test run setup) open, as there is information you'll need to setup the test run later on Azure DevOps.

![Run section for the Azure DevOps task](images/vsts-run-test.png)

* First step is creating an App Center connection. See the [Connecting to App Center](#connecting-to-app-center-test) section of this document.
* The app slug is structured as `<username>/<appname>`. Insert that into the `App Slug` field. On the submit page it is the `--app` parameter
* Your device selection which is a mixture of letters and numbers, is specified in the `Devices` field. On the submit page it is the `--devices` parameter. Alternatively, you can use the "Device Slug" which is structered similarly to the app slug: `<username>/<device set name>`.
* Test series is a free text - it can be anything. It's the `--test-series` parameter
* System Language is a drop-down menu, and if `Other` is selected a `Other Locale` field appears where you can input laguage and country code like this: en_US

You can read more about starting a test run on the [Starting a test run](starting-a-test-run.md) page.

You're all set to initiate the build.

## Espresso

* There are some requirements before starting. See the [Before you start](#before-you-start) section of this document.
* [Read how to prepare your repository for Espresso](preparing-for-upload/espresso.md).

### Azure DevOps (VSTS) setup

Start by adding the App Center Test task to the build definition - read how that is done in the [Azure DevOps general setup](#vsts-general-setup)

If everything is done correctly - preparations are done and it is time to configure the test run. All the information needed is found by creating a new test under Test in App Center. Navigate your browser to [App Center](https://appcenter.ms/) and select your app. Go to the Test service and click **New test run** in the upper right hand side of the screen

Select the devices for the test run. As a general rule for device selection, more devices equal longer testing time. Start small with 1-3 devices, and when everything is working, create a new test run with more devices. Finish your selection by clicking the **Next** button.

On the next page, select an existing **Test Series**, or create a new one. A Test Series is a way of managing your test runs. Choose something which makes sense and will make it easy to find the results later, for example **Azure DevOps** which tells where the test is sent from. You can change it later, so it matches your existing test series. Select **Espresso** as the target framework, then click **Next** to proceed.

```shell
appcenter test run espresso --app "username/appname" --devices 209ed689
 --app-path pathToFile.apk --test-series "master" --locale "en_US"
  --build-dir pathToEspressoBuildFolder
```

Leave the submit page (last page on test run setup) open, as there is information you'll need to setup the test run on Azure DevOps.

![Run section for the Azure DevOps task](images/vsts-run-test.png)

* First step is creating an App Center connection. See the [Connecting to App Center](#connecting-to-app-center-test) section of this document.
* The app slug is structured as `<username>/<appname>`. Insert that into the `App Slug` field. On the submit page it is the `--app` parameter. Alternatively, you can use the "Device Slug" which is structered similarly to the app slug: `<username>/<device set name>`.
* Your device selection which is a mixture of letters and numbers, is specified in the `Devices` field. On the submit page it is the `--devices` parameter.
* Test series is a free text - it can be anything. It's the `--test-series` parameter
* System Language is a drop-down menu, and if `Other` is selected a `Other Locale` field appears where you can input language and country code like this: en_US

You can read more about starting a test run on the [Starting a test run](starting-a-test-run.md) page.

You're all set to initiate the build.

## Xamarin.UITest

* There are some requirements before starting. See the [Before you start](#before-you-start) section of this document.
* [Read how to prepare your repository for Xamarin.UITest](preparing-for-upload/uitest.md).

### Azure DevOps setup

Start by adding the App Center Test task to the build definition - read how that is done in the [Azure DevOps general setup](#vsts-general-setup)

![Prepare test section for the Xamarin.UITest framework](images/vsts-uitest-prepare.png)

In the Prepare Tests section, make sure the **Prepare Tests** checkbox is checked and that **UI Test** is selected under **Test Framework**. Insert the path to your build directory; in most cases the build folder is: `<ProjectName>/bin/<configuration>`.

If everything is done correctly - preparations are done and it is time to configure the test run. All the information needed is found by creating a new test under Test in App Center. Navigate your browser to [App Center](https://appcenter.ms/) and select your app. Go to the Test service and click on **New test run** in the upper-right corner of the page.

Select the devices for the test run. As a general rule for device selection, more devices equal longer testing time. Start small with 1-3 devices, and when everything is working, create a new test run with more devices. Finish your selection by clicking next.

On the next page select your test series or create a new one. Test series is a way of managing your test runs. Choose something which makes sense and will make it easy to find the results later, for example **Azure DevOps** which tells where the test is send from. It can be changed later so it matches your existing test series. For the test framework, select **Xamarin.UITest** then click the `Next` button to proceed.

```shell
appcenter test run uitest --app "username/appname" --devices 209ed689
 --app-path pathToFile.apk --test-series "master" --locale "en_US"
  --build-dir pathTUITestBuildDir
```

Leave the submit page (last page on test run setup) open, as there is information you'll need to setup the test run on Azure DevOps.

![Run section for the Azure DevOps task](images/vsts-run-test.png)

* First step is creating an App Center connection. See the [Connecting to App Center](#connecting-to-app-center-test) section of this document.
* The app slug is structured as `<username>/<appname>`. Insert that into the `App Slug` field. On the submit page it is the `--app` parameter
* Your device selection which is a mixture of letters and numbers, is specified in the `Devices` field. On the submit page it is the `--devices` parameter.
* Test series is a free text - it can be anything. It's the `--test-series` parameter
* System Language is a drop-down menu, and if `Other` is selected a `Other Locale` field appears where you can input language and country code like this: en_US

You can read more about starting a test run on the [Starting a test run](starting-a-test-run.md) page.

You're all set to initiate the build.

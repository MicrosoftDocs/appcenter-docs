---
title: Windows Support
description: An overview of App Center's Windows support
keywords: crashes, diagnostics, errors, Windows, UWP, WinRT, WPF, Silverlight
author: winnieli1208
ms.author: yuli1
ms.date: 11/01/2019
ms.topic: article
ms.assetid: 8d48c68e-3fca-4dc4-b7d5-5f4474f8734f
ms.service: vs-appcenter
ms.custom: analytics
---

# Windows Support

App Center currently supports diagnostics for UWP, WPF and WinForms applications. This section explains the new experience for UWP apps as part of the 2.5.0 SDK release. For more information on WPF and WinForms applications,
refer to our [diagnostics features](~/diagnostics/features.md) and [WPF/WinForms SDK](~/sdk/crashes/wpf-winforms.md) pages.

## Universal Windows Platform

App Center supports the full diagnostics feature set for both sideloaded and Windows Store UWP apps using the 2.5.0 SDK. To enable App Center’s diagnostics for your UWP app, follow [App Center's UWP SDK documentation](~/sdk/crashes/uwp.md) to integrate the App Center SDK. You can learn more about the complete feature set in the [diagnostics features documentation](~/diagnostics/features.md).

For UWP apps using older versions of the SDK, there are known limitations and missing features. You can learn more about these differences and the transition experience in the section below.

### UWP legacy experience

Prior to the 2.5.0 SDK release, App Center worked with the Windows crash reporting service built into Windows devices to send and process crash logs. Because of this, there were some limitations and missing features in App Center's crash reporting for UWP apps.

*Limitations*

- Crash reporting is enabled only on devices running Windows 10 Creators update or more recent (version 10.0.15063).
- Crash reporting on Windows requires the app to be distributed through the Microsoft Store.
- Crashes will only be sent if the device is plugged in to power, this includes phones.
- Some crashes might appear unsymbolicated (missing method names or file names or even class names) from applications that are associated with Microsoft Store
- UWP only supports starting Crashes with `AppCenter.Start` and none of the other API calls provided by the Crashes class are supported

*Missing features*

- A full symbolication experience that allows you to upload symbols in App Center. To upload symbols for your UWP crashes, you must submit your app to the Microsoft store and submit your symbols filed to Microsoft Dev Center.
- Number of users affected per crash group.
- Ability to add annotations and keep track of notes and other important information for your crash groups.
- Ability to mark crash groups as open, closed, or ignored.
- Ability to attach, view and download one binary and one text attachment to your crash reports.
- Crash report details per crash instance including when the app was launched, when it crashes, and what country, network, and language the device is in.
- Ability to download crash reports.

## New diagnostics experience for UWP apps

With the 2.5.0 SDK release in October 2019, App Center released a new diagnostics experience to address the limitations and gaps mentioned above. This section details the improvements and transition experience with the new release.

### What improvements were made?

The new and improved diagnostics experience for UWP apps includes support for both Windows store and sideloaded apps. This includes the following additions:

- A full symbolication experience that allows you to upload symbols in App Center. See the symbolication section below for more details.
- Support for handled exceptions
- Number of users affected per crash or error group
- Ability to add annotations per crash or error group
- Ability to mark crash and error groups as open, closed, or ignored
- Ability to download crash and error reports
- Ability to attach, view and download one binary and one text attachment to your crash reports
- Crash and error report details per crash instance including when the app was launched, when it crashed, and what country and language the device was in

You can learn more about each feature in the [App Center diagnostics documentation](~/diagnostics/features.md).

### What is the transition experience?

After you update to the App Center UWP SDK Version 2.5.0, you will see crash and error data coming into the App Center Diagnostics portal in a new and improved UI. For crash and error data displayed in the new Diagnostics UI, you need to use the APIs listed under the [errors section](https://openapi.appcenter.ms/#/errors). Learn more about how the old crashes APIs map to the new errors APIs in the [API transition documentation](~/diagnostics/using-the-diagnostics-api.md#transitioning-to-the-new-apis).

All crashes from older SDK versions will be still be available and displayed in a new section under Diagnostics called "Legacy issues". You can continue to use the APIs listed under the [crashes section](https://openapi.appcenter.ms/#/crash) to retrieve this data. If you would like to see your UWP app crashes in one place, we recommend you use Partner Center's crash reporting for Windows store apps.

### What happens after the transition?

The legacy experience will be disabled on January 20th, 2020. Please upgrade to the 2.5.0 SDK as soon as it's released and use the new errors APIs as soon as you can to ensure a smooth transition. If you need help or have questions about the transition, please reach out to our support team.

## Symbolication

UWP crash reports show the stack trace for the thread that caused the crash. When the application is using .NET Native (typically in release builds) the stack trace may contain memory addresses instead of class names, methods, file names, and line numbers that are needed to read and understand the crashes.

### Uploading symbols

To get these memory addresses translated you need to upload a **.appxsym** file to App Center, which contains all information required for symbolication.

#### Generate the Symbols

In order to obtain an **.appxsym** file, you must create an app bundle as described [here](https://docs.microsoft.com/en-us/windows/msix/package/packaging-uwp-apps). Once you have created the bundle, you'll find the symbols file as an **.appxsym** file inside the app bundle folder.

#### Symbols for applications built in App Center Build

If your application is built in App Center, symbols can be downloaded from the build page using the **Download** button.

#### Symbols for applications published to the Microsoft Store

When you publish your application to the store, the .NET Native compilation happens on server side. Thus you need to download the symbols from the [Partner Center](https://partner.microsoft.com/en-us/dashboard/windows/overview).

1. Locate your application in the list and click on it.
1. Expand **Product management** menu from the left panel.
1. Click on **Manage packages**.
1. Click on **Show packages** on the top right corner for the **Submission** (version) you want symbols for.
1. Locate the package for the version you need symbols for, and click on links for all the supported architectures to download all symbols (such as the **Download Windows 10 symbol file (x64)** link).

#### App Center Portal

1. Log into App Center and select your app.
1. In the left menu, navigate to the **Diagnostics** section, then **Issues**.
1. If your application has not reported any crash yet, in the top-right corner, click **Upload symbols** and upload the **appxsym** files or archives mentioned in the previous sections.
1. If your application already has reported crashes that needs symbols, check the **Unsymbolicated** tab and there should be a version group with missing symbols, click on it to reveal the menu to upload the files.
1. After the symbols are indexed by App Center, crashes will be symbolicated for you.

#### App Center API

1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create).
This call allocates space on our backend for your symbols and returns a `symbol_upload_id` and an `upload_url` property. The body of the request should specify the `symbol_type` as `UWP`.

```shell
curl -X POST "https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads" \
    -H "accept: application/json" \
    -H "X-API-Token: {API TOKEN}" \
    -H "Content-Type: application/json" \
    -d "{ \"symbol_type\": \"UWP\" }"
```

2. Using the `upload_url` property returned from the first step, make a `PUT` request with the header: `"x-ms-blob-type: BlockBlob"` and supply the location of your symbols on disk.  This call uploads the symbols to our backend storage accounts. Learn more about [PUT Blob request headers ](https://docs.microsoft.com/en-us/rest/api/storageservices/put-blob#request-headers-all-blob-types).

```shell
curl -X PUT '{upload_url}' \
    -H 'x-ms-blob-type: BlockBlob' \
    --upload-file '{path to file}'
```

3. Make a `PATCH` request to  the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_complete) using the `symbol_upload_id` property returned from the first step. In the body of the request, specify whether you want to set the status of the upload to `committed` (successfully completed) the upload process, or `aborted` (unsuccessfully completed).

```shell
curl -X PATCH "https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id}" \
    -H "accept: application/json" \
    -H "X-API-Token: {API TOKEN}" \
    -H "Content-Type: application/json" \
    -d "{ \"status\": \"committed\" }"
```

### App Center CLI
You can also use the CLI to upload symbol files:

```shell
appcenter crashes upload-symbols --appxsym {symbol file}
```


> [!NOTE]
> The symbol uploads API does not work for symbols files that are larger than 256MB. Please use the App Center CLI to upload these files. You can install the App Center CLI by following the instructions in our [App Center CLI repo](https://github.com/microsoft/appcenter-cli).


## WinRT, Silverlight, and Other Platforms

App Center doesn't currently support any other Windows platforms besides UWP, WPF, and WinForms. If you have any feedback or feature requests, please leave your feedback in the [App Center Github Repo](https://github.com/Microsoft/appcenter).

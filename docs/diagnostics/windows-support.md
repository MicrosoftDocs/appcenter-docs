---
title: Windows Support
description: An overview of App Center's Windows support
keywords: crashes, diagnostics, errors, Windows, UWP, WinRT, WPF, Silverlight
author: winnieli1208
ms.author: yuli1
ms.date: 10/08/2019
ms.topic: article
ms.assetid: 8d48c68e-3fca-4dc4-b7d5-5f4474f8734f
ms.service: vs-appcenter
ms.custom: analytics
---

# Windows Support

App Center currently supports diagnostics for UWP apps distributed through the Windows store and WPF and WinForms applications targeting .NET Framework or .NET Core 3. This section details the current level of support and the upcoming changes for UWP apps. Refer to our [diagnostics features](~/diagnostics/features.md) and [WPF/WinForms SDK](~/sdk/crashes/wpf-winforms.md) pages for more information on WPF and WinForms applications.

## Universal Windows Platform

App Center supports basic diagnostics features for UWP apps to help you fix your crashes. There are some known limitations and missing features compared to other supported platforms that we are actively addressing. You can learn more about these improvements in the transition section below. 

### Getting started

To enable App Center’s diagnostics for your UWP app, make sure you have the App Center SDK integrated for your app. Learn more about the UWP SDK in [App Center's UWP SDK documentation](~/sdk/crashes/uwp.md).

### Features Supported

#### Crash grouping

App Center groups your UWP crashes based on why and where the crash occurred. For each group, App Center displays the count, version and when the last crash in the group occurred, to help you prioritize and fix your crashes.

![App Center groups your crashes based on similarities](~/diagnostics/images/UWP-Crash-Groups.png)

#### Crash analytics

App Center displays a graph that indicates the number of crashes per day based on the selected time period.

![App Center shows you analytics on crashes](~/diagnostics/images/UWP-Analytics.png)

#### Crash group overview

Select a crash group to view the crash group stack trace and report details such as the most affected device and most affected OS. The full stack trace will only be displayed if you submit your app to the Windows store and upload the proper symbol files.

![App Center displays the stack trace and details of your crash group](~/diagnostics/images/UWP-Crash-Group-Overview.png)

#### Crash instance details

Select a crash report to view the crash stack trace and events. The full stack trace will only be displayed if you submit your app to the Windows store and upload the proper symbol files.

![App Center displays the stack trace and events of a crash instance](~/diagnostics/images/UWP-Crash-Instance.png)

### Known Limitations

App Center works with the Windows crash reporting service built into Windows devices to send and process crash logs. Because of this, there are some known limitations, we plan to address this year, unique to UWP apps.

- Crash reporting is enabled only on devices running Windows 10 Creators update or more recent (version 10.0.15063).
- Crash reporting on Windows requires the app to be distributed through the Microsoft Store.
- Crashes will only be sent if the device is plugged in to power, this includes phones.
- Some crashes might appear unsymbolicated (missing method names or file names or even class names) from applications that are associated with Microsoft Store
- UWP only supports starting Crashes with `AppCenter.Start` and none of the other API calls provided by the Crashes class are supported

You also might notice some features you see in other platforms are missing for your UWP apps. These include the following:

- A full symbolication experience that allows you to upload symbols in App Center. To upload symbols for your UWP crashes, you must submit your app to the Microsoft store and submit your symbols filed to Microsoft Dev Center.
- Number of users affected per crash group.
- Ability to add annotations and keep track of notes and other important information for your crash groups.
- Ability to mark crash groups as open, closed, or ignored.
- Ability to attach, view and download one binary and one text attachment to your crash reports.
- Crash report details per crash instance including when the app was launched, when it crashes, and what country, network, and language the device is in.
- Ability to download crash reports.

### Submitting your app to the Microsoft Store

To distribute your app through the Microsoft Store, you must create an app package file and [submit the package](https://docs.microsoft.com/windows/uwp/publish/upload-app-packages) to [Partner Center](https://partner.microsoft.com/dashboard). In creating your package file, you can include symbol files to upload to Partner Center. This will allow App Center to display symbolicated stack traces.

Follow the [Windows packaging documentation](https://docs.microsoft.com/windows/uwp/packaging/index) to package your app.

## Upcoming diagnostics updates for UWP apps

The App Center team is actively working on improving our diagnostics support for UWP apps to address the limitations and gaps mentioned above. This section details the improvements and transition you can expect to see in the upcoming weeks. 

### What improvements can I expect?

The new and improved diagnostics experience for UWP apps includes support for both Windows store and sideloaded apps. This includes the following additions:

- A full symbolication experience that allows you to upload symbols in App Center
- Support for handled exceptions
- Number of users affected per crash or error group
- Ability to add annotations per crash or error group
- Ability to mark crash and error groups as open, closed, or ignored
- Ability to download crash and error reports
- Ability to attach, view and download one binary and one text attachment to your crash reports
- Crash and error report details per crash instance including when the app was launched, when it crashes, and what country, network, and language the device is in


You can learn more about each feature in the [App Center diagnostics documentation](~/diagnostics/features.md).


### What is the transition experience?

After you update to the App Center UWP SDK Version 2.5.0, you will see crash and error data coming into the App Center Diagnostics portal in a new and improved UI. For crash and error data displayed in the new Diagnostics UI, you need to use the APIs listed under the [errors section](https://openapi.appcenter.ms/#/errors). Learn more about how the old crashes APIs map to the new errors APIs in the [API transition documentation](~/diagnostics/using-the-diagnostics-api.md#transitioning-to-the-new-apis). 

All crashes from older SDK versions will be still be available and displayed in a new section under Diagnostics called "Legacy issues". You can continue to use the APIs listed under the [crashes section](https://openapi.appcenter.ms/#/crash) to retrieve this data.

### What happens after the transition?

The legacy experience will be disabled on January 20th, 2020. Please upgrade to the 2.5.0 SDK as soon as it's released and use the new errors APIs as soon as you can to ensure a smooth transition. If you need help or have questions about the transition, please reach out to our support team.

### Symbolication

UWP apps built in the release configuration have stack traces that only contain memory addresses and don’t show class names, methods, file names, and line numbers that are needed to read and understand the crashes. To get these memory addresses translated you need to upload a pdb package to App Center, which contains all information required for symbolication. You can learn more about UWP symbol files in (Microsoft's UWP symbols documentation)[https://docs.microsoft.com/en-us/visualstudio/debugger/specify-symbol-dot-pdb-and-source-files-in-the-visual-studio-debugger?view=vs-2019].

#### Uploading symbols

##### App Center Portal
1. Create a ZIP file for the pdb package on your machine
2. Log into App Center and select your app
3. In the left menu, navigate to the **Diagnostics** section
4. Select the **Unsymbolicated** tab
5. In the top-right corner, click **Upload symbols** and upload the zip file
6. After the zip file is indexed by App Center, new incoming crashes will be symbolicated for you

##### App Center API
1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create). 
This call allocates space on our backend for your symbols and returns a `symbol_upload_id` and an `upload_url` property.
2. Using the `upload_url` property returned from the first step, make a `PUT` request with the header: `"x-ms-blob-type: BlockBlob"` and supply the location of your symbols on disk. This call uploads the symbols to our backend storage accounts. Learn more about [PUT Blob request headers ](https://docs.microsoft.com/en-us/rest/api/storageservices/put-blob#request-headers-all-blob-types).
3. Make a `PATCH` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_complete) using the `symbol_upload_id` property returned from the first step. In the body of the request, specify whether you want to set the status of the upload to `committed` (successfully completed) the upload process, or `aborted` (unsuccessfully completed).


> [!NOTE]
> When you build UWP apps with App Center Build, you don't need to manually download your symbols file and upload it App Center Diagnostics. The symbol files are automatically forwarded to the Diagnostics service.

## WinRT, Silverlight, and Other Platforms

App Center doesn't currently support any other Windows platforms besides UWP, WPF, and WinForms. You can find more details about future Windows platform support in App Center in our [Windows Plan on Github](https://github.com/Microsoft/appcenter/blob/windows/specs/2019-04/Windows-Plan.md). If you have any feedback or feature requests, please leave your feedback in the [App Center Github Repo](https://github.com/Microsoft/appcenter).

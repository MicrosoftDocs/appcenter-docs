---
title: Windows Support
description: An overview of App Center's Windows support
keywords: crashes, diagnostics, errors, Windows, UWP, WinRT, WPF, Silverlight
author: king-of-spades
ms.author: kegr
ms.date: 03/16/2020
ms.topic: article
ms.assetid: 8d48c68e-3fca-4dc4-b7d5-5f4474f8734f
ms.service: vs-appcenter
ms.custom: analytics
---

# Windows Support
App Center currently supports diagnostics for UWP, WPF, and WinForms applications. This section explains the new experience for UWP apps as part of the 2.5.0 SDK release. For more information on WPF and WinForms applications,
see [diagnostics features](~/diagnostics/features.md) and [WPF/WinForms SDK](~/sdk/crashes/wpf-winforms.md).

## Universal Windows Platform
App Center supports the full diagnostics feature set for both sideloaded and Windows Store UWP apps using the 2.5.0 SDK or later versions. To enable App Center’s diagnostics for your UWP app, follow [App Center's UWP SDK documentation](~/sdk/crashes/uwp.md) to integrate the App Center SDK. You can learn more about the complete feature set in the [diagnostics features documentation](~/diagnostics/features.md).

## New diagnostics experience
With the 2.5.0 SDK release in October 2019, App Center released a new diagnostics experience. This section details the improvements and transition experience with the new release.

### What improvements were made?
The new and improved diagnostics experience includes the following additions:

- A full symbolication experience that allows you to upload symbols in App Center. See the symbolication section below for more details.
- Support for handled exceptions
- Number of users affected per crash or error group
- Ability to add annotations per crash or error group
- Ability to mark crash and error groups as open, closed, or ignored
- Ability to download crash and error reports
- Ability to attach, view, and download one binary and one text attachment to your crash reports
- Crash and error report details per crash instance, including when the app launched, when it crashed, and what country and language the device used

You can learn more about each feature in the [App Center diagnostics documentation](~/diagnostics/features.md).

### What's the transition experience?
After you update to the App Center UWP SDK Version 2.5.0, you'll see crash and error data coming into the App Center Diagnostics portal in a new and improved UI. For crash and error data displayed in the new Diagnostics UI, you need to use the APIs listed under the [errors section](https://openapi.appcenter.ms/#/errors). Learn more about how the old crashes APIs map to the new errors APIs in the [API transition documentation](~/diagnostics/using-the-diagnostics-api.md#transitioning-to-the-new-apis).

## Symbolication
UWP crash reports show the stack trace for the thread that caused the crash. When the application is using .NET Native (typically in release builds) the stack trace may contain memory addresses instead of class names, methods, file names, and line numbers needed to read and understand the crashes.

### Unsymbolicated crashes
[!INCLUDE [unsymbolicated crashes](includes/unsymbolicated-crashes.md)]

### Uploading symbols
To get the memory addresses translated, you need to upload a `.appxsym` file to App Center, which contains all information required for symbolication.

#### Generate the symbols locally
To obtain an `.appxsym` file, you must create an app bundle as described [here](https://docs.microsoft.com/windows/msix/package/packaging-uwp-apps). Once you've created the bundle, you'll find the symbols file as an `.appxsym` file inside the app bundle folder.

#### Symbols for applications built in App Center Build
The App Center Build and Distribution services can automatically generate a valid symbol file and upload to the Diagnostics service. If you use App Center to build and auto distribute your app to your end users, you don't need to manually obtain and upload the symbol files to App Center.

#### Symbols for applications published to the Microsoft Store
When you publish your application to the store, the .NET Native compilation happens on server side. So, you need to download the symbols from the [Partner Center](https://partner.microsoft.com/dashboard/windows/overview).

1. Locate your application in the list and click on it.
2. Expand **Product management** menu from the left panel.
3. Click on **Manage packages**.
4. Click on **Show packages** on the top-right corner for the **Submission** (version) you want symbols for.
5. Locate the package for the version you need symbols for, and click on links for all the supported architectures to download all symbols (such as the **Download Windows 10 symbol file (x64)** link).

#### App Center Portal
[!INCLUDE [symbol upload ui](includes/symbol-upload-ui.md)]

#### App Center API
The process for uploading symbols through the API involves a series of three API calls: one to allocate space on our backend, one to upload the file, and one to update the status of the upload. The body of the first API call should set `symbol_type` to `UWP`.

[!INCLUDE [symbol upload api](includes/symbol-upload-api.md)]

#### App Center CLI
You can also use the CLI to upload symbol files:

```shell
appcenter crashes upload-symbols --appxsym {symbol file}
```

[!INCLUDE [ignoring symbols](includes/ignoring-symbols.md)]

## WinRT, Silverlight, and Other Platforms
App Center doesn't support any other Windows platforms besides UWP, WPF, and WinForms. If you have a Windows app with native C++ crashes, you can upload these crashes to App Center via the [upload crashes API](~/diagnostics/upload-crashes.md#upload-a-breakpad-crash-log-and-minidump). 

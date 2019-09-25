---
title: Windows Support
description: An overview of App Center's Windows support
keywords: crashes, diagnostics, errors, Windows, UWP, WinRT, WPF, Silverlight
author: winnieli1208
ms.author: yuli1
ms.date: 08/19/2019
ms.topic: article
ms.assetid: 8d48c68e-3fca-4dc4-b7d5-5f4474f8734f
ms.service: vs-appcenter
ms.custom: analytics
---

# Windows Support

> [!IMPORTANT]
> Our team has shipped diagnostics support for WPF and WinForms applications as a part of our Summer 2019 work! Refer to our [diagnostics features](~/diagnostics/features.md) and [WPF/WinForms SDK](~/sdk/crashes/wpf-winforms.md) pages for more information.

## Universal Windows Platform

> [!NOTE]
> We expect to make some improvements in our UWP support in the following months. Follow our proposed [Windows plan](https://github.com/microsoft/appcenter/blob/specs/specs/2019-04/Windows-Plan.md) for more details. You can leave us a comment or file a Github issue if you have any questions or feedback. See [help and feedback](../help.md).

App Center supports basic diagnostics features for UWP apps to help you fix your crashes. We have not yet implemented full feature parity for UWP apps so there are some known limitations and missing features compared to other supported platforms. To enable App Center’s diagnostics for your UWP app, make sure you have the App Center SDK integrated for your app. Learn more about the UWP SDK in [App Center's UWP SDK documentation](~/sdk/crashes/uwp.md).

### Features Supported

#### New Diagnostics UI
For crashes we support the new diagnostics UI which is the same as on other platforms. It is recommended way to access your crashes data. Please find more details on how to use it in [Using the Diagnostics UI](~/using-the-diagnostics-UI.md) section.

> [!NOTE]
> Handled errors support is coming.

#### Legacy UI
App Center SDK previously used the Windows crash reporting service built into Windows devices to send and process crash logs. For displaying those logs we have Legacy UI. If all of your applications use recent SDK, you don't need this legacy view.

We recommend to update your apps to use new SDK and get access to full featured new diagnostics UI.
##### Crash grouping

App Center groups your UWP crashes based on why and where the crash occurred. For each group, App Center displays the count, version and when the last crash in the group occurred, to help you prioritize and fix your crashes.

![App Center groups your crashes based on similarities](~/diagnostics/images/UWP-Crash-Groups.png)

##### Crash analytics

App Center displays a graph that indicates the number of crashes per day based on the selected time period.

![App Center shows you analytics on crashes](~/diagnostics/images/UWP-Analytics.png)

##### Crash group overview

Select a crash group to view the crash group stack trace and report details such as the most affected device and most affected OS. The full stack trace will only be displayed if you submit your app to the Windows store and upload the proper symbol files.

![App Center displays the stack trace and details of your crash group](~/diagnostics/images/UWP-Crash-Group-Overview.png)

##### Crash instance details

Select a crash report to view the crash stack trace and events. The full stack trace will only be displayed if you submit your app to the Windows store and upload the proper symbol files.

![App Center displays the stack trace and events of a crash instance](~/diagnostics/images/UWP-Crash-Instance.png)

### Submitting your app to the Microsoft Store

To distribute your app through the Microsoft Store, you must create an app package file and [submit the package](https://docs.microsoft.com/windows/uwp/publish/upload-app-packages) to [Partner Center](https://partner.microsoft.com/dashboard).
In creating your package file, you can include symbol files to upload to Partner Center. This will allow App Center to display symbolicated stack traces in legacy UI view.

Follow the [Windows packaging documentation](https://docs.microsoft.com/windows/uwp/packaging/index) to package your app.

## WinRT, Silverlight, and Other Platforms

App Center doesn't currently support any other Windows platforms besides UWP, WPF, and WinForms. You can find more details about future Windows platform support in App Center in our [Windows Plan on Github](https://github.com/Microsoft/appcenter/blob/windows/specs/2019-04/Windows-Plan.md). If you have any feedback or feature requests, please leave your [feedback](../../../help.md).

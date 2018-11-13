---
title: Windows Support
description: A overview of App Center's Windows support
keywords: crashes, errors, Windows, UWP, WinRT, WPF, Silverlight
author: winnieli1208
ms.author: yuli1
ms.date: 11/06/2018
ms.topic: article
ms.assetid: 8d48c68e-3fca-4dc4-b7d5-5f4474f8734f
ms.service: vs-appcenter
ms.custom: analytics 
---

# Windows Support

## Universal Windows Platform

App Center supports basic diagnostics features for UWP apps to help you fix your crashes. We have not yet implemented full feature parity for UWP apps so there are some known limitations and missing features compared to other supported platforms. To enable App Center’s diagnostics for your UWP app, make sure you have the App Center SDK integrated for your app. Learn more about the UWP SDK in [App Center's UWP SDK documentation](~/sdk/crashes/uwp.md).

### Features Supported
#### Crash grouping
App Center groups your UWP crashes based on why and where the crash occurred. For each group, App Center displays the count, version and when the last crash in the group occurred, to help you prioritize and fix your crashes.

![App Center groups your crashes based on similarities](~/diagnostics/images/UWP Crash Groups.png)

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
App Center works with the Windows crash reporting service built into Windows devices to send and process crash logs. Because of this, there are some known limitations unique to UWP apps. 

- Crash reporting is enabled only on devices running Windows 10 Creators update or more recent (version 10.0.15063).
- Crash reporting on Windows requires the app to be distributed through the Microsoft Store.
- Crashes will only be sent if the device is plugged in to power, this includes phones.
- Some crashes might appear unsymbolicated (missing method names or file names or even class names) from applications that are associated with Microsoft Store
- UWP only supports starting Crashes with `AppCenter.Start` and none of the other API calls provided by the Crashes class are supported


You also might notice some features you see in other platforms are missing for your UWP apps. These include the following:

- A full symbolication experience that allows you to upload symbols in App Center. To upload symbols for your UWP crashes, you must submit your app to the Microsoft store and submit your symbols filed to Microsoft Dev Center.
- Number of users affected per crash group.
- Ability to add annotations and keep track of notes and other improtant information for your crash groups.
- Ability to mark crash groups as open, closed, or ignored.
- Ability to attach, view and download one binary and one text attachment to your crash reports.
- Crash report details per crash instance including when the app was launched, when it crashes, and what country, network, and language the device is in.
- Ability to download crash reports.


### Submiting your app to the Microsoft Store

To submit your app through the Microsoft Store, you must create an app package file and submit the package to [Microsoft Dev Center](https://developer.microsoft.com/en-us/windows). In creating your package file, you can include symbol files to upload to Dev Center. This will allow App Center to display symbolicated stack traces. 

Follow the [Windows packaging documentation](https://docs.microsoft.com/en-us/windows/uwp/packaging/packaging-uwp-apps#create-an-app-package-upload-file) to package your app. 

 
## WinRT, WPF, and Silverlight 

App Center doesn’t currently support WinRT, WPF, Silverlight or any other Windows platforms. If you have any feedback or requests, please reach out to us using the blue chat button in the lower-right corner of any App Center page.

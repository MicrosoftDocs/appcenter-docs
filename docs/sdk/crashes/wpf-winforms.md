---
title: App Center Crashes for Windows
description: App Center Crashes for Windows
keywords: sdk, crash
author: winnieli1208
ms.author: yuli1
ms.date: 11/11/2019
ms.topic: article
ms.assetid: f4324186-2e6a-46a6-8916-53646cea7bc9
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: windows
---

# App Center Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [React Native](react-native.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Unity](unity.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center.

The App Center SDK collects only crashes caused by unhandled .NET exceptions. It does not collect native crashes e.g. when using C or C++.

Follow the [WPF/WinForms Getting Started](~/sdk/getting-started/wpf-winforms.md) if you haven't set up the SDK in your application yet.

## Unhandled exceptions on WinForms applications

> [!NOTE]
> This section and following sub sections apply only to WinForms. You can skip this section if you are integrating the SDK on WPF.

By default, an unhandled exception in a WinForms application does not trigger a crash (the application does not exit) if the debugger is not attached.

Instead, Windows shows a dialog to the user the option to continue or quit app execution. Consequently, the App Center SDK is unable to automatically capture these exceptions (even if the user clicks on the **Quit** button).

Crashes are collected on App Center only if it causes the application to exit automatically. App Center supports only one crash per session.

There are two ways to report unhandled exceptions in WinForms. The application can be configured to crash on unhandled exceptions, or continue running but report unhandled exceptions as runtime errors.

### Configure the application to exit on crash

This is the only way to report the unhandled exception as a **crash** on App Center, make the application exit on unhandled exceptions.

To do that, simply call a Windows method before initializing the SDK:

```csharp
Application.SetUnhandledExceptionMode(UnhandledExceptionMode.ThrowException);
AppCenter.Start(...);
```

If this option is not acceptable in your application, you can report the unhandled exception as a runtime error (described below).

### Report the unhandled exception as a runtime error

If your application must keep running after an unhandled exception, you cannot report the exception as a **crash** in App Center but you can instead report it as an **error**.

To do that, you can use the following code sample:

```csharp
Application.ThreadException += (sender, args) =>
{
    Crashes.TrackError(arg.Exception);
};
AppCenter.Start(...);
```

> [!NOTE]
> When the debugger is attached, unhandled exceptions will cause application to exit (crashes) **unless** a handler is attached to `Application.ThreadException`.

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API checks for debug vs release configurations. So you can only use it when debugging as it won't work for release apps.

```csharp
Crashes.GenerateTestCrash();
```

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```csharp
bool didAppCrash = await Crashes.HasCrashedInLastSessionAsync();
```

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred. Some developers choose to show additional UI to apologize to their users, or want a way to get in touch after a crash has occurred.

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```csharp
ErrorReport crashReport = await Crashes.GetLastSessionCrashReportAsync();
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `null` before start.

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [Crashes delegate or listener](#customize-your-usage-of-app-center-crashes).

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

> [!NOTE]
> You must set the callback *before* calling `AppCenter.Start()`, since App Center starts processing crashes immediately after the start.

### Should the crash be processed?

Set this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```csharp
Crashes.ShouldProcessErrorReport = (ErrorReport report) =>
{
    // Check the report in here and return true or false depending on the ErrorReport.
    return true;
};
```

### Ask for the user's consent to send a crash log

If user privacy is important to you, you might want to get user confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await user confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you will tell App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> The SDK does not display a dialog for this, the app must provide its own UI to ask for user consent.

> [!NOTE]
> The app should not call `NotifyUserConfirmation` explicitly if it does not implement a user confirmation dialog; the Crashes module will handle sending logs for you implicitly.

The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:

```csharp
Crashes.ShouldAwaitUserConfirmation = () =>
{
    // Build your own UI to ask for user consent here. SDK does not provide one by default.

    // Return true if you just built a UI for user consent and are waiting for user input on that custom UI, otherwise false.
    return true;
};
```

In case you return `true` in the callback above, your app must obtain (using your own code) user permission and message the SDK with the result using the following API.

```csharp
// Depending on the user's choice, call Crashes.NotifyUserConfirmation() with the right value.
Crashes.NotifyUserConfirmation(UserConfirmation.DontSend);
Crashes.NotifyUserConfirmation(UserConfirmation.Send);
Crashes.NotifyUserConfirmation(UserConfirmation.AlwaysSend);
```

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. App Center Crashes provides three different callbacks that you can use in your app to be notified of what is going on:

#### The following callback will be invoked before the SDK sends a crash log

```csharp
Crashes.SendingErrorReport += (sender, e) =>
{
    // Your code, e.g. to present a custom UI.
};
```

In the event we have network issues or we have an outage on the endpoint and you restart the app, `SendingErrorReport` is replayed after process restart.

#### The following callback will be invoked after the SDK sent a crash log successfully

```csharp
Crashes.SentErrorReport += (sender, e) =>
{
    // Your code, e.g. to hide the custom UI.
};
```

#### The following callback will be invoked if the SDK has failed to send a crash log

```csharp
Crashes.FailedToSendErrorReport += (sender, e) =>
{
    // Your code goes here.
};
```

When you receive `FailedToSendErrorReport`, it's a non recoverable error such as a **4XX** code which means something seriously wrong happened, for example wrong `appSecret` that cannot be retried.

Note that this callback will not be triggered if it's a network issue. In this case, it would keep retrying (and also pause retries while network is offline and wait for it to become up again). 

### Add attachments to a crash report

You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in App Center portal. The following callback will be invoked right before sending the stored crash from previous application launches. It will not be invoked when the crash happens. Here is an example of how to attach text and an image to a crash:

```csharp
Crashes.GetErrorAttachments = (ErrorReport report) =>
{
    // Your code goes here.
    return new ErrorAttachmentLog[]
    {
        ErrorAttachmentLog.AttachmentWithText("Hello world!", "hello.txt"),
        ErrorAttachmentLog.AttachmentWithBinary(Encoding.UTF8.GetBytes("Fake image"), "fake_image.jpeg", "image/jpeg")
    };
};
```

> [!NOTE]
> The size limit is currently 7 MB. Attempting to send a larger attachment will trigger an error.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```csharp
Crashes.SetEnabledAsync(false);
```

To enable App Center Crashes again, use the same API but pass `true` as a parameter.

```csharp
Crashes.SetEnabledAsync(true);
```

You don't need to await this call to make other API calls (such as `IsEnabledAsync`) consistent.

The state is persisted in the device's storage across application launches.

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```csharp
bool isEnabled = await Crashes.IsEnabledAsync();
```

## Handled Errors

App Center also allows you to track errors by using handled exceptions.
In order to do so, simply use the `TrackError` method:

```csharp
try {
    // your code goes here.
} catch (Exception exception) {
    Crashes.TrackError(exception);
}
```

An app can optionally attach properties to a handled error report to provide further context. Pass the properties as a dictionary of key/value pairs (strings only) as shown in the example below.

```csharp
try {
    // your code goes here.
} catch (Exception exception) {
    var properties = new Dictionary<string, string>
    {
        { "Category", "Music" },
        { "Wifi", "On"}
    };
    Crashes.TrackError(exception, properties); 
}
```

You can also optionally add **one binary** and **one text** attachment to a handled error report. Pass the attachments as an array of `ErrorAttachmentLog` objects as shown in the example below.

```csharp
try {
    // your code goes here.
} catch (Exception exception) {
    var attachments = new ErrorAttachmentLog[]
    {
        ErrorAttachmentLog.AttachmentWithText("Hello world!", "hello.txt"),
        ErrorAttachmentLog.AttachmentWithBinary(Encoding.UTF8.GetBytes("Fake image"), "fake_image.jpeg", "image/jpeg")
    };
    Crashes.TrackError(exception, attachments: attachments);
}
```

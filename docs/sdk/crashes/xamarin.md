---
title: App Center Crashes for Xamarin
description: App Center Crashes for Xamarin
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 11/11/2019
ms.topic: article
ms.assetid: 582bf961-0e4d-4fe0-9731-0a57fd1c222b
ms.custom: sdk
ms.tgt_pltfrm: xamarin
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

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/xamarin.md) section if you haven't set up the SDK in your application yet.

Also note that crash logs on iOS require Symbolication, please check out the [App Center Diagnostics documentation](~/diagnostics/iOS-symbolication.md) that explains how to provide symbols for your app.

> [!NOTE]
> On Xamarin.iOS, the SDK will not save any crash log if you attached a debugger. Make sure the debugger is not attached when you crash the iOS app. On Xamarin.Android, you can crash while having debugger attached but you need to continue execution after breaking into the unhandled exception.

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API checks for debug vs release configurations. So you can only use it when debugging as it won't work for release apps.

```csharp
Crashes.GenerateTestCrash();
```

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app receive a low memory warning in the previous session?

At any time after starting the SDK, you can check if the app received a memory warning in the previous session:

```csharp
bool hadMemoryWarning = await Crashes.HasReceivedMemoryWarningInLastSessionAsync();
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.

> [!NOTE]
> In some cases, a device with low memory may not be able to send events.

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

As an example you can refer to [our custom dialog example](https://aka.ms/custom-dialog-xamarin).

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. App Center Crashes provides three different callbacks that you can use in your app to be notified of what is going on:

#### The following callback will be invoked before the SDK sends a crash log

```csharp
Crashes.SendingErrorReport += (sender, e) =>
{
    // Your code, e.g. to present a custom UI.
};
```

In case we have network issues or we have an outage on the endpoint and you restart the app, `SendingErrorReport` is triggered again after process restart.

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

Receiving `FailedToSendErrorReport` means a non-recoverable error such as a **4xx** code occurred. For example, **401** means the `appSecret` is wrong.

Note that this callback is not triggered if it's a network issue. In this case, the SDK keeps retrying (and also pauses retries while the network connection is down).

### Add attachments to a crash report

You can add binary and text attachments to a crash report. The SDK will send them along with the crash so that you can see them in App Center portal. The following callback will be invoked right before sending the stored crash from previous application launches. It will not be invoked when the crash happens. Please be sure the attachment file is **not** named `minidump.dmp` as that name is reserved for minidump files. Here is an example of how to attach text and an image to a crash:

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

> [!NOTE]
> This method must only be used after `Crashes` has been started.

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```csharp
bool isEnabled = await Crashes.IsEnabledAsync();
```

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.

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

You can also optionally add binary and text attachments to a handled error report. Pass the attachments as an array of `ErrorAttachmentLog` objects as shown in the example below.

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

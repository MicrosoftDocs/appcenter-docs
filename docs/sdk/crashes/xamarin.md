---
title: App Center Crashes for Xamarin
description: App Center Crashes for Xamarin
keywords: sdk, crash
author: elamalani
ms.author: emalani
ms.date: 11/20/2018
ms.topic: article
ms.assetid: 6a102584-57ad-4b84-9fa1-8c2fd8b903ef
ms.service: vs-appcenter
ms.custom: sdk
ms.tgt_pltfrm: xamarin
---

# App Center Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [macOS](macos.md)
> * [Unity](unity.md)
> * [UWP](uwp.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/xamarin.md) section if you haven't set up the SDK in your application yet.

Also note that crash logs on iOS require Symbolication, please check out the [App Center Diagnostics documentation](~/diagnostics/iOS-symbolication.md) that explains how to provide symbols for your app.

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

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occurred.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```csharp
ErrorReport crashReport = await Crashes.GetLastSessionCrashReportAsync();
```

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [Crashes delegate or listener](#customize-your-usage-of-app-center-crashes).

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

### Should the crash be processed?

Set this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```csharp
Crashes.ShouldProcessErrorReport = (ErrorReport report) =>
{
     // Check the report in here and return true or false depending on the ErrorReport.
    return true;
};
```

### Ask for the users' consent to send a crash log

If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await your users' confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you will tell the App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> No dialog is shown by the SDK, it is up to you to provide UI code if you want to ask for users' consent.

The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:

```csharp
Crashes.ShouldAwaitUserConfirmation = () =>
{
    // Build your own UI to ask for user consent here. SDK does not provide one by default.

    // Return true if you just built a UI for user consent and are waiting for user input on that custom U.I, otherwise false.
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

### Add attachments to a crash report

You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in App Center portal. The following callback will be invoked if you want to add attachments to a crash report:

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

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```csharp
bool isEnabled = await Crashes.IsEnabledAsync();
```

## Handled Errors in Xamarin

App Center also allows you to track errors by using handled exceptions in Xamarin.
In order to do so, simply use the `TrackError` method:

```csharp
try {
    // your code goes here.
} catch (Exception exception) {
    Crashes.TrackError(exception);
}
```

For further context about your error, you can also attach properties to it. To do so, pass these properties as a dictionary of strings. This step is optional.

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

---
title: App Center Crashes for Unity
description: Reporting crashes from Unity apps in App Center
keywords: crash reporting
author: jwhitedev
ms.author: jawh
ms.date: 10/28/2019
ms.topic: article
ms.assetid: 462e7acf-5033-46f9-9554-d029ad9b933a
ms.service: vs-appcenter
ms.custom: crashes
ms.tgt_pltfrm: unity
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

App Center Crashes automatically generates a crash log every time your app crashes, with a log to device storage. When a user starts the app again, the SDK sends the crash report to App Center. Collecting crashes works for both beta and live apps, that is, crashes submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.

Follow the instructions in the [Unity Getting Started](~/sdk/getting-started/unity.md) section if you haven't set up the SDK in your application yet.

Crash logs on iOS require Symbolication. To enable symbolication, refer to the [App Center Diagnostics documentation](~/diagnostics/iOS-symbolication.md), which explains how to provide symbols for your app.

> [!IMPORTANT]
> The current SDK does not support Crashes for Unity when running on UWP, the instructions in this page cover only Android and iOS.

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API checks for debug vs release configurations. So you can only use it when debugging as it won't work for release apps.

```csharp
Crashes.GenerateTestCrash();
```

> [!NOTE]
> This method will only work with **Development Build** setting turned on.

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app receive a low memory warning in the previous session?

At any time after starting the SDK, you can check if the app received a memory warning in the previous session:

```csharp
bool hadLowMemoryWarning = Crashes.HasReceivedMemoryWarningInLastSessionAsync().Result;
```

> [!NOTE]
> This method will not work in `Awake()`.

> [!NOTE]
> In some cases, a device with low memory may not be able to send events.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```csharp
bool didAppCrash = await Crashes.HasCrashedInLastSessionAsync();
```

Calling `HasCrashedInLastSessionAsync` is useful if you want to adjust the behavior or UI of your app after a crash has occurred. Some developers show additional UI to apologize to their users, or want to get in touch after a crash has occurred.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```csharp
ErrorReport crashReport = await Crashes.GetLastSessionCrashReportAsync();
```

The most common use case for this API is when a user is implementing their custom [Crashes delegate or listener](#customize-your-usage-of-app-center-crashes).

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to take additional actions before and when they send crash logs to App Center.

> [!NOTE]
> You must set the callback *before* App Center starts, For example in `Awake` method, since App Center starts processing crashes immediately after the start.

### Should the crash be processed?

Set the following callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you want to ignore and not send to App Center.

```csharp
Crashes.ShouldProcessErrorReport = (ErrorReport report) =>
{
     // Check the report in here and return true or false depending on the ErrorReport.
    return true;
};
```

### Ask for the user's consent to send a crash log

If user privacy is important to you, you might want to get user confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await user confirmation before sending any crash reports.

If your code uses this callback, you are responsible for obtaining the user's confirmation. One option is through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you'll tell the App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> The SDK does not display a dialog for this, the app must provide its own UI to ask for user consent.

The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:

```csharp
Crashes.ShouldAwaitUserConfirmation = () =>
{
    // Build your own UI to ask for user consent here. SDK does not provide one by default.

    // Return true if you just built a UI for user consent and are waiting for user input on that custom UI, otherwise false.
    return true;
};
```

If the callback returns `true` you must obtain user permission, and message the SDK with the result using the following API.

```csharp
// Depending on the user's choice, call Crashes.NotifyUserConfirmation() with the right value.
Crashes.NotifyUserConfirmation(UserConfirmation.DontSend);
Crashes.NotifyUserConfirmation(UserConfirmation.Send);
Crashes.NotifyUserConfirmation(UserConfirmation.AlwaysSend);
```

As an example you can refer to [our custom dialog example](https://aka.ms/custom-dialog-xamarin).

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is displaying a UI that informs the user the app is submitting a crash report. Another Scenario is when you want to adjust the behavior of the app to ensure the crash logs can be submitted shortly after relaunch. App Center Crashes provides three different callbacks you can make to be notified of what has taken place:

#### The following callback will be invoked before the SDK sends a crash log

```csharp
Crashes.SendingErrorReport += (errorReport) =>
{
    // Your code, e.g. to present a custom UI.
};
```

#### The following callback will be invoked after the SDK sent a crash log successfully

```csharp
Crashes.SentErrorReport += (errorReport) =>
{
    // Your code, e.g. to hide the custom UI.
};
```

#### The following callback will be invoked if the SDK has failed to send a crash log

```csharp
Crashes.FailedToSendErrorReport += (errorReport, exception) =>
{
    // Your code goes here.
};
```

### Add attachments to a crash or an unhandled exception report

You can add **one binary** and **one text** attachment to a crash or an [unhandled exception](#unhandled-exceptions-in-unity) report. The SDK will send it along with the report so that you can see it in App Center portal. The following callback will be invoked right before sending the stored report. For crashes it happens on the next application launch. For unhandled exceptions, you must [opt-in](#add-attachments-to-an-unhandled-exception-report) to be able to send attachments. Here is an example of how to attach text and an image to a report:

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

Crashes are differentiated from unhandled exceptions in reports with the `IsCrash` property. The property will be true for crashes and false otherwise.

> [!NOTE]
> The size limit is for attachments currently 7 MB. Attempting to send a larger attachment will trigger an error.

> [!NOTE]
> `GetErrorAttachments` is invoked on the main thread and does not split work over frames. To avoid blocking the game loop, do not perform any long running tasks in this callback.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK will not perform any crash reporting for the app.

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

You can also check whether App Center Crashes is enabled:

```csharp
bool isEnabled = await Crashes.IsEnabledAsync();
```

## Handled Exceptions in Unity

App Center also allows you to track errors using handled exceptions in Unity. To do so, use the `TrackError` method:

```csharp
try {
    // your code goes here.
} catch (Exception exception) {
    Crashes.TrackError(exception);
}
```

For further context about your error, you can also attach properties to it. Pass the properties as a dictionary of strings. This step is optional.

```csharp
try {
    // your code goes here.
} catch (Exception exception) {
    var properties = new Dictionary<string, string>
    {
        { "Category", "Music" },
        { "Wifi", "On" }
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

## Unhandled Exceptions in Unity

### Report unhandled exceptions

By default, the App Center SDK doesn't report unhandled exceptions thrown in your app that don't cause a fatal crash. To enable this functionality, call the following method:

```csharp
Crashes.ReportUnhandledExceptions(true);
```

After calling this API, App Center logs  all unhandled exceptions as Issues in the App Center portal, similar to handled exceptions mentioned earlier. To disable this functionality, call the same API passing `false` as the parameter.

```csharp
Crashes.ReportUnhandledExceptions(false);
```

> [!NOTE]
> Some unhandled exceptions detected by the App Center SDK will appear as errors in the App Center UI. This is because Unity catches unhandled exceptions by default, meaning the app doesn't exit and therefore is not considered a crash. 

### Add attachments to an unhandled exception report

By default, the App Center SDK doesn't enable attachments on unhandled exceptions. To enable this functionality, set the `enableAttachmentsCallback` boolean parameter of the `ReportUnhandledExceptions` method to `true`:

```csharp
Crashes.ReportUnhandledExceptions(true, true);
```

Then you can optionally add attachments to an unhandled exception report by implementing the [GetErrorAttachments](#add-attachments-to-a-crash-or-an-unhandled-exception-report) callback.

## Reporting NDK crashes

### Reporting crashes

To receive proper crash reports in App Center, first make sure you have the App Center Crashes SDK set up by following the instructions listed above.

#### Building the breakpad library

Next, you must include and compile Google Breakpad by following the instructions listed in the official [Google Breakpad for Android README](https://github.com/google/breakpad/blob/master/README.ANDROID). In order to use it in Unity, just include the binary with your app.

> [!NOTE]
> The App Center SDK does not bundle Google Breakpad by default.

#### Attaching the exception handler

Once you have Google Breakpad included, attach the NDK Crash Handler:

```csharp
/* Attach NDK Crash Handler. */
var minidumpDir = Crashes.GetMinidumpDirectoryAsync();
setupNativeCrashesListener(minidumpDir.Result);

...

[DllImport("YourLib")]
private static extern void setupNativeCrashesListener(string path);
```

The method `setupNativeCrashesListener` is a native method that you must implement in C/C++:

```cpp
#include <android/log.h>
#include "google-breakpad/src/client/linux/handler/exception_handler.h"
#include "google-breakpad/src/client/linux/handler/minidump_descriptor.h"

static google_breakpad::ExceptionHandler exception_handler(google_breakpad::MinidumpDescriptor(), NULL, dumpCallback, NULL, true, -1);

/**
 * Registers breakpad as the exception handler for NDK code.
 * @param path minidump directory path returned from Crashes.GetMinidumpDirectoryAsync()
 */
extern "C" void setupNativeCrashesListener(const char *path) {
    google_breakpad::MinidumpDescriptor descriptor(path);
    exception_handler.set_minidump_descriptor(descriptor);
}
```

Where `dumpCallback` is used for troubleshooting:

```cpp
/*
 * Triggered automatically after an attempt to write a minidump file to the breakpad folder.
 */
static bool dumpCallback(const google_breakpad::MinidumpDescriptor &descriptor,
                         void *context,
                         bool succeeded) {

    /* Allow system to log the native stack trace. */
    __android_log_print(ANDROID_LOG_INFO, "YourLogTag",
                        "Wrote breakpad minidump at %s succeeded=%d\n", descriptor.path(),
                        succeeded);
    return false;
}
```

Once these methods are properly set up, the app sends the minidump to App Center automatically upon restart. To troubleshoot, you can use verbose logs to check if minidumps are sent after the app is restarted.

> [!NOTE]
> The app sends the minidump file as a binary attachment to App Center. Since App Center allows only one binary attachment, you can send only text attachments with the native crash report.

> [!WARNING]
> There is a known bug in breakpad which makes it impossible to capture crashes on x86 emulators.

### Symbolication

[!include[](./ndk-symbolication.md)]

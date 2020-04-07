---
title: App Center Crashes for Android
description:  App Center Crashes for Android
keywords: sdk, crash
author: winnie
ms.author: yuli1
ms.date: 02/04/2019
ms.topic: article
ms.assetid: a9ac95b3-488f-40c5-ad11-99d8da0fa00b
ms.custom: sdk
ms.tgt_pltfrm: android
dev_langs:
 - java
 - kotlin
---

# App Center Crashes

> [!div  class="op_single_selector"]
> * [Android](android.md)
> * [iOS](ios.md)
> * [React Native](react-native.md)
> * [Xamarin](xamarin.md)
> * [UWP](uwp.md)
> * [WPF/WinForms](wpf-winforms.md)
> * [Unity](unity.md)
> * [macOS](macos.md)
> * [tvOS](tvos.md)
> * [Cordova](cordova.md)

App Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to App Center. Collecting crashes works for both beta and live apps, i.e. those submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.

Please follow the [Getting Started](~/sdk/getting-started/android.md) section if you haven't set up the SDK in your application yet.

## Generate a test crash

App Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in debug builds and won't do anything in release builds.

```java
Crashes.generateTestCrash();
```
```kotlin
Crashes.generateTestCrash()
```

## Get more information about a previous crash

App Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app receive a low memory warning in the previous session?

At any time after starting the SDK, you can check if the app received a memory warning in the previous session:

```java
Crashes.hasReceivedMemoryWarningInLastSession();
```
```kotlin
Crashes.hasReceivedMemoryWarningInLastSession()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.

> [!NOTE]
> In some cases, a device with low memory may not be able to send events.

### Did the app crash in the previous session?

At any time after starting the SDK, you can check if the app crashed in the previous launch:

```java
Crashes.hasCrashedInLastSession();
```
```kotlin
Crashes.hasCrashedInLastSession()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occurred. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occurred.

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.

### Details about the last crash

If your app crashed previously, you can get details about the last crash.

```java
Crashes.getLastSessionCrashReport();
```
```kotlin
Crashes.getLastSessionCrashReport()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

There are numerous use cases for this API, the most common one is people who call this API and implement their custom [CrashesListener](#customize-your-usage-of-app-center-crashes).

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `null` before start.

## Customize your usage of App Center Crashes

App Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to App Center.

To handle the callbacks, you must either implement all methods in the `CrashesListener` interface, or override the `AbstractCrashesListener` class and pick only the ones you're interested in.

### Use your own CrashesListener

Create your own CrashesListener and assign it like this:

```java
CrashesListener customListener = new CrashesListener() {
    // Implement all callbacks here.
};
Crashes.setListener(customListener);
```
```kotlin
val customListener = object : CrashesListener {
    // Implement all callbacks here.
}
Crashes.setListener(customListener)
```

In case you are only interested in customizing some of the callbacks, use the `AbstractCrashesListener` instead:

```java
AbstractCrashesListener customListener = new AbstractCrashesListener() {
    // Implement any callback here as required.
};
Crashes.setListener(customListener);
```
```kotlin
val customListener = object : AbstractCrashesListener() {
    // Implement any callback here as required.
}
Crashes.setListener(customListener)
```

> [!NOTE]
> You must set the listener *before* calling `AppCenter.start()`, since App Center starts processing crashes immediately after the start.

### Should the crash be processed?

Implement this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to App Center.

```java
@Override
public boolean shouldProcess(ErrorReport report) {
    return true; // return true if the crash report should be processed, otherwise false.
}
```
```kotlin
override fun shouldProcess(report: ErrorReport?): Boolean {
    return true
}
```

### Ask for the user's consent to send a crash log

If user privacy is important to you, you might want to get user confirmation before sending a crash report to App Center. The SDK exposes a callback that tells App Center Crashes to await user confirmation before sending any crash reports.

If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you will tell App Center Crashes what to do and the crash will then be handled accordingly.

> [!NOTE]
> The SDK does not display a dialog for this, the app must provide its own UI to ask for user consent.

The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:

```java
@Override
public boolean shouldAwaitUserConfirmation() {

    // Build your own UI to ask for user consent here. SDK does not provide one by default.

    // Return true if you just built a UI for user consent and are waiting for user input on that custom UI, otherwise false.
    return true;
}
```
```kotlin
override fun shouldAwaitUserConfirmation(): Boolean {
    return true
}
```

If you return `true`, your app must obtain (using your own code) the user's permission and message the SDK with the result using the following API:

```java
// Depending on the user's choice, call Crashes.notifyUserConfirmation() with the right value.
Crashes.notifyUserConfirmation(Crashes.DONT_SEND);
Crashes.notifyUserConfirmation(Crashes.SEND);
Crashes.notifyUserConfirmation(Crashes.ALWAYS_SEND);
```
```kotlin
Crashes.notifyUserConfirmation(Crashes.DONT_SEND)
Crashes.notifyUserConfirmation(Crashes.SEND)
Crashes.notifyUserConfirmation(Crashes.ALWAYS_SEND)
```

As an example you can refer to [our custom dialog example](https://aka.ms/custom-dialog-android).

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. App Center Crashes has three different callbacks that you can use in your app to be notified of what is going on:

#### The following callback will be invoked before the SDK sends a crash log

```java
@Override
public void onBeforeSending(ErrorReport errorReport) {
    // Your code, e.g. to present a custom UI.
}
```
```kotlin
override fun onBeforeSending(report: ErrorReport?) {
    // Your code, e.g. to present a custom UI.
}
```

In case we have network issues or we have an outage on the endpoint and you restart the app, `onBeforeSending` is triggered again after process restart.

#### The following callback will be invoked after the SDK sent a crash log successfully

```java
@Override
public void onSendingSucceeded(ErrorReport report) {
    // Your code, e.g. to hide the custom UI.
}
```
```kotlin
override fun onSendingSucceeded(report: ErrorReport?) {
    // Your code, e.g. to hide the custom UI.
}
```

#### The following callback will be invoked if the SDK failed to send a crash log

```java
@Override
public void onSendingFailed(ErrorReport report, Exception e) {
    // Your code goes here.
}
```
```kotlin
override fun onSendingFailed(report: ErrorReport?, e: Exception?) {
    // Your code goes here.
}
```

Receiving `onSendingFailed` means a non-recoverable error such as a **4xx** code occurred. For example, **401** means the `appSecret` is wrong.

Note that this callback is not triggered if it's a network issue. In this case, the SDK keeps retrying (and also pauses retries while the network connection is down). 

### Add attachments to a crash report

You can add binary and text attachments to a crash report. The SDK will send them along with the crash so that you can see them in App Center portal. The following callback will be invoked right before sending the stored crash from previous application launches. It will not be invoked when the crash happens. Please be sure the attachment file is **not** named `minidump.dmp` as that name is reserved for minidump files. Here is an example of how to attach text and an image to a crash:

```java
@Override
public Iterable<ErrorAttachmentLog> getErrorAttachments(ErrorReport report) {

    // Attach some text.
    ErrorAttachmentLog textLog = ErrorAttachmentLog.attachmentWithText("This is a text attachment.", "text.txt");

    // Attach binary data.
    byte[] binaryData = getYourBinary();
    ErrorAttachmentLog binaryLog = ErrorAttachmentLog.attachmentWithBinary(binaryData, "your_filename.jpeg", "image/jpeg");

    // Return attachments as list.
    return Arrays.asList(textLog, binaryLog);
}
```
```kotlin
override fun getErrorAttachments(report: ErrorReport?): MutableIterable<ErrorAttachmentLog> {

    // Attach some text.
    val textLog = ErrorAttachmentLog.attachmentWithText("This is a text attachment.", "text.txt")

    // Attach binary data.
    val binaryData = getYourBinary()
    val binaryLog = ErrorAttachmentLog.attachmentWithBinary(binaryData, "your_filename.jpeg", "image/jpeg")

    // Return attachments as list.
    return listOf(textLog, binaryLog)
}
```

> [!NOTE]
> The size limit is currently 7 MB. Attempting to send a larger attachment will trigger an error.

## Enable or disable App Center Crashes at runtime

You can enable and disable App Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.

```java
Crashes.setEnabled(false);
```
```kotlin
Crashes.setEnabled(false)
```


To enable App Center Crashes again, use the same API but pass `true` as a parameter.

```java
Crashes.setEnabled(true);
```
```kotlin
Crashes.setEnabled(true)
```

The state is persisted in the device's storage across application launches.

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Crashes` has been started.

## Check if App Center Crashes is enabled

You can also check if App Center Crashes is enabled or not:

```java
Crashes.isEnabled();
```
```kotlin
Crashes.isEnabled()
```

[!INCLUDE [android see async](../includes/android-see-async.md)]

> [!NOTE]
> This method must only be used after `Crashes` has been started, it will always return `false` before start.

## Handled Errors

App Center also allows you to track errors by using handled exceptions.
In order to do so, simply use the `trackError` method:

```java
try {
    // your code goes here.
} catch (Exception exception) {
    Crashes.trackError(exception);
}
```
```kotlin
try {
    // your code goes here.
} catch (exception: Exception) {
    Crashes.trackError(exception)
}
```

An app can optionally attach properties to a handled error report to provide further context. Pass the properties as a map of key/value pairs (strings only) as shown in the example below.

```java
try {
    // your code goes here.
} catch (Exception exception) {
    Map<String, String> properties = new HashMap<String, String>() {{
        put("Category", "Music");
        put("Wifi", "On");
    }};
    Crashes.trackError(exception, properties, null);
}
```
```kotlin
try {
    // your code goes here.
} catch (exception: Exception) {
    val properties = mapOf("Category" to "Music", "Wifi" to "On")
    Crashes.trackError(exception, properties, null)
}
```

You can also optionally add binary and text attachments to a handled error report. Pass the attachments as an `Iterable` as shown in the example below.


```java
try {
    // your code goes here.
} catch (Exception exception) {

    // Attach some text.
    ErrorAttachmentLog textLog = ErrorAttachmentLog.attachmentWithText("This is a text attachment.", "text.txt");

    // Attach binary data.
    byte[] binaryData = getYourBinary();
    ErrorAttachmentLog binaryLog = ErrorAttachmentLog.attachmentWithBinary(binaryData, "your_filename.jpeg", "image/jpeg");

    // Track an exception with attachments.
    Crashes.trackException(exception, null, Arrays.asList(textLog, binaryLog));
}
```
```kotlin
try {
    // your code goes here.
} catch (exception: Exception) {

    // Attach some text.
    val textLog = ErrorAttachmentLog.attachmentWithText("This is a text attachment.", "text.txt")

    // Attach binary data.
    val binaryData = getYourBinary()
    val binaryLog = ErrorAttachmentLog.attachmentWithBinary(binaryData, "your_filename.jpeg", "image/jpeg")

    // Track an exception with attachments.
    Crashes.trackException(exception, null, listOf(textLog, binaryLog))
}
```

## Reporting NDK crashes

### Reporting crashes

To receive proper crash reports in App Center, first make sure you have the App Center Crashes SDK set up by following the instructions listed above.

#### Building the breakpad library

Next, you must include and compile Google Breakpad by following the instructions listed in the official [Google Breakpad for Android README](https://github.com/google/breakpad/blob/master/README.ANDROID).

> [!NOTE]
> The App Center SDK does not bundle Google Breakpad by default.

#### Attaching the exception handler

Once you have Google Breakpad included, attach the NDK Crash Handler after `AppCenter.start`:

```java
// Attach NDK Crash Handler after SDK is initialized.
Crashes.getMinidumpDirectory().thenAccept(new AppCenterConsumer<String>() {
    @Override
    public void accept(String path) {

        // Path is null when Crashes is disabled.
        if (path != null) {
            setupNativeCrashesListener(path);
        }
    }
});
```

The method `setupNativeCrashesListener` is a native method that you must implement in C/C++:

```cpp
#include "google-breakpad/src/client/linux/handler/exception_handler.h"
#include "google-breakpad/src/client/linux/handler/minidump_descriptor.h"

void Java_com_microsoft_your_package_YourActivity_setupNativeCrashesListener(
        JNIEnv *env, jobject, jstring path) {
    const char *dumpPath = (char *) env->GetStringUTFChars(path, NULL);
    google_breakpad::MinidumpDescriptor descriptor(dumpPath);
    new google_breakpad::ExceptionHandler(descriptor, NULL, dumpCallback, NULL, true, -1);
    env->ReleaseStringUTFChars(path, dumpPath);
}
```

Where `dumpCallback` is used for troubleshooting:

```cpp
/*
 * Triggered automatically after an attempt to write a minidump file to the breakpad folder.
 */
bool dumpCallback(const google_breakpad::MinidumpDescriptor &descriptor,
                  void *context,
                  bool succeeded) {

    // Allow system to log the native stack trace.
    __android_log_print(ANDROID_LOG_INFO, "YourLogTag",
                        "Wrote breakpad minidump at %s succeeded=%d\n", descriptor.path(),
                        succeeded);
    return false;
}
```

Once these methods are properly set up, the app sends the minidump to App Center automatically upon restart.
To troubleshoot, you can use verbose logs (`AppCenter.setLogLevel(Log.VERBOSE)` before `AppCenter.start`) to check if minidumps are sent after the app is restarted.

> [!NOTE]
> App Center uses the reserved name `minidump.dmp` for minidump attachments. Please make sure to give your attachment a different name unless it is a minidump file so we can handle it properly.

> [!NOTE]
> There is a known bug in breakpad which makes it impossible to capture crashes on x86 emulators.

### Symbolication

See the [Diagnostics documentation](~/diagnostics/Android-NDK.md) for more information regarding the processing of crashes.

---
title: Android NDK
description: Learn how to symbolicate your Android NDK crash reports
keywords: crashes, Android, NDK, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 04/16/2019
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57
ms.service: vs-appcenter
ms.custom: analytics 
---

# Android NDK

Android NDK allows you to implement parts of your Android apps using C and C++. You can use the Google Breakpad client library for your Android apps to receive valid stack traces in native code. The stack traces may only contain memory addresses and don’t show class names, methods, file names, and line numbers needed to read and understand the crashes.

To get the memory addresses translated for your Android NDK app, you must upload symbols for each build using [Google's Breakpad tool](https://github.com/google/breakpad/blob/master/docs/getting_started_with_breakpad.md)

## Reporting crashes

To receive proper crash reports in App Center, first make sure you have the App Center crashes SDK set up by following the instructions listed in our[Android SDK documentation](~/sdk/crashes/android.md).

Next you must include and compile Google Breakpad by following the instructions listed in the official [Google Breakpad for Android README](https://github.com/google/breakpad/blob/master/README.ANDROID).

> [!NOTE]
> The App Center SDK does not bundle Google Breakpad by default.

Once you have Google Breakpad included, attach the NDK Crash Handler after `AppCenter.start`:

```java
/* Attach NDK Crash Handler after SDK is initialized. */
Crashes.getMinidumpDirectory().thenAccept(new AppCenterConsumer<String>() {.
    @Override
    public void accept(String path) {

        /* Path is null when Crashes is disabled. */
        if (path != null) {
            setupNativeCrashesListener(path);
        }
    }
});
```

The method `setupNativeCrashesListener` is a native method that you must implement in C/C++:

```c
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

```c
/*
* Triggered automatically after an attempt to write a minidump file to the breakpad folder.
*/
bool dumpCallback(const google_breakpad::MinidumpDescriptor &descriptor,
                  void *context,
                  bool succeeded) {

    /* Allow system to log the native stack trace. */
    __android_log_print(ANDROID_LOG_INFO, "YourLogTag",
                        "Wrote breakpad minidump at %s succeeded=%d\n", descriptor.path(),
                        succeeded);
    return false;
}
```
 
Once these methods are properly set up, the minidump will be sent to App Center automatically upon restart. To troubleshoot, you can use verbose logging `(AppCenter.setLogLevel(Log.VERBOSE) before AppCenter.start)`, to check if minidumps are found and sent after the app is restarted.

> [!NOTE]
There are known cases where breakpad is unable to capture anything on x86 emulator.

## Symbolication

### Obtaining symbol files

1. Dump the symbols using the Breakpad toolchain as described in the [Breakpad documentation](https://chromium.googlesource.com/breakpad/breakpad/+/master/README.ANDROID#93).
2. Create a symbols.zip file with the following structure:

```text
$ unzip -l symbols.zip 
Archive:  symbols.zip
  Length     Date   Time    Name
 --------    ----   ----    ----
        0  07-22-13 15:07   symbols/
        0  07-22-13 15:07   symbols/libnative.so/
        0  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/
    12468  07-22-13 15:07   symbols/libnative.so/EAC901FB6DDCCE8AED89E1A8E4A58360/libnative.so.sym
        0  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/
    12467  07-22-13 15:07   symbols/libnative.so/FDC5C9E715C4F16408C0B78F95855BF0/libnative.so.sym
 --------                   -------
    24935                   6 files
```

### Uploading symbol files

1. Log into App Center and select your app
2. In the left menu, navigate to the **Diagnostics** section
3. Select the **Unsymbolicated** tab
4. In the top-right corner, click **Upload symbols** and upload the zip file
5. After the zip file is indexed by App Center, new incoming crashes will be symbolicated for you

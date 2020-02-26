---
title: Using Breakpad with an App
description: Learn how to symbolicate your App's unmanaged code crashes
keywords: unmanaged, crashes, upload, symbolication
author: bryansmith //TODO: winnie?
ms.author: yuli1  //TODO: wat?
ms.date: 2/25/2020
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57 //TODO: new guid?
ms.service: vs-appcenter
ms.custom: diagnostics
---

# Symbolicating Unmanaged Code Crashes

App Center Diagnostics supports the ability to symbolicate unmanaged code crashes in your application.
You can symbolicate unmanaged code crashes which originate in your [Android NDK code](~/diagnostics/Android-NDK.md), as well as unmanaged code crashes formatted as [Breakpad minidumps](~/diagnostics/using-breakpad-with-an-app.md#using-breakpad-with-app-center) uploaded through the [Upload Crashes API](~/diagnostics/upload-crashes.md#upload-a-crash-report).

## Using Breakpad with App Center

[Breakpad](https://github.com/google/breakpad/blob/master/docs/getting_started_with_breakpad.md) is a library and tool suite which helps produce C and C++ stack traces. These stack traces are generated from [`minidump` files](https://github.com/google/breakpad/blob/master/docs/getting_started_with_breakpad.md#the-minidump-file-format) produced once Breakpad is integrated with your project.
Breakpad offers starter guides for integrating with [Linux](https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/linux_starter_guide.md), [Windows](https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/windows_client_integration.md), and [Mac](https://chromium.googlesource.com/breakpad/breakpad/+/master/docs/mac_breakpad_starter_guide.md) applications.

## Sending Breakpad Crash Logs to App Center

### Android NDK
App Center offers an [SDK integration](~/diagnostics/Android-NDK.md) for Android applications using the NDK to produce unmanaged code.
This integration will create Breakpad minidumps and automatically upload them to App Center for you.

### Other Applications
Once Breakpad is integrated with your application, you can [Upload Breakpad crash logs and minidumps](~/diagnostics/upload-crashes.md#upload-a-breakpad-crash-log-and-minidump) to App Center.

## Symbolicating Unmanaged Crashes

### Generating Breakpad Symbols Payload
App Center Diagnostics requires symbols to take a Breakpad minidump and generate a readable stack trace.
The uploaded symbols `.zip` must either contain `.sym` files, which are produced using the Breakpad `dump_syms` tool, or `.so` binary files.

[!INCLUDE [generate breakpad symbols payload](includes/generate-breakpad-symbols-payload.md)]

### Uploading Symbols to App Center
Symbols can be uploaded through the App Center Portal, API, or CLI.

[!INCLUDE [symbol upload ui](includes/symbol-upload-ui.md)]

The process for uploading symbols through the API involves a series of three API calls: one to allocate space on our backend, one to upload the file, and one to update the status of the upload. The body of the first API call should set `symbol_type` to `Breakpad`.

[!INCLUDE [symbol upload api](includes/symbol-upload-api.md)]

[!INCLUDE [ignoring symbols](includes/ignoring-symbols.md)]

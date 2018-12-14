---
title: Android NDK
description: Learn how to symbolicate your Android NDK crash reports
keywords: crashes, Android, NDK, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 12/13/2018
ms.topic: article
ms.assetid: 6cab50d0-b40a-4b19-9f8f-10aea4243b57
ms.service: vs-appcenter
ms.custom: analytics 
---

# Android NDK

Android NDK allows you to implement parts of your Android apps using C and C++. The stack traces from these apps may only contain memory addresses and don’t show class names, methods, file names and line numbers that are needed to read and understand the crashes. 
To get these memory addresses translated for your Android NDK app, you need to upload symbols for each build using [Google's Breakpad tool](https://github.com/google/breakpad/blob/master/docs/getting_started_with_breakpad.md)


## Symbolication

### Obtaining symbol files

1. Dump the symbols using the Breakpad toolchain as described in the [Breakpad documentation](https://chromium.googlesource.com/breakpad/breakpad/+/master/README.ANDROID#93).
2. Create a symbols.zip file with the following structure:


```
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
4. In the top right corner, click **Upload symbols** and upload the zip file
5. After the zip file is indexed by App Center, new incoming crashes will be symbolicated for you


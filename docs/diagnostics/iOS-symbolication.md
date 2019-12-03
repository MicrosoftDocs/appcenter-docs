---
title: iOS Symbolication
description: Help understanding symbolication for iOS and MacOS diagnostics in App Center
keywords: crashes, errors, iOS, MacOS, symbols, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 11/11/2019
ms.topic: article
ms.assetid: 64fe5d88-d981-42bf-8ca9-8f273aa7e2ea
ms.service: vs-appcenter
ms.custom: analytics
---

# iOS Symbolication

MacOS, tvOS and iOS crash reports show the stack traces for all running threads of your app at the time a crash occurred. The stack traces only contain memory addresses and don’t show class names, methods, file names, and line numbers that are needed to read and understand the crashes.

To get these memory addresses translated you need to upload a dSYM package to App Center, which contains all information required for symbolication. You can learn more about symbolication from Apple’s [official developer documentation](https://developer.apple.com/library/archive/technotes/tn2151/_index.html#//apple_ref/doc/uid/DTS40008184-CH1-SYMBOLICATION).

The App Center Build and Distribution service can automatically generate a valid dSYM and source map `.zip` file and upload the file to the Diagnostics service. If you use App Center to build and auto distribute your app to your end users, you don't need to manually obtain and upload the symbol files as detailed in the steps below.

## Finding the `.dSYM` bundle

1. In Xcode, open the **Window** menu, then select **Organizer**.
1. Select the **Archives** tab.
1. Select your app in the left sidebar.
1. Right-click on the latest archive and select **Show in Finder**.
1. Right-click the `.xcarchive` file in Finder and select **Show Package Contents**.
1. You should see a folder named `dSYMs` which contains your dSYM bundle.
1. Create a zip file of the dSYM bundle.

If you are using Visual Studio instead of XCode, see [Where can I find the dSYM file to symbolicate iOS crash logs?](https://docs.microsoft.com/xamarin/ios/troubleshooting/questions/symbolicate-ios-crash) to find the dSYM file.

## Uploading symbols

### App Center Portal

[!INCLUDE [symbol upload ui](includes/symbol-upload-ui.md)]

#### React Native iOS apps

To obtain symbol files for React Native iOS files, create a ZIP file with the dSYM package on your Mac and the JavaScript source map of your app. The source map should be named `index.ios.map`. The commands below will generate the source map for release builds:

```shell
react-native bundle --entry-file index.ios.js --platform ios --dev false --reset-cache --bundle-output unused.jsbundle --sourcemap-output index.ios.map
```

### App Center API

The process for uploading symbols through the API involves a series of three API calls: one to allocate space on our backend, one to upload the file, and one to update the status of the upload. The body of the first API call should set `symbol_type` to `Apple`.

[!INCLUDE [symbol upload api](includes/symbol-upload-api.md)]

### App Center CLI

You can also use the CLI to upload symbol files:

```shell
appcenter crashes upload-symbols --symbols {symbol file}
```

## Bitcode

Bitcode was introduced by Apple to allow apps sent to the App Store to be recompiled by Apple itself and apply the latest optimization. If Bitcode is enabled, the symbols generated for your app in the store will be different than the ones from your own build system.

App Center crash reporting does not completely support the symbolication of crashes from bitcode-enabled apps yet. In the meantime, we advise that you **disable bitcode**. Disabling bitcode significantly simplifies symbols management and currently does not have any known downsides for iOS apps.

### Disable bitcode for your app

1. Open your project settings by clicking on the top-level element in the Project Navigator
2. Go to the Build Settings page
3. Search for `bitcode`
4. In the result, change the value from Yes to **No**
5. Rebuild your app

With these simple steps, App Center crash reporting will behave as usual.


### Retrieve symbols for bitcode enabled apps

If you would like to keep bitcode enabled, you can download the proper dSYM files by following these steps:

1. Open the Xcode's Organizer
2. Select the specific archive of your app that you uploaded to iTunes Connect
3. Click on the "Download dSYMs" button. This step will insert the Bitcode compiled dSYM files into the original archive.
4. Upload the symbols to the corresponding app and version in App Center

If the Xcode organizer doesn't provide any new symbols, you must download the dSYM files from the iTunes Connect portal by following these steps:

1. Select your app in the iTunes Connect portal
2. Select the Activity tab on top
3. Select the build version of your app that has the missing symbols
4. Click the Download dSYM link
5. Upload the downloaded file to App Center. This file contains the symbols required for App Center to symbolicated your crashes.

## Troubleshooting symbol issues

If your crashes still appear unsymbolicated after uploading symbols and disabling bitcode, it might be because the uploaded dSYM files don't match the ones required by App Center. When you upload dSYM files, App Center matches them to the right app version based on their UUIDs.

You can double check whether your dSYM files have the right UUIDs by using a CLI tool called **dwarfdump**.

1. Find the UUID in the dSYM file:

  ```shell
  dwarfdump --u CrashProbeiOS.app.dSYM
  ```
2. The result should look something like this:

  ```text
  UUID:ADF53C85-4638-3EFF-A33C-42C13A18E915 (armv7)CrashProbeiOS.app.dSYM/Contents/Resources/DWARF/CrashProbeiOS
  UUID:D449E33D-7E74-379D-8B79-15EE104ED1DF (arm64)CrashProbeiOS.app.dSYM/Contents/Resources/DWARF/CrashProbeiOS
  ```

3. Double check if the UUID returned matches the UUIDs shown in the debug symbols dialog:

  ![App Center displays the UUID of required symbols](~/diagnostics/images/symbols-UUID.png)

[!INCLUDE [ignoring symbols](includes/ignoring-symbols.md)]


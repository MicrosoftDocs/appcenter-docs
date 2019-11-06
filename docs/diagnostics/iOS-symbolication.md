---
title: iOS Symbolication
description: Help understanding symbolication for iOS and MacOS diagnostics in App Center
keywords: crashes, errors, iOS, MacOS, symbols, symbolication
author: winnieli1208
ms.author: yuli1
ms.date: 11/01/2019
ms.topic: article
ms.assetid: 64fe5d88-d981-42bf-8ca9-8f273aa7e2ea
ms.service: vs-appcenter
ms.custom: analytics
---

# iOS Symbolication

## Overview

MacOS, tvOS and iOS crash reports show the stack traces for all running threads of your app at the time a crash occurred. The stack traces only contain memory addresses and don’t show class names, methods, file names, and line numbers that are needed to read and understand the crashes.

To get these memory addresses translated you need to upload a dSYM package to App Center, which contains all information required for symbolication. You can learn more about symbolication from Apple’s [official developer documentation](https://developer.apple.com/library/archive/technotes/tn2151/_index.html#//apple_ref/doc/uid/DTS40008184-CH1-SYMBOLICATION).

## Finding the `.dSYM` bundle

1. In Xcode, open the **Window** menu, then select **Organizer**
1. Select the **Archives** tab
1. Select your app in the left sidebar
1. Right-click on the latest archive and select **Show in Finder**
1. Right-click the `.xcarchive` file in Finder and select **Show Package Contents**
1. You should see a folder named `dSYMs` which contains your dSYM bundle

If you are using Visual Studio instead of XCode, see [Where can I find the dSYM file to symbolicate iOS crash logs?](https://docs.microsoft.com/xamarin/ios/troubleshooting/questions/symbolicate-ios-crash) to find the dSYM file.

## Uploading symbols

### App Center Portal

1. Create a ZIP file for the dSYM package on your Mac.
1. Log into App Center and select your app.
1. In the left menu, navigate to the **Diagnostics** section, then **Issues**.
1. If your application has not reported any crash yet, in the top-right corner, click **Upload symbols** and upload the zip file.
1. If your application already has reported crashes that need symbols, check the **Unsymbolicated** tab and there should be a version group with missing symbols, click on it to reveal the menu to upload the zip file.
1. After the symbols are indexed by App Center, crashes will be symbolicated for you.

#### React Native iOS apps

To obtain symbol files for React Native iOS files, create a ZIP file with the dSYM package on your Mac and the JavaScript source map of your app. The source map should be named `index.ios.map`. The commands below will generate the source map for release builds:

```shell
react-native bundle --entry-file index.ios.js --platform ios --dev false --reset-cache --bundle-output unused.jsbundle --sourcemap-output index.ios.map
```

The App Center Build and Distribution service can automatically generate a valid dSYM and source map `.zip` file and upload the file to the Diagnostics service. If you use the App Center to build and auto distribute your app to your end users, you don't need to manually obtain and upload the symbol files as detailed in the steps above.

### App Center API

1. Trigger a `POST` request to the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_create).
This call allocates space on our backend for your symbols and returns a `symbol_upload_id` and an `upload_url` property. The body of the request should specify the `symbol_type` as `Apple`.

```shell
curl -X POST 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{ "symbol_type": "Apple" }'
```

2. Using the `upload_url` property returned from the first step, make a `PUT` request with the header: `"x-ms-blob-type: BlockBlob"` and supply the location of your symbols on disk.  This call uploads the symbols to our backend storage accounts. Learn more about [PUT Blob request headers ](https://docs.microsoft.com/rest/api/storageservices/put-blob#request-headers-all-blob-types).

```shell
curl -X PUT '{upload_url}' \
    -H 'x-ms-blob-type: BlockBlob' \
    --upload-file '{path to file}'
```

3. Make a `PATCH` request to  the [symbol_uploads API](https://openapi.appcenter.ms/#/crash/symbolUploads_complete) using the `symbol_upload_id` property returned from the first step. In the body of the request, specify whether you want to set the status of the upload to `committed` (successfully completed) the upload process, or `aborted` (unsuccessfully completed).

```shell
curl -X PATCH 'https://api.appcenter.ms/v0.1/apps/{owner_name}/{app_name}/symbol_uploads/{symbol_upload_id}' \
    -H 'accept: application/json' \
    -H 'X-API-Token: {API TOKEN}' \
    -H 'Content-Type: application/json' \
    -d '{ "status": "committed" }'
```

> [!NOTE]
> The symbol uploads API will not work for symbols files that are 256MB or larger in size. Please use the App Center CLI to upload these files. You can install the App Center CLI by following the instructions in our [App Center CLI repo](https://github.com/microsoft/appcenter-cli).

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





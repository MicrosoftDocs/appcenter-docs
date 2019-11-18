---
title: Preparing XCUITest in a Xcode project
description: How to build a Xcode project and test an iOS app in App Center Test
keywords: test cloud, xcuitest, xcodeproj, test
author: oddj0b
ms.author: vigimm
ms.date: 11/20/2019
ms.topic: article
ms.assetid: 830AE437-226B-4207-B23F-40CE74477983
ms.service: vs-appcenter
ms.custom: test
---

```shell
rm -rf DerivedData
xcrun xcodebuild build-for-testing \
  -configuration Debug \
  -project YOUR_XCODEPROJ \
  -sdk iphoneos \
  -scheme YOUR_APP_SCHEME \
  -derivedDataPath DerivedData
```

This will build your app and an XCUITest bundle into the `DerivedData/Build` directory. Your app and XCUITest bundle will be located in the `DerivedData/Build/Products/Debug-iphoneos/` directory.

`YOUR_XCODEPROJ` should point to a **.xcodeproj** file, likely titled `PROJECT_NAME.xcodeproj`. `YOUR_APP_SCHEME` should be the scheme you use to build your application. By default, it is usually the name of your application. To see the list of schemes defined in your Xcode project, run:

```shell
xcrun xcodebuild -list
```

## Uploading Tests to App Center

Once a test suite is prepared, next [setup a test run](~/test-cloud/starting-a-test-run.md) to upload and run your tests.

Here is a sample script you might use to submit your XCUITest tests.

```shell
# Upload your test to App Center
appcenter test run xcuitest \
  --app "APP_ID" \
  --devices "DEVICE_SET_ID" \
  --test-series "master" \
  --locale "en_US" \
  --build-dir DerivedData/Build/Products/Debug-iphoneos
```
For a concrete example of submitting tests to App Center, see [this shell script that submits tests to App Center](https://github.com/Microsoft/AppCenter-Test-XCUITest-Extensions/blob/master/bin/make/appcenter.sh).

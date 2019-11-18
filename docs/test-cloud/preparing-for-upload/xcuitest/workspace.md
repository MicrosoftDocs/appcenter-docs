---
title: Preparing XCUITest in a Xcode workspace
description: How to build a Xcode workspace and test an iOS app in App Center Test
keywords: test cloud, xcuitest, xcworkspace, test
author: oddj0b
ms.author: vigimm
ms.date: 11/20/2019
ms.topic: article
ms.assetid: 481E97F6-3013-498B-B533-1DBA020A28D9
ms.service: vs-appcenter
ms.custom: test
---

```shell
rm -rf DerivedData
xcrun xcodebuild build-for-testing \
-configuration Debug \
-workspace YOUR_WORKSPACE \
-sdk iphoneos \
-scheme YOUR_APPSCHEME \
-deriveData DerivedData
```

This will build your app and an XCUITest bundle into the `DerivedData/Build` directory. Your app and XCUITest bundle will be located in the `DerivedData/Build/Products/Debug-iphoneos/` directory.

`YOUR_WORKSPACE` should point to a **.xcworkspace** file, likely titled `PROJECT_NAME.xcworkspace`. `YOUR_APP_SCHEME` should be the scheme you use to build your application. By default, it is usually the name of your application. To see the list of schemes defined in your Xcode project, run:

```shell
xcrun xcodebuild -list
```

## Uploading Tests to App Center

Once a test suite is prepared, next [setup a test run](~/test-cloud/starting-a-test-run.md) to upload and run your tests.

Here is a sample script you might use to submit your XCUITest tests.

```shell
# Generate an XCUITest bundle and your iOS application as described above.

# Upload your test to App Center
appcenter test run xcuitest \
  --app "APP_ID" \
  --devices "DEVICE_SET_ID" \
  --test-series "master" \
  --locale "en_US" \
  --build-dir DerivedData/Build/Products/Debug-iphoneos
```
For a concrete example of submitting tests to App Center, see [this shell script that submits tests to App Center](https://github.com/Microsoft/AppCenter-Test-XCUITest-Extensions/blob/master/bin/make/appcenter.sh).

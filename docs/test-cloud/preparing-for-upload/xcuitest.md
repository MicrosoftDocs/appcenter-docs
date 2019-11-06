---
title: Preparing XCUITest Tests for Upload
description: How to upload XCUITests to App Center Test Cloud
keywords: test cloud
author: oddj0b
ms.author: vigimm
ms.date: 10/15/2019
ms.topic: article
ms.assetid: 64de4cef-207e-48fb-a1f7-c3f04d69a1bb
ms.service: vs-appcenter
ms.custom: test
---

# Preparing XCUITest Tests for Upload

The steps necessary to prepare an app and its corresponding test suite for upload to App Center vary depending on the test framework. The section below provides instructions for preparing XCUITest tests for upload to App Center Test.

## Requirements

* Xcode >= 9.4.1
* iOS >= 9.0

## Build For Testing

To run a test in App Center, you need to build your application and an XCUITest bundle. To do this, run the following command from the root of your application project directory:

```shell
rm -rf DerivedData
xcrun xcodebuild build-for-testing \
  -configuration Debug \
  -workspace YOUR_WORKSPACE \
  -sdk iphoneos \
  -scheme YOUR_APP_SCHEME \
  -derivedDataPath DerivedData
```

This will build your app and an XCUITest bundle into the `DerivedData/Build` directory. Your app and XCUITest bundle will be located in the `DerivedData/Build/Products/Debug-iphoneos/` directory.

`YOUR_WORKSPACE` should point to a **.xcworkspace** file, likely titled `PROJECT_NAME.xcworkspace`. `YOUR_APP_SCHEME` should be the scheme you use to build your application. By default, it is usually the name of your application. To see the list of schemes defined in your Xcode project, run:

```shell
xcrun xcodebuild -list
```

## Uploading Tests to App Center

Once a test suite is prepared, next [setup a test run](~/test-cloud/starting-a-test-run.md) to upload and run your tests.

Here is a sample script you might use to clean, build and submit your XCUITest tests.

```shell
# Generate an XCUITest bundle and your iOS application as described above.
rm -rf DerivedData
xcrun xcodebuild build-for-testing -derivedDataPath DerivedData -scheme YOUR_APP_SCHEME

# Upload your test to App Center
appcenter test run xcuitest \
  --app "APP_ID" \
  --devices "DEVICE_SET_ID" \
  --test-series "master" \
  --locale "en_US" \
  --build-dir DerivedData/Build/Products/Debug-iphoneos
```
For a concrete example of submitting tests to App Center, see [this shell script that submits tests to App Center](https://github.com/Microsoft/AppCenter-Test-XCUITest-Extensions/blob/master/bin/make/appcenter.sh).

## Additional Screenshots and Test Steps

At the end of each test method, a label and screenshot are automatically generated for the test report. Labels and screenshots are displayed in the App Center Test Report as separate _Test Steps_.

### Activities

You can generate additional labels and screenshots for a test method by grouping your test code using Apple's `Activities`. For more information, see [Grouping Tests into Substeps with Activities](https://developer.apple.com/documentation/xctest/activities_and_attachments/grouping_tests_into_substeps_with_activities).

_Code snippet to wrap test code in an Activity_

```obj-c
    [XCTContext
     runActivityNamed:title
     block:^(id<XCTActivity>  _Nonnull activity) {
         // test code
     }];

```

```swift
        XCTContext.runActivity(named: title) { (activity) in
            // test code
        }
```
### Manual Screenshots

A screenshot is automatically generated for the test report at the end of each `Activity`. You can record a screenshot at a different point within an `Activity` by [taking a screenshot using XCUIScreen](https://developer.apple.com/documentation/xctest/xcuiscreen), then [creating an attachment with XCTAttachment](https://developer.apple.com/documentation/xctest/xctattachment), and adding it to the current `Activity`. This screenshot will be displayed in App Center Test Reports instead of the default screenshot from the end of the `Activity`.

_Code snippet to generate and attach a screenshot in an Activity_

```obj-c
         XCUIScreenshot *screenshot = [[XCUIScreen mainScreen] screenshot];
         XCTAttachment *attachment;
         attachment = [XCTAttachment attachmentWithScreenshot:screenshot];
         [attachment setLifetime:XCTAttachmentLifetimeKeepAlways];
         [activity addAttachment:attachment];
```

```swift
            let screenshot = XCUIScreen.main.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.lifetime = .keepAlways
            activity.add(attachment)
```
